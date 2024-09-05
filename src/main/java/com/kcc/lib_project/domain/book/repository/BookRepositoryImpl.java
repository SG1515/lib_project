package com.kcc.lib_project.domain.book.repository;

import com.kcc.lib_project.domain.book.dto.BookCreateDto;
import com.kcc.lib_project.domain.book.mapper.BookMapper;
import com.kcc.lib_project.domain.book.vo.BookVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BookRepositoryImpl implements BookRepository {

    private final BookMapper bookMapper;

    @Override
    public int createBook(BookVo bookVo) {
        return bookMapper.createBook(bookVo);
    }

    @Override
    public Long selectIsbn(Long isbn) {
        return bookMapper.selectIsbn(isbn);
    }

    @Override
    public int updateBook(BookCreateDto bookCreateDto) {
        return bookMapper.updateBook(bookCreateDto);
    }
}
