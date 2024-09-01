package com.kcc.lib_project.global.exception.type;

import lombok.Getter;

@Getter
public class BaseException extends RuntimeException{

    private final String message;

    public BaseException(String message) {
        this.message = message;
    }
}
