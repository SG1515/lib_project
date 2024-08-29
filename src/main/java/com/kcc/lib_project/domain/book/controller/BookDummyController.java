package com.kcc.lib_project.domain.book.controller;

import com.kcc.lib_project.domain.book.service.BookDummyService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class BookDummyController {

    private final BookDummyService bookDummyService;

    @GetMapping("/dummy")
    public void getDummy()                                                                                                                                              {
        bookDummyService.getDummy();
    }
}
