package com.kcc.lib_project.domain.reserve.mapper;

import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import com.kcc.lib_project.domain.reserve.vo.ReserveVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReserveMapper {

    int createReserve(ReserveVo reserveVo);
    int isReserved(String callNumber);
    List<ReserveVo> selectReserveByPageAndTypeAndKeyword(@Param("type") String type, @Param("keyword") String keyword, @Param("page") int page, @Param("limit") int limit, @Param("offset") long offset, @Param("userId") Long userId);
    int countByPageAndTypeAndKeyword(@Param("type") String type, @Param("keyword") String keyword, @Param("userId") Long userId);

}
