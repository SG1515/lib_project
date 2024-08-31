package com.kcc.lib_project.domain.book.repository;

import com.kcc.lib_project.domain.book.vo.BookVo;
import com.kcc.lib_project.domain.book.vo.EntireBookVo;

import java.util.List;

public interface BookRepository {

    int createBook(BookVo bookVo);

    List<EntireBookVo> selectRecentlyTopTenBooks();
    List<EntireBookVo> selectPopularTopTenBooks();
}
