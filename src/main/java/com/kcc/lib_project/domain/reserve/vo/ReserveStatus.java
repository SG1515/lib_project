package com.kcc.lib_project.domain.reserve.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ReserveStatus {

    WAITING("대여 대기"), CANCELED("대여 취소"), COMPLETED("대여 완료");

    private String status;

    public static String toKorean(String status) {
        if (status.equals("WAITING")) {
            return "대여 대기";
        } else if (status.equals("CANCELED")) {
            return "대여 취소";
        } else if (status.equals("COMPLETED")) {
            return "대여 완료";
        }
        throw new IllegalArgumentException("알 수 없는 ReserveStatus입니다.");
    }
}
