package com.kcc.lib_project.domain.book.service;

import com.kcc.lib_project.domain.book.dto.BookCarouselDto;
import com.kcc.lib_project.domain.book.dto.BookTopTenDto;
import com.kcc.lib_project.domain.book.repository.BookRepository;
import com.kcc.lib_project.domain.book.vo.EntireBookVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class BookService {

    private final BookRepository bookRepository;

    public BookTopTenDto getTopTenBooks() {

        List<EntireBookVo> recentlyTopTenBooks = bookRepository.selectRecentlyTopTenBooks();
        List<EntireBookVo> popularTopTenBooks = bookRepository.selectPopularTopTenBooks();
        List<BookCarouselDto> recentlyTopTenDto = recentlyTopTenBooks.stream().map(e -> BookCarouselDto.from(e)).toList();
        List<BookCarouselDto> populationTopTenDto = popularTopTenBooks.stream().map(e -> BookCarouselDto.from(e)).toList();


        return new BookTopTenDto(recentlyTopTenDto, populationTopTenDto);
    }
}
