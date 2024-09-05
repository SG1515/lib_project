package com.kcc.lib_project.domain.reserve.repository;

import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import com.kcc.lib_project.domain.reserve.mapper.ReserveMapper;
import com.kcc.lib_project.domain.reserve.vo.ReserveVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    @Override
    public List<ReserveVo> selectReserveByPageAndTypeAndKeyword(String type, String keyword, int page, int limit, long offset, Long userId) {
        return reserveMapper.selectReserveByPageAndTypeAndKeyword(type, keyword, page, limit, offset, userId);
    }

    @Override
    public int countByPageAndTypeAndKeyword(String type, String keyword, Long userId) {
        return reserveMapper.countByPageAndTypeAndKeyword(type, keyword, userId);
    }
}
