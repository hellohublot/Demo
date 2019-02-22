package com.hublot.store.Rest;

public enum Error {

    None(0, ""),

    Unknow_Error(-1, "发生了一个未知错误"),

    Unknow_Upload_File(-2, "请选择上传一个 ipa 文件"),

    Unknow_Upload_Ipa(-3, "请确保上传的文件是 ipa 类型"),

    Unknow_Upload_cantUnzip(-4, "不能解压该 ipa 文件"),

    Unknow_Upload_cantFindInfo(-5, "找不到该 ipa 文件的 Info.plist 文件"),

    Unknow_Upload_cantParseInfo(-6, "不能正常解析该 ipa 文件的 Info.plist 文件"),

    Unknow_Upload_cantParseInfoIcon(-7, "不能找到 ipa 文件的图标文件"),

    ;

    Error(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    Error(String message) {
        this.code = -1;
        this.message = message;
    }

    private Integer code;

    private String message;

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
