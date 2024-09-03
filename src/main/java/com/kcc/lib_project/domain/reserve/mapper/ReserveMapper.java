package com.kcc.lib_project.domain.reserve.mapper;

import com.kcc.lib_project.domain.reserve.vo.ReserveVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReserveMapper {

    int createReserve(ReserveVo reserveVo);
    int isReserved(String callNumber);
}
