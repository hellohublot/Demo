package com.hublot.store.Service;

import com.hublot.store.Model.StoreModel;
import org.thymeleaf.util.StringUtils;

import java.net.URLEncoder;

public class FileManagerService {

//    public static String accessKey = "aB760aC4UNn7fIIu3P9EpYMZjX-19MuhS3Msrsvl";
//    public static String secretKey = "4p2Rj7Lt3pBWR9J_QGRdHCGs40eht_kE00epn2Qq";
//    public static String bucketname = "hublot";
//    public static String bucketdomain = "pcth5szkt.bkt.clouddn.com";
//
//    public static void upload(StoreModel storeModel) throws Exception {
//        Configuration config = new Configuration(Zone.autoZone());
//
//        UploadManager uploadManager = new UploadManager(config);
//        String localFilePath = storeModel.getIpaPath();
//        String key = null;
//
//        Auth auth = Auth.create(accessKey, secretKey);
//        String upToken = auth.uploadToken(bucketname);
//
//        Response response = uploadManager.put(localFilePath, key, upToken);
//        DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
//
//        storeModel.setDownloadname(putRet.key);
//
//    }
//
//    public static void download(StoreModel storeModel) throws Exception {
//        String fileName = storeModel.getDownloadname();
//        String domainOfBucket = "http://" + bucketdomain;
//        String encodedFileName = URLEncoder.encode(fileName, "utf-8");
//        String publicUrl = String.format("%s/%s", domainOfBucket, encodedFileName);
//
//        Auth auth = Auth.create(accessKey, secretKey);
//        long expireInSeconds = 120;
//        String finalUrl = auth.privateDownloadUrl(publicUrl, expireInSeconds);
//
//        finalUrl = StringUtils.escapeXml(finalUrl);
//
//        storeModel.setDownloadpath(finalUrl);
//    }

}
