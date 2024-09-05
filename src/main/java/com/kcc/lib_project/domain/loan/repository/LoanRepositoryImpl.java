package com.kcc.lib_project.domain.loan.repository;

import com.kcc.lib_project.domain.loan.mapper.LoanMapper;
import com.kcc.lib_project.domain.loan.vo.LoanVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class LoanRepositoryImpl implements LoanRepository {

    private final LoanMapper loanMapper;

    @Override
    public Optional<LoanVo> selectLoanByCallNumber(String callNumber) {
        return loanMapper.selectLoanByCallNumber(callNumber);
    }

    @Override
    public List<LoanVo> selectLoanByPageAndTypeAndKeyword(String type, String keyword, int page, int limit, long offset, Long userId) {
        return loanMapper.selectLoanByPageAndTypeAndKeyword(type, keyword, page, limit, offset, userId);
    }

    @Override
    public int countByPageAndTypeAndKeyword(String type, String keyword, Long userId) {
        return loanMapper.countByPageAndTypeAndKeyword(type, keyword, userId);
    }

}
