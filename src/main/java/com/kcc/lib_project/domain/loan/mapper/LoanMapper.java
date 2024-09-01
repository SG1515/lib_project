package com.kcc.lib_project.domain.loan.mapper;

import com.kcc.lib_project.domain.loan.vo.LoanVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface LoanMapper {

    Optional<LoanVo> selectLoanByCallNumber(String callNumber);
}
