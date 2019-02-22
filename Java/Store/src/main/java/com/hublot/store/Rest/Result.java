package com.hublot.store.Rest;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Result<T> {

    @JsonIgnore
    private Error error;

    private Integer code;

    private String message;

    private T data;

    Result(Error error, T data) {
        this.error = error;
        this.data = data;
    }

    public Boolean existError() {
        return error != null;
    }

    public Error getError() {
        return error;
    }

    public T getData() {
        return data;
    }

    public Integer getCode() {
        return error.getCode();
    }

    public String getMessage() {
        return error.getMessage();
    }

}
