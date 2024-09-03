package com.kcc.lib_project.domain.reserve.controller;

import com.kcc.lib_project.domain.reserve.dto.ReserveSaveDto;
import com.kcc.lib_project.domain.reserve.service.ReserveService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ReserveController {

    private final ReserveService reserveService;

    @PostMapping("/books/reserve")
    public String reserveBook(@RequestBody ReserveSaveDto reserveSaveDto) {
        reserveService.createReserve(reserveSaveDto, "duden5000");

        return "redirect:/search/"+reserveSaveDto.getCallNumber();
    }
}
