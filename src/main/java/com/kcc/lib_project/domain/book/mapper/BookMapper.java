package com.kcc.lib_project.domain.book.mapper;

import com.kcc.lib_project.domain.book.vo.BookVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookMapper {

    int createBook(BookVo bookVo);
}
