package com.kcc.lib_project.domain.reserve.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
public class ReservePageDto {

    private List<ReserveInfoDto> reserveInfoDtos;
    private int reserveStartPage;
    private int reserveEndPage;
    private int reserveRealEndPage;
    private int reserveTotalCount;

    @Builder
    public ReservePageDto(int reserveEndPage, List<ReserveInfoDto> reserveInfoDtos, int reserveRealEndPage, int reserveStartPage, int reserveTotalCount) {
        this.reserveEndPage = reserveEndPage;
        this.reserveInfoDtos = reserveInfoDtos;
        this.reserveRealEndPage = reserveRealEndPage;
        this.reserveStartPage = reserveStartPage;
        this.reserveTotalCount = reserveTotalCount;
    }
}
