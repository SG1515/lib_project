package com.kcc.lib_project.domain.book.controller;

import com.kcc.lib_project.domain.book.dto.BookDetailDto;
import com.kcc.lib_project.domain.book.dto.BookLoanReservePageInfoDto;
import com.kcc.lib_project.domain.book.dto.BookPageDto;
import com.kcc.lib_project.domain.book.service.OwnBookService;
import com.kcc.lib_project.domain.user.auth.UserDetail;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BookController {

    private final OwnBookService ownBookService;

    @GetMapping("/search")
    public String getBookList(@RequestParam(defaultValue = "최신순") String type, @RequestParam(required = false) String keyword, @RequestParam(defaultValue = "1") int page,@RequestParam(defaultValue = "10") int limit, Model model) {
        BookPageDto bookPageDto = ownBookService.searchOwnBooksByPageAndType(type, keyword, page, limit);
        model.addAttribute("bookPageDto", bookPageDto);

        return "book/bookList";
    }

    @GetMapping("/search/{callNumber}")
    public String getBookDetail(@PathVariable String callNumber, Model model) {
        BookDetailDto bookDetailDto = ownBookService.getOwnBookDetailByCallNumber(callNumber);

        log.info("bookDetailDto: {}", bookDetailDto);
        model.addAttribute("bookDetailDto", bookDetailDto);

        return "book/bookDetail";
    }

    @GetMapping("/books/history/loan/reserve")
    public String getLoanReserve(@RequestParam(defaultValue = "") String loanKeyword, @RequestParam(defaultValue = "title") String loanType,
                                 @RequestParam(defaultValue = "") String reserveKeyword, @RequestParam(defaultValue = "title") String reserveType,
                                 @RequestParam(defaultValue = "1") int loanPage, @RequestParam(defaultValue = "5") int loanLimit,
                                 @RequestParam(defaultValue = "1") int reservePage, @RequestParam(defaultValue = "5") int reserveLimit, @AuthenticationPrincipal UserDetail userDetail, Model model) {
        BookLoanReservePageInfoDto bookLoanReservePageInfoDto =
                ownBookService.getOwnBookByLoanAndReserve(
                        loanKeyword, loanType, reserveKeyword, reserveType, loanPage, loanLimit, reservePage, reserveLimit, userDetail.getUsername());
        model.addAttribute("bookLoanReserveInfoDto", bookLoanReservePageInfoDto);
        return "book/loanReserve";
    }

    @GetMapping("/user/books/bookcheck")
    public String checkOutBook() {
        return "book/checkOutBook";
    }

}
