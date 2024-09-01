package com.kcc.lib_project.domain.loan.repository;

import com.kcc.lib_project.domain.loan.vo.LoanVo;

import java.util.Optional;

public interface LoanRepository {

    Optional<LoanVo> selectLoanByCallNumber(String callNumber);
}
