package com.kcc.lib_project.domain.reserve.controller;

import com.kcc.lib_project.domain.reserve.dto.ReservePageDto;
import com.kcc.lib_project.domain.reserve.dto.ReserveSaveDto;
import com.kcc.lib_project.domain.reserve.service.ReserveService;
import com.kcc.lib_project.domain.user.auth.UserDetail;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReserveController {

    private final ReserveService reserveService;

    @PostMapping("/books/reserve")
    public String reserveBook(@RequestBody ReserveSaveDto reserveSaveDto, @AuthenticationPrincipal UserDetail userDetail) {
        reserveService.createReserve(reserveSaveDto, userDetail.getUsername());

        return "redirect:/search/"+reserveSaveDto.getCallNumber();
    }

    @GetMapping("/books/reserve")
    public String getReserveBook() {
        return "book/reserveList";
    }

    @GetMapping("/books/reserve/history")
    @ResponseBody
    public ResponseEntity<?> getReserveHistory(@RequestParam(defaultValue = "") String reserveKeyword, @RequestParam(defaultValue = "title") String reserveType,
                                            @RequestParam(defaultValue = "1") int reservePage, @RequestParam(defaultValue = "5") int reserveLimit,
                                            @AuthenticationPrincipal UserDetail userDetail){
        ReservePageDto reservePageDto = reserveService.getReserveHistory(reserveKeyword, reserveType, reservePage, reserveLimit, userDetail.getUsername());

        return ResponseEntity.ok(reservePageDto);
    }
}
