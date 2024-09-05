package com.kcc.lib_project.domain.loan;

import com.kcc.lib_project.domain.loan.dto.LoanPageDto;
import com.kcc.lib_project.domain.loan.service.LoanService;
import com.kcc.lib_project.domain.user.auth.UserDetail;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LoanController {

    private final LoanService loanService;


    @GetMapping("books/loan/history")
    @ResponseBody
    public ResponseEntity<?> getLoanHistory(@RequestParam(defaultValue = "") String loanKeyword, @RequestParam(defaultValue = "title") String loanType,
                                            @RequestParam(defaultValue = "1") int loanPage, @RequestParam(defaultValue = "5") int loanLimit,
                                            @AuthenticationPrincipal UserDetail userDetail){

        log.info("loanKeyword: {}", loanKeyword);
        log.info("loanType: {}", loanType);
        log.info("loanPage: {}", loanPage);
        log.info("loanLimit: {}", loanLimit);
        LoanPageDto loanHistory = loanService.getLoanHistory(loanKeyword, loanType, loanPage, loanLimit, userDetail.getUsername());
        log.info("loanHistory: {}", loanHistory.toString());

        return ResponseEntity.ok(loanHistory);
    }

}
