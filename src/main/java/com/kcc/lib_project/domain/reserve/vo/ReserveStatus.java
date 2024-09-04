package com.kcc.lib_project.domain.reserve.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ReserveStatus {

    WAITING("대여 대기"), CANCELED("대여 취소"), COMPLETED("대여 완료");

    private String status;
}
