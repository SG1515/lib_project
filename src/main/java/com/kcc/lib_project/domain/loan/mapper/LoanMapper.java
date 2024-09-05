package com.kcc.lib_project.domain.loan.mapper;

import com.kcc.lib_project.domain.loan.vo.LoanVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface LoanMapper {

    Optional<LoanVo> selectLoanByCallNumber(String callNumber);
    List<LoanVo> selectLoanByPageAndTypeAndKeyword(String type, String keyword, int page, int limit, long offset, Long userId);
    int countByPageAndTypeAndKeyword(String type, String keyword, Long userId);
}
