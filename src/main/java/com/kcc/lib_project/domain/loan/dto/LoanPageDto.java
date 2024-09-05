package com.kcc.lib_project.domain.loan.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class LoanPageDto {

    private List<LoanInfoDto> loanInfoDtos;
    private int loanStartPage;
    private int loanEndPage;
    private int loanRealEndPage;
    private int loanTotalCount;

    @Builder
    public LoanPageDto(List<LoanInfoDto> loanInfoDtos, int loanStartPage, int loanEndPage, int loanRealEndPage, int loanTotalCount) {
        this.loanInfoDtos = loanInfoDtos;
        this.loanStartPage = loanStartPage;
        this.loanEndPage = loanEndPage;
        this.loanRealEndPage = loanRealEndPage;
        this.loanTotalCount = loanTotalCount;
    }
}
