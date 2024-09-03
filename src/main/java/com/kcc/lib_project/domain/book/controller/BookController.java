package com.kcc.lib_project.domain.book.controller;

import com.kcc.lib_project.domain.book.dto.BookDetailDto;
import com.kcc.lib_project.domain.book.dto.BookPageDto;
import com.kcc.lib_project.domain.book.service.OwnBookService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
}
