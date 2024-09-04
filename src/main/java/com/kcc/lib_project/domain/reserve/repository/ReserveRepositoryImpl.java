package com.kcc.lib_project.domain.reserve.repository;

import com.kcc.lib_project.domain.reserve.mapper.ReserveMapper;
import com.kcc.lib_project.domain.reserve.vo.ReserveVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ReserveRepositoryImpl implements ReserveRepository {

    private final ReserveMapper reserveMapper;

    @Override
    public int createReserve(ReserveVo reserveVo) {
        return reserveMapper.createReserve(reserveVo);
    }

    @Override
    public int isReserved(String callNumber) {
        return reserveMapper.isReserved(callNumber);
    }
}
