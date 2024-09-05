package com.kcc.lib_project.domain.book.dto;

import com.kcc.lib_project.domain.loan.dto.LoanInfoDto;
import com.kcc.lib_project.domain.reserve.dto.ReserveInfoDto;
import lombok.*;

import java.util.List;

@Data
@NoArgsConstructor
@ToString
public class BookLoanReservePageInfoDto {

    private List<LoanInfoDto> loanInfoDtos;
    private List<ReserveInfoDto> reserveInfoDtos;

    private int loanCurrentPage;
    private int loanStartPage;
    private int loanEndPage;
    private int loanTotalCount;
    private int loanRealEndPage;

    private int reserveCurrentPage;
    private int reserveStartPage;
    private int reserveEndPage;
    private int reserveTotalCount;
    private int reserveRealEndPage;

    @Builder
    public BookLoanReservePageInfoDto(int loanCurrentPage, int loanEndPage, List<LoanInfoDto> loanInfoDtos, int loanRealEndPage, int loanStartPage, int loanTotalCount, int reserveCurrentPage, int reserveEndPage, List<ReserveInfoDto> reserveInfoDtos, int reserveRealEndPage, int reserveStartPage, int reserveTotalCount) {
        this.loanCurrentPage = loanCurrentPage;
        this.loanEndPage = loanEndPage;
        this.loanInfoDtos = loanInfoDtos;
        this.loanRealEndPage = loanRealEndPage;
        this.loanStartPage = loanStartPage;
        this.loanTotalCount = loanTotalCount;
        this.reserveCurrentPage = reserveCurrentPage;
        this.reserveEndPage = reserveEndPage;
        this.reserveInfoDtos = reserveInfoDtos;
        this.reserveRealEndPage = reserveRealEndPage;
        this.reserveStartPage = reserveStartPage;
        this.reserveTotalCount = reserveTotalCount;
    }
}
