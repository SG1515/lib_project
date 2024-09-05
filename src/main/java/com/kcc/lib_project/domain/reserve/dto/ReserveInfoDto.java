package com.kcc.lib_project.domain.reserve.dto;

import com.kcc.lib_project.domain.reserve.vo.ReserveStatus;
import com.kcc.lib_project.domain.reserve.vo.ReserveVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@ToString
public class ReserveInfoDto {

    private final String callNumber;
    private final String title;
    private final String author;
    private final LocalDate reservedAt;
    private final LocalDate loanedAt;
    private final String status;

    public static ReserveInfoDto from(ReserveVo reserveVo) {
        return new ReserveInfoDto(
                reserveVo.getCallNumber(),
                reserveVo.getOwnBookVo().getBookVo().getTitle(),
                reserveVo.getOwnBookVo().getBookVo().getAuthor(),
                reserveVo.getReservedAt(),
                reserveVo.getReservedAt().plusDays(7),
                ReserveStatus.toKorean(reserveVo.getStatus())
        );
    }

}
