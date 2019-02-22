package com.hublot.store.Common;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

@Configuration
public class ConfigLoader implements WebMvcConfigurer {



    public static String storeFloderPath = "";

    public static String convertFloder(String path) {
        String url = path.replaceFirst(workspacePath(), "");
        return url;
    }






    private final static String storeFloderName = "store";

    private static String workspacePath() {
        String rootPath = "";
        try {
            rootPath = new File("").getCanonicalPath();
        } catch (Exception e) {
        }
        return rootPath;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        storeFloderPath = workspacePath() + File.separator + storeFloderName;

        String fromPath = "file:" + storeFloderPath + File.separator;
        String toPath = File.separator + storeFloderName + File.separator + "**";
        registry.addResourceHandler(toPath).addResourceLocations(fromPath);
    }
}
