package com.kcc.lib_project.domain.book.repository;

import com.kcc.lib_project.domain.book.mapper.BookMapper;
import com.kcc.lib_project.domain.book.vo.BookVo;
import com.kcc.lib_project.domain.book.vo.EntireBookVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class BookRepositoryImpl implements BookRepository {

    private final BookMapper bookMapper;

    @Override
    public int createBook(BookVo bookVo) {
        return bookMapper.createBook(bookVo);
    }

    @Override
    public List<EntireBookVo> selectRecentlyTopTenBooks() {
        return bookMapper.selectRecentlyTopTenBooks();
    }

    @Override
    public List<EntireBookVo> selectPopularTopTenBooks() {
        return bookMapper.selectPopularTopTenBooks();
    }


}
