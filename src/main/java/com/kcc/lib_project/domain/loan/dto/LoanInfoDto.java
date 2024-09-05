package com.kcc.lib_project.domain.loan.dto;

import com.kcc.lib_project.domain.loan.vo.LoanVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@ToString
public class LoanInfoDto {

    private final String callNumber;
    private final String title;
    private final String author;
    private final LocalDate startedAt;
    private final LocalDate endedAt;
    private final Integer extentionCount;
    private final Boolean isReturned;

    public static LoanInfoDto from(LoanVo loanVo) {
        return new LoanInfoDto(
                loanVo.getOwnBookVo().getCallNumber(),
                loanVo.getOwnBookVo().getBookVo().getTitle(),
                loanVo.getOwnBookVo().getBookVo().getAuthor(),
                loanVo.getStartedAt(),
                loanVo.getEndedAt(),
                loanVo.getExtentionCount(),
                loanVo.getIsReturned()
        );
    }
}
