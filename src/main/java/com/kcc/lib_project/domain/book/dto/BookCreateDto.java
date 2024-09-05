package com.kcc.lib_project.domain.book.dto;

import lombok.Data;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

@Data
public class BookCreateDto {
    // BookVo 값
    private final Long isbn;
    private final String title;
    private final String author;
    private final String publisher;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private final LocalDate publicationYear;
    private final Integer pageSize;
    private final String categoryNumber;
    private final String contents;
    private final String bookIndex;
    private final String imageUrl;

    // OwnBookVo 값
    private final String callNumber;
    private final LocalDate receiptAt;
    private final String status;
}



