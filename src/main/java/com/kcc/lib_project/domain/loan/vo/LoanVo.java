package com.kcc.lib_project.domain.loan.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LoanVo {

    private Long loanId;
    private LocalDate startedAt;
    private LocalDate endedAt;
    private Boolean isReturned;
    private Integer extentionCount;
    private Long userId;
    private Long callNumber;
}
