package com.hublot.store.Rest;

public class ErrorException extends Exception {

    private Error error;

    public ErrorException(Error error) {
        super(error.getMessage());
        this.error = error;
    }

    public static ErrorException convert(Exception exception) {
        if (exception instanceof ErrorException) {
            return (ErrorException) exception;
        } else {
            Error error = Error.Unknow_Error;
            error.setMessage(exception.getMessage());
            ErrorException errorException = new ErrorException(error);
            return errorException;
        }
    }

    public Error getError() {
        return error;
    }

    @Override
    public String getMessage() {
        return error.getMessage();
    }

}
