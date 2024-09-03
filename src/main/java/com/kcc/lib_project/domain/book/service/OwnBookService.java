package com.kcc.lib_project.domain.book.service;

import com.kcc.lib_project.domain.book.dto.BookCarouselDto;
import com.kcc.lib_project.domain.book.dto.BookDetailDto;
import com.kcc.lib_project.domain.book.dto.BookTopTenDto;
import com.kcc.lib_project.domain.book.repository.OwnBookRepository;
import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import com.kcc.lib_project.domain.book.vo.Status;
import com.kcc.lib_project.domain.loan.repository.LoanRepository;
import com.kcc.lib_project.domain.loan.vo.LoanVo;
import com.kcc.lib_project.global.exception.type.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class OwnBookService {

    private final OwnBookRepository ownBookRepository;
    private final LoanRepository loanRepository;

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
}
