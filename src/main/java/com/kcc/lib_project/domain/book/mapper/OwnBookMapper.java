package com.kcc.lib_project.domain.book.mapper;

import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OwnBookMapper {

    int createOwnBook(OwnBookVo ownBookVo);

}
