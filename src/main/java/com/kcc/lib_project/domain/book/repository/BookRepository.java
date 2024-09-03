package com.kcc.lib_project.domain.book.repository;

import com.kcc.lib_project.domain.book.vo.BookVo;

public interface BookRepository {

    int createBook(BookVo bookVo);
}
