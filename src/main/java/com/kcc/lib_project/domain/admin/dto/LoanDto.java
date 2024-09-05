package com.kcc.lib_project.domain.admin.dto;


import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
public class LoanDto {

    private Long loanId;
    private LocalDate startedAt;
    private LocalDate endedAt;
    private int isReturned;
    private int extentionCount;
    private Long userId;
    private String callNumber;

    @Builder
    public LoanDto (Long loanId, LocalDate startedAt, LocalDate endedAt, int isReturned, int extentionCount, Long userId, String callNumber) {
        this.loanId = loanId;
        this.startedAt = startedAt;
        this.endedAt = endedAt;
        this.isReturned = isReturned;
        this.extentionCount = extentionCount;
        this.userId =  userId;
        this.callNumber = callNumber;
    }


}
