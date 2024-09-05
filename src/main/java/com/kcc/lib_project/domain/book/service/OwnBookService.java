package com.kcc.lib_project.domain.book.service;

import com.kcc.lib_project.domain.book.dto.*;
import com.kcc.lib_project.domain.book.repository.OwnBookRepository;
import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import com.kcc.lib_project.domain.book.vo.Status;
import com.kcc.lib_project.domain.loan.dto.LoanInfoDto;
import com.kcc.lib_project.domain.loan.repository.LoanRepository;
import com.kcc.lib_project.domain.loan.vo.LoanVo;
import com.kcc.lib_project.domain.reserve.dto.ReserveInfoDto;
import com.kcc.lib_project.domain.reserve.repository.ReserveRepository;
import com.kcc.lib_project.domain.reserve.vo.ReserveVo;
import com.kcc.lib_project.domain.user.repository.UserRepository;
import com.kcc.lib_project.domain.user.vo.UserVo;
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
    private final ReserveRepository reserveRepository;
    private final UserRepository userRepository;

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

    public BookLoanReservePageInfoDto getOwnBookByLoanAndReserve(String loanKeyword, String loanType, String reserveKeyword,
                                                                 String reserveType, int loanPage, int loanLimit,
                                                                 int reservePage, int reserveLimit, String userName) {

        UserVo userVo = userRepository.getUserVoById(userName)
                .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다."));

        long loanOffset = (long) (loanPage - 1) * loanLimit;
        int loanTotalCount = loanRepository.countByPageAndTypeAndKeyword(loanType, loanKeyword, userVo.getUserId());
        int loanRealEndPage = (int) Math.ceil((double) loanTotalCount / loanLimit);
        int loanStartPage = Math.max((((loanPage - 1) / 5) * 5 + 1), 1);
        int loanEndPage = Math.min(loanStartPage + 5 - 1, loanRealEndPage);

        List<LoanVo> loanOwnBookVos = loanRepository.selectLoanByPageAndTypeAndKeyword(loanType, loanKeyword, loanPage, loanLimit, loanOffset, userVo.getUserId());
        List<LoanInfoDto> loanInfoDtos = loanOwnBookVos.stream().map(l -> LoanInfoDto.from(l)).toList();

        long reserveOffset = (long) (reservePage - 1) * reserveLimit;
        int reserveTotalCount = reserveRepository.countByPageAndTypeAndKeyword(loanType, loanKeyword, userVo.getUserId());

        int reserveRealEndPage = (int) Math.ceil((double) reserveTotalCount / reserveLimit);
        int reserveStartPage = Math.max((((reservePage - 1) / 5) * 5 + 1), 1);
        int reserveEndPage = Math.min(reserveStartPage + 5 - 1, reserveRealEndPage);

        List<ReserveVo> reserveOwnBookVos = reserveRepository.selectReserveByPageAndTypeAndKeyword(reserveType, reserveKeyword, reservePage, reserveLimit, reserveOffset, userVo.getUserId());
        List<ReserveInfoDto> reserveInfoDtos = reserveOwnBookVos.stream().map(r -> ReserveInfoDto.from(r)).toList();



        return BookLoanReservePageInfoDto.builder()
                .loanInfoDtos(loanInfoDtos)
                .reserveInfoDtos(reserveInfoDtos)
                .loanCurrentPage(loanPage)
                .loanStartPage(loanStartPage)
                .loanEndPage(loanEndPage)
                .loanTotalCount(loanTotalCount)
                .loanRealEndPage(loanRealEndPage)
                .reserveCurrentPage(reservePage)
                .reserveStartPage(reserveStartPage)
                .reserveEndPage(reserveEndPage)
                .reserveTotalCount(reserveTotalCount)
                .reserveRealEndPage(reserveRealEndPage)
                .build();
    }
}
