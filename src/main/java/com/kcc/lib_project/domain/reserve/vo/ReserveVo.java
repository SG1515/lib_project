package com.kcc.lib_project.domain.reserve.vo;

import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import com.kcc.lib_project.domain.reserve.dto.ReserveSaveDto;
import com.kcc.lib_project.domain.user.vo.UserVo;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReserveVo {

    private Long reserveId;
    private LocalDate reservedAt;
    private String callNumber;
    private Long userId;
    private String status;
    private LocalDate loanedAt;

    private OwnBookVo ownBookVo;
    private UserVo userVo;

    @Builder
    public ReserveVo(String callNumber, OwnBookVo ownBookVo, LocalDate reservedAt, Long reserveId, String status, Long userId, UserVo userVo) {
        this.callNumber = callNumber;
        this.ownBookVo = ownBookVo;
        this.reservedAt = reservedAt;
        this.reserveId = reserveId;
        this.status = status;
        this.userId = userId;
        this.userVo = userVo;
    }

    public static ReserveVo of(ReserveSaveDto reserveSaveDto, Long userId) {
        return ReserveVo.builder()
                .callNumber(reserveSaveDto.getCallNumber())
                .userId(userId)
                .reservedAt(LocalDate.now())
                .status(ReserveStatus.WAITING.toString())
                .build();

    }

}
