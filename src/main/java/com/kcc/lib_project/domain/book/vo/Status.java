package com.kcc.lib_project.domain.book.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Status {

    AVAILABLE("대출가능"),
    UNAVAILABLE("대출중"),
    RESERVED("예약중"),
    LOST("분실");

    private final String status;
}
