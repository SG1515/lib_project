package com.kcc.lib_project.domain.book.controller;

import com.kcc.lib_project.domain.book.dto.BookDetailDto;
import com.kcc.lib_project.domain.book.service.OwnBookService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BookController {

    private final OwnBookService ownBookService;

    @GetMapping("/search")
    public String getBookList() {
        return "book/bookList";
    }

    @GetMapping("/search/{callNumber}")
    public String getBookDetail(@PathVariable String callNumber, Model model) {
        BookDetailDto bookDetailDto = ownBookService.getOwnBookDetailByCallNumber(callNumber);

        log.info("bookDetailDto: {}", bookDetailDto);
        model.addAttribute("bookDetailDto", bookDetailDto);

        return "book/bookDetail";
    }
}
