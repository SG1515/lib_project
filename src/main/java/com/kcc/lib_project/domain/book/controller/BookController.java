package com.kcc.lib_project.domain.book.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class BookController {

    @GetMapping("/search")
    public String getBookList() {
        return "book/bookList";
    }

    @GetMapping("/search/{callNumber}")
    public String getBookDetail() {
        return "book/bookDetail";
    }
}
