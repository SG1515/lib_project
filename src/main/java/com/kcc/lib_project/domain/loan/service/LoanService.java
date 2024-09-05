package com.kcc.lib_project.domain.loan.service;

import com.kcc.lib_project.domain.loan.dto.LoanInfoDto;
import com.kcc.lib_project.domain.loan.dto.LoanPageDto;
import com.kcc.lib_project.domain.loan.repository.LoanRepository;
import com.kcc.lib_project.domain.loan.vo.LoanVo;
import com.kcc.lib_project.domain.user.repository.UserRepository;
import com.kcc.lib_project.domain.user.vo.UserVo;
import com.kcc.lib_project.global.exception.type.NotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoanService {

    private final LoanRepository loanRepository;
    private final UserRepository userRepository;

    public LoanPageDto getLoanHistory(String loanKeyword, String loanType, int loanPage, int loanLimit, String username) {
        UserVo userVo = userRepository.getUserVoById(username).orElseThrow(() -> new NotFoundException("사용자 정보가 없습니다."));
        long loanOffset = (long) (loanPage - 1) * loanLimit;
        int loanTotalCount = loanRepository.countByPageAndTypeAndKeyword(loanType, loanKeyword, userVo.getUserId());
        int loanRealEndPage = (int) Math.ceil((double) loanTotalCount / loanLimit);
        int loanStartPage = Math.max((((loanPage - 1) / 5) * 5 + 1), 1);
        int endPage = Math.min(loanStartPage + 5 - 1, loanRealEndPage);

        List<LoanVo> loanOwnBookVos = loanRepository.selectLoanByPageAndTypeAndKeyword(loanType, loanKeyword, loanPage, loanLimit, loanOffset, userVo.getUserId());
        List<LoanInfoDto> loanInfoDtos = loanOwnBookVos.stream().map(l -> LoanInfoDto.from(l)).toList();

        return LoanPageDto.builder()
                .loanInfoDtos(loanInfoDtos)
                .loanStartPage(loanStartPage)
                .loanEndPage(endPage)
                .loanRealEndPage(loanRealEndPage)
                .loanTotalCount(loanTotalCount)
                .build();

    }
}
