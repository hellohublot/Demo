package com.hublot.store.Rest;

public class ResultFactory {

    public static Result success(Object object) {
        Result result = new Result(Error.None, object);
        return result;
    }

    public static Result failed(Error error) {
        Result result = new Result(error, "");
        return result;
    }

}
