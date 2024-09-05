package com.kcc.lib_project.domain.reserve.repository;

import com.kcc.lib_project.domain.reserve.vo.ReserveVo;

import java.util.List;

public interface ReserveRepository {

    int createReserve(ReserveVo reserveVo);
    int isReserved(String callNumber);
    List<ReserveVo> selectReserveByPageAndTypeAndKeyword(String type, String keyword, int page, int limit, long offset, Long userId);
    int countByPageAndTypeAndKeyword(String type, String keyword, Long userId);

}
