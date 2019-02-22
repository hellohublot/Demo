package com.hublot.store.Controller;


import com.hublot.store.Model.StoreModel;
import com.hublot.store.Service.FileUploadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;


@Controller
public class StoreController {

    private final static Logger LOGGER = LoggerFactory.getLogger(StoreController.class);

    @RequestMapping("/")
    public String index(Model model) {
        return list(model);
    }

    @RequestMapping("create")
    public String create() {
        return "create";
    }

    @RequestMapping("upload")
    public String create(@RequestParam("file") MultipartFile multipartFile) {
        try {
            FileUploadService.create(multipartFile);
        } catch (Exception e) {
        }
        return "redirect:";
    }

    @RequestMapping("list")
    public String list(Model model) {
        try {
            model.addAttribute("list", FileUploadService.modelIndexList());
        } catch (Exception e) {

        }
        return "list";
    }

    public String packServiceString(String flodername, String domainString) {
        String servicePath = domainString + "/createService/" + flodername;
        servicePath = "itms-services://?action=download-manifest&url=" + servicePath;
        return servicePath;
    }

    @RequestMapping("detail/{flodername}")
    public String detail(@PathVariable("flodername") String flodername, HttpServletRequest request, Model model) {
        try {
            StoreModel storeModel = FileUploadService.modelDetail(flodername);
            String domainString = FileUploadService.domainString(request);
            String servicePath = packServiceString(flodername, domainString);
            model.addAttribute("item", storeModel);
            model.addAttribute("servicePath", servicePath);
        } catch (Exception e) {
        }
        return "detail";
    }

    @RequestMapping("createService/{flodername}")
    public void service(@PathVariable("flodername") String flodername, HttpServletRequest request, HttpServletResponse response) {
        String domainString = FileUploadService.domainString(request);
        try {
            StoreModel storeModel = FileUploadService.modelDetail(flodername);
            String serviceString = FileUploadService.packServiceString(storeModel, domainString);
            response.setHeader("Content-Type", "application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("service.plist", "UTF-8"));
            response.getOutputStream().write(serviceString.getBytes());
        } catch (Exception e) {
        }
    }

    @RequestMapping("createQRCode/{flodername}")
    public void createQRCode(@PathVariable("flodername") String flodername, HttpServletRequest request, HttpServletResponse response) {
        String domainString = FileUploadService.domainString(request);
        String servicePath = packServiceString(flodername, domainString);
        try {
            FileUploadService.outputQRCodeImage(servicePath, response, 300, 300);
        } catch (Exception e) {
        }
    }

}
