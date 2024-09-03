package com.kcc.lib_project.domain.reserve.repository;

import com.kcc.lib_project.domain.reserve.vo.ReserveVo;

public interface ReserveRepository {

    int createReserve(ReserveVo reserveVo);
    int isReserved(String callNumber);

}
