package com.kcc.lib_project.domain.loan.repository;

import com.kcc.lib_project.domain.loan.vo.LoanVo;

import java.util.List;
import java.util.Optional;

public interface LoanRepository {

    Optional<LoanVo> selectLoanByCallNumber(String callNumber);
    List<LoanVo> selectLoanByPageAndTypeAndKeyword(String type, String keyword, int page, int limit, long offset, Long userId);
    int countByPageAndTypeAndKeyword(String type, String keyword, Long userId);
}
