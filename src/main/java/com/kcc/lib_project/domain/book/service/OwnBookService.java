package com.kcc.lib_project.domain.book.service;

import com.kcc.lib_project.domain.book.dto.*;
import com.kcc.lib_project.domain.book.dto.BookCarouselDto;
import com.kcc.lib_project.domain.book.dto.BookCreateDto;
import com.kcc.lib_project.domain.book.dto.BookDetailDto;
import com.kcc.lib_project.domain.book.dto.BookTopTenDto;
import com.kcc.lib_project.domain.book.repository.BookRepository;
import com.kcc.lib_project.domain.book.repository.OwnBookRepository;
import com.kcc.lib_project.domain.book.vo.BookVo;
import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import com.kcc.lib_project.domain.book.vo.Status;
import com.kcc.lib_project.domain.loan.repository.LoanRepository;
import com.kcc.lib_project.domain.loan.vo.LoanVo;
import com.kcc.lib_project.global.exception.type.NotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class OwnBookService {

    private final OwnBookRepository ownBookRepository;
    private final LoanRepository loanRepository;
    private final BookRepository bookRepository;

    public BookDetailDto getOwnBookDetailByCallNumber(String callNumber) {

        OwnBookVo ownBookVo = ownBookRepository.selectOwnBookDetailByCallNumber(callNumber).orElseThrow(() -> new NotFoundException("해당 도서가 존재하지 않습니다."));

        if (Status.toKorean(ownBookVo.getStatus()).equals("대출중")) {
            LoanVo loanVo = loanRepository.selectLoanByCallNumber(callNumber).orElseThrow(() -> new NotFoundException("해당 도서가 대출중이지만 대출 정보가 존재하지 않습니다."));
            return BookDetailDto.of(ownBookVo, loanVo.getEndedAt());
        }

        return BookDetailDto.from(ownBookVo);


    }

    public BookTopTenDto getTopTenOwnBooks() {
        List<OwnBookVo> recentlyTopTenBooks = ownBookRepository.selectRecentlyTopTenOwnBooks();
        List<OwnBookVo> popularTopTenBooks = ownBookRepository.selectPopularTopTenOwnBooks();
        List<BookCarouselDto> recentlyTopTenDto = recentlyTopTenBooks.stream().map(r -> BookCarouselDto.from(r)).toList();
        List<BookCarouselDto> populationTopTenDto = popularTopTenBooks.stream().map(p -> BookCarouselDto.from(p)).toList();


        return new BookTopTenDto(recentlyTopTenDto, populationTopTenDto);
    }

    public BookPageDto searchOwnBooksByPageAndType(String type, String keyword, int page, int limit) {

        log.info("type: {}", type);
        log.info("keyword: {}", keyword);
        log.info("page: {}", page);
        log.info("limit: {}", limit);


        long offset = (long) (page - 1) * limit;
        if (keyword == null) {
            keyword = "";
        }

        List<OwnBookVo> ownBookVos = ownBookRepository.selectOwnBooksByPageAndTypeAndKeyword(type, keyword, page, limit ,offset);

        List<BookSimpleDto> bookSimpleDtos = ownBookVos.stream().map(o -> BookSimpleDto.from(o)).toList();


        Long totalCount = ownBookRepository.count(type, keyword, page, limit);
        int realEndPage = (int) Math.ceil((double) totalCount / limit);
        int startPage = Math.max((((page - 1) / 10) * 10 + 1), 1);
        int endPage = Math.min(startPage + 10 - 1, realEndPage);

        log.info("totalCount: {}", totalCount);
        log.info("realEndPage: {}", realEndPage);
        log.info("startPage: {}", startPage);
        bookSimpleDtos.forEach(b -> log.info(b.getBookIndex()));

        return new BookPageDto(page, startPage, endPage, totalCount, realEndPage, bookSimpleDtos);
    }

    public void registerBook(BookCreateDto bookCreateDto) {

        if (bookRepository.selectIsbn(bookCreateDto.getIsbn()) == 0) {
            BookVo from = BookVo.from(bookCreateDto);
            log.info(from.toString());
            bookRepository.createBook(BookVo.from(bookCreateDto));
        }
        OwnBookVo from = OwnBookVo.from(bookCreateDto);
        log.info(from.toString());
        ownBookRepository.createOwnBook(from);
    }

    public BookPageDto searchOwnBooksByPageAndCategory(String category, String keyword, int page, int limit) {

        log.info("Category: {}", category);
        log.info("Keyword: {}", keyword);
        log.info("Page: {}", page);
        log.info("Limit: {}", limit);

        long offset = (long) (page - 1) * limit;

        if (keyword == null) {
            keyword = "";
        }

        List<OwnBookVo> ownBookVos = ownBookRepository.adminSelectBooksByPageAndKeyword(category, keyword, page, limit ,offset);
        List<BookSimpleDto> bookSimpleDtos = ownBookVos.stream()
                .map(BookSimpleDto::from)
                .toList();

        Long totalCount = ownBookRepository.count(category, keyword, page, limit);

        int realEndPage = (int) Math.ceil((double) totalCount / limit);
        int startPage = Math.max((((page - 1) / 10) * 10 + 1), 1);
        int endPage = Math.min(startPage + 10 - 1, realEndPage);

        log.info("Total Count: {}", totalCount);
        log.info("Real End Page: {}", realEndPage);
        log.info("Start Page: {}", startPage);
        bookSimpleDtos.forEach(b -> log.info(b.getBookIndex()));

        return new BookPageDto(page, startPage, endPage, totalCount, realEndPage, bookSimpleDtos);
    }

    public int updateBook(BookCreateDto bookCreateDto) {
        try {
            int updatedRows = bookRepository.updateBook(bookCreateDto);
            if (updatedRows == 0) {
                throw new RuntimeException("도서 정보 업데이트 실패");
            }
            return updatedRows;
        } catch (Exception e) {
            e.printStackTrace(); // 로그 출력
            throw new RuntimeException("도서 정보 업데이트 중 오류 발생", e);
        }
    }

    @Transactional
    public int deleteBookByCallNumber(String callNumber) {

        return ownBookRepository.deleteBookByCallNumber(callNumber);
    }

}
