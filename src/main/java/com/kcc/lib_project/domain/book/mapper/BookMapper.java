package com.kcc.lib_project.domain.book.mapper;

import com.kcc.lib_project.domain.book.dto.BookCreateDto;
import com.kcc.lib_project.domain.book.vo.BookVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookMapper {
    Long selectIsbn(Long isbn);
    int createBook(BookVo bookVo);
    int updateBook(BookCreateDto bookCreateDto);
}
