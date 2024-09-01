package com.kcc.lib_project.domain.book.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Status {

    AVAILABLE("대출가능"),
    UNAVAILABLE("대출중");

    private final String status;

    public static String toKorean(String status) {
        if (status.equals("AVAILABLE")) {
            return "대출가능";
        } else if (status.equals("UNAVAILABLE")) {
            return "대출중";
        }
        throw new IllegalArgumentException("알 수 없는 Status입니다.");
    }
}
