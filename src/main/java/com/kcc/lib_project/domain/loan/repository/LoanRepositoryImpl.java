package com.kcc.lib_project.domain.loan.repository;

import com.kcc.lib_project.domain.loan.mapper.LoanMapper;
import com.kcc.lib_project.domain.loan.vo.LoanVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class LoanRepositoryImpl implements LoanRepository {

    private final LoanMapper loanMapper;

    @Override
    public Optional<LoanVo> selectLoanByCallNumber(String callNumber) {
        return loanMapper.selectLoanByCallNumber(callNumber);
    }
}
