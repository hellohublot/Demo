package com.hublot.store.Service;

import com.alibaba.fastjson.JSON;
import com.dd.plist.NSDictionary;
import com.dd.plist.PropertyListParser;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.hublot.store.Common.ConfigLoader;
import com.hublot.store.Model.StoreModel;
import com.hublot.store.Rest.Error;
import com.hublot.store.Rest.ErrorException;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class FileUploadService {

    private final static String rootFloder = ConfigLoader.storeFloderPath;

    private static String contentType = "ipa";

    private static Integer randomValue = 10000;

    private static String jsonName = "Info.json";

    public static Object create(MultipartFile multipartFile) throws Exception {
        File zipIpaFile = transfer(multipartFile);
        File ipaFloder = unzip(zipIpaFile);
        File infoFile = findInfo(ipaFloder);
        StoreModel storeModel = packInfo(infoFile);
        String fileSize = String.format("%.2f", zipIpaFile.length() / 1000.0 / 1000.0);
        storeModel.setFileSize(fileSize);
        storeModel.setIpaPath(zipIpaFile.getPath());
        writeStoreModel(storeModel);
        return storeModel;
    }

    public static File transfer(MultipartFile multipartFile) throws Exception {
        if (multipartFile.isEmpty() || multipartFile.getSize() <= 0) {
            throw new ErrorException(Error.Unknow_Upload_File);
        }
        String filename = multipartFile.getOriginalFilename();
        filename = filename.length() > 0 ? filename : (contentType + "." + contentType);
        String flodername = String.valueOf(new Date().getTime()) + String.valueOf(randomValue + (int)(Math.random() * randomValue));
        String filepath = rootFloder + File.separator + flodername + File.separator + filename;
        File file = new File(filepath);
        if (!file.getParentFile().isDirectory()) {
            file.getParentFile().mkdirs();
        }
        multipartFile.transferTo(file);
        return file;
    }

    public static File unzip(File zipfile) throws IOException {
        ZipFile zip = new ZipFile(zipfile);
        String flodername = zipfile.getName().substring(0, zipfile.getName().lastIndexOf("."));
        File unzipFloder = new File(zipfile.getParent() + File.separator + flodername);
        if (!unzipFloder.isDirectory()) {
            unzipFloder.mkdirs();
        }
        Enumeration<?> zipEnum = zip.entries();
        while (zipEnum.hasMoreElements()) {
            ZipEntry entryItem = (ZipEntry) zipEnum.nextElement();
            String itemName = entryItem.getName();
            InputStream input = zip.getInputStream(entryItem);
            File outputFile = new File(unzipFloder.getPath() + File.separator + itemName);

            if (entryItem.isDirectory()) {
                // 如果是文件夹， 不写
                continue;
            } else {
                // 反之则是文件，判断目录是否存在，创建文件夹
                File parentFile = outputFile.getParentFile();
                if (!parentFile.exists()) {
                    parentFile.mkdirs();
                }
            }

            OutputStream output = new FileOutputStream(outputFile);
            byte[] buffer = new byte[1024 * 8];
            int readLine = 0;
            while((readLine = input.read(buffer, 0, buffer.length)) != - 1) {
                output.write(buffer, 0, readLine);
            }
        }
        return unzipFloder;
    }

    public static File findInfo(File ipaFloder) throws Exception {
        ArrayList<File> listFiles = listFiles(ipaFloder);
        for (File file: listFiles) {
            if (file.getPath().endsWith(".app/Info.plist")) {
                return file;
            }
        }
        throw new ErrorException(Error.Unknow_Upload_cantFindInfo);
    }

    public static ArrayList<File> listFiles(File fromfile) throws Exception {
        ArrayList fileList = new ArrayList<File>();
        File[] outFileList = fromfile.listFiles();
        for (File outFile: outFileList) {
            fileList.add(outFile);
            if (outFile.isDirectory()) {
                fileList.addAll(listFiles(outFile));
            }
        }
        return fileList;
    }

    public static StoreModel packInfo(File infoFile) throws Exception {
        HashMap rootMap = ((NSDictionary) PropertyListParser.parse(infoFile)).getHashMap();

        String identifier = rootMap.get("CFBundleIdentifier").toString();
        Object displaynameObject = rootMap.get("CFBundleDisplayName");
        if (displaynameObject == null) {
            displaynameObject = rootMap.get("CFBundleName");
        }
        String displayname = displaynameObject.toString();
        String iconname = findIcon(rootMap);
        ArrayList<File> fileLists = listFiles(infoFile.getParentFile());
        String iconpath = "";
        for (File file: fileLists) {
            if (file.getName().startsWith(iconname)) {
                iconpath = file.getPath();
            }
        }
        String shortVersionString = rootMap.get("CFBundleShortVersionString").toString();
        String buildVersionString = rootMap.get("CFBundleVersion").toString();
        String minSystemVersion = rootMap.get("MinimumOSVersion").toString();

        StoreModel storeModel = new StoreModel();
        storeModel.setIdentifier(identifier);
        storeModel.setDisplayname(displayname);
        storeModel.setIconpath(iconpath);
        storeModel.setShortVersionString(shortVersionString);
        storeModel.setBuildVersionString(buildVersionString);
        storeModel.setMinSystemVersion(minSystemVersion);
        storeModel.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        return storeModel;
    }

    public static String findIcon(HashMap rootMap) throws Exception {
        String iconname = "";
        HashMap iconiPhoneMap = ((NSDictionary) rootMap.get("CFBundleIcons")).getHashMap();
        HashMap iconIpadMap = ((NSDictionary) rootMap.get("CFBundleIcons~ipad")).getHashMap();
        ArrayList<HashMap<String, Object>> iconMapList = new ArrayList();
        iconMapList.add(iconiPhoneMap);
        iconMapList.add(iconIpadMap);
        for (HashMap iconMap: iconMapList) {
            HashMap primaryMap = ((NSDictionary) iconMap.get("CFBundlePrimaryIcon")).getHashMap();
            iconname = primaryMap.get("CFBundleIconName").toString();
        }
        return iconname;
    }

    public static String packServiceString(StoreModel storeModel, String domainString) throws Exception {
        String tepmpleteString = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n" +
                "<plist version=\"1.0\">\n" +
                "<dict>\n" +
                "\t<key>items</key>\n" +
                "\t<array>\n" +
                "\t\t<dict>\n" +
                "\t\t\t<key>assets</key>\n" +
                "\t\t\t<array>\n" +
                "\t\t\t\t<dict>\n" +
                "\t\t\t\t\t<key>kind</key>\n" +
                "\t\t\t\t\t<string>software-package</string>\n" +
                "\t\t\t\t\t<key>url</key>\n" +
                "\t\t\t\t\t<string>%s</string>\n" +
                "\t\t\t\t</dict>\n" +
                "\t\t\t\t<dict>\n" +
                "\t\t\t\t\t<key>kind</key>\n" +
                "\t\t\t\t\t<string>full-size-image</string>\n" +
                "\t\t\t\t\t<key>needs-shine</key>\n" +
                "\t\t\t\t\t<false/>\n" +
                "\t\t\t\t\t<key>url</key>\n" +
                "\t\t\t\t\t<string>%s</string>\n" +
                "\t\t\t\t</dict>\n" +
                "\t\t\t\t<dict>\n" +
                "\t\t\t\t\t<key>kind</key>\n" +
                "\t\t\t\t\t<string>display-image</string>\n" +
                "\t\t\t\t\t<key>needs-shine</key>\n" +
                "\t\t\t\t\t<false/>\n" +
                "\t\t\t\t\t<key>url</key>\n" +
                "\t\t\t\t\t<string>%s</string>\n" +
                "\t\t\t\t</dict>\n" +
                "\t\t\t</array>\n" +
                "\t\t\t<key>metadata</key>\n" +
                "\t\t\t<dict>\n" +
                "\t\t\t\t<key>bundle-identifier</key>\n" +
                "\t\t\t\t<string>%s</string>\n" +
                "\t\t\t\t<key>bundle-version</key>\n" +
                "\t\t\t\t<string>%s</string>\n" +
                "\t\t\t\t<key>kind</key>\n" +
                "\t\t\t\t<string>software</string>\n" +
                "\t\t\t\t<key>subtitle</key>\n" +
                "\t\t\t\t<string>%s</string>\n" +
                "\t\t\t\t<key>title</key>\n" +
                "\t\t\t\t<string>%s</string>\n" +
                "\t\t\t</dict>\n" +
                "\t\t</dict>\n" +
                "\t</array>\n" +
                "</dict>\n" +
                "</plist>\n";
        String serviceString = String.format(tepmpleteString,
                domainString + ConfigLoader.convertFloder(storeModel.getIpaPath()),
                domainString + ConfigLoader.convertFloder(storeModel.getIconpath()),
                domainString + ConfigLoader.convertFloder(storeModel.getIconpath()),
                storeModel.getIdentifier(),
                storeModel.getShortVersionString(),
                storeModel.getDisplayname(),
                storeModel.getDisplayname());
        return serviceString;
    }

    public static void writeStoreModel(StoreModel storeModel) throws Exception {
        File ipaFilePath = new File(storeModel.getIpaPath());
        File ipaFloderPath = ipaFilePath.getParentFile();
        String jsonModelPath = ipaFloderPath.getPath() + File.separator + jsonName;
        File jsonModelFile = new File(jsonModelPath);


        // 转换后进行保存
        storeModel.setFlodername(ipaFloderPath.getName());
        storeModel.setIpaPath(ConfigLoader.convertFloder(storeModel.getIpaPath()));
        storeModel.setIconpath(ConfigLoader.convertFloder(storeModel.getIconpath()));
        String jsonString = JSON.toJSONString(storeModel);
        FileOutputStream outputStream = new FileOutputStream(jsonModelFile);
        outputStream.write(jsonString.getBytes());
    }

    public static StoreModel modelDetail(String flodername) throws Exception {
        File rootFloder = new File(FileUploadService.rootFloder);
        String modelPath = (rootFloder.getAbsolutePath() + File.separator + flodername) + File.separator + jsonName;
        File modelFile = new File(modelPath);
        if (modelFile.exists() == false) {
            return null;
        }
        FileInputStream inputStream = new FileInputStream(modelFile);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        byte[] buffer = new byte[1024 * 8];
        ArrayList byteList = new ArrayList<Byte>();
        String readLine = "";
        StringBuilder modelString = new StringBuilder();
        while((readLine = bufferedReader.readLine()) != null) {
            modelString.append(readLine);
        }
        StoreModel storeModel = JSON.parseObject(modelString.toString(), StoreModel.class);
        return storeModel;
    }

    public static List<StoreModel> modelIndexList() throws Exception {
        File rootFloder = new File(FileUploadService.rootFloder);
        File[] FloderList = rootFloder.listFiles();
        ArrayList<StoreModel> storeModelList = new ArrayList<StoreModel>();
        for (File floder: FloderList) {
            StoreModel storeModel = modelDetail(floder.getName());
            if (storeModel != null) {
                storeModelList.add(storeModel);
            }
        }
        Collections.sort(storeModelList, new Comparator<StoreModel>() {
            @Override
            public int compare(StoreModel one, StoreModel other) {
                return other.getFlodername().compareTo(one.getFlodername());
            }
        });
        return storeModelList;
    }

    public static String domainString(HttpServletRequest request) {
        int endIndex = request.getRequestURL().length() - request.getRequestURI().length();
        String domainString = request.getRequestURL().substring(0, endIndex);
        return domainString;
    }

    public static void outputQRCodeImage(String message, HttpServletResponse response, int width, int height) throws IOException {
        ServletOutputStream stream = null;
        try {
            stream = response.getOutputStream();
            QRCodeWriter writer = new QRCodeWriter();
            BitMatrix m = writer.encode(message, BarcodeFormat.QR_CODE, height, width);
            MatrixToImageWriter.writeToStream(m, "png", stream);
        } catch (Exception e) {
        } finally {
            if (stream != null) {
                stream.flush();
                stream.close();
            }
        }
    }

}
