package com.kcc.lib_project.domain.book.vo;

import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EntireBookVo {

    private Long isbn;
    private String title;
    private String author;
    private String publisher;
    private LocalDate publicationYear;
    private Integer pageSize;
    private String categoryNumber;
    private String contents;
    private String bookIndex;
    private String imageUrl;
    private String callNumber;
    private LocalDate receiptAt;
    private String status;

}
