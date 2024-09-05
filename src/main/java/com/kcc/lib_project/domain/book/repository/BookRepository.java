package com.kcc.lib_project.domain.book.repository;

import com.kcc.lib_project.domain.book.dto.BookCreateDto;
import com.kcc.lib_project.domain.book.vo.BookVo;

public interface BookRepository {
    int createBook(BookVo bookVo);
    Long selectIsbn(Long isbn);
    int updateBook(BookCreateDto bookCreateDto);
}
