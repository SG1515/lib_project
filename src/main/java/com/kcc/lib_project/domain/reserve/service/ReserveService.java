package com.kcc.lib_project.domain.reserve.service;

import com.kcc.lib_project.domain.book.repository.OwnBookRepository;
import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import com.kcc.lib_project.domain.reserve.dto.ReserveSaveDto;
import com.kcc.lib_project.domain.reserve.repository.ReserveRepository;
import com.kcc.lib_project.domain.reserve.vo.ReserveVo;
import com.kcc.lib_project.domain.user.repository.UserRepository;
import com.kcc.lib_project.domain.user.vo.UserVo;
import com.kcc.lib_project.global.exception.type.BadRequestException;
import com.kcc.lib_project.global.exception.type.NotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional(readOnly = true)
public class ReserveService {

    private final ReserveRepository reserveRepository;
    private final UserRepository userRepository;
    private final OwnBookRepository ownBookRepository;

    @Transactional
    public void createReserve(ReserveSaveDto reserveSaveDto, String id) {
        UserVo userVo = userRepository.getUserVoById(id)
                .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다."));

        String callNumber = reserveSaveDto.getCallNumber();
        OwnBookVo ownBookVo = ownBookRepository.selectOwnBookDetailByCallNumber(callNumber).orElseThrow(() -> new NotFoundException("존재하지 않는 도서입니다."));
        validateReserve(ownBookVo);

        ReserveVo reserveVo = ReserveVo.of(reserveSaveDto, userVo.getUserId());
        reserveRepository.createReserve(reserveVo);
        updateVersionAndLockCheck(callNumber, ownBookVo);
    }

    private void updateVersionAndLockCheck(String callNumber, OwnBookVo ownBookVo) {
        int affectedRows = ownBookRepository.tryReserveBook(callNumber, ownBookVo.getVersion());
        if (affectedRows == 0) {
            throw new BadRequestException("이미 예약 시도 중인 사람이 있습니다.");
        }
    }

    private static void validateReserve(OwnBookVo ownBookVo) {
        if (ownBookVo.getStatus().equals("AVAILABLE")) {
            throw new BadRequestException("대출 가능한 도서입니다.");
        }
        if (ownBookVo.getIsReserved()) {
            throw new BadRequestException("이미 예약된 도서입니다.");
        }
    }

    public int isReserved(String callNumber) {
        return reserveRepository.isReserved(callNumber);
    }


}

