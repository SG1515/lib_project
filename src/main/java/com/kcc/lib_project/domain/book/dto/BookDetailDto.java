package com.kcc.lib_project.domain.book.dto;

import com.kcc.lib_project.domain.book.vo.BookVo;
import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import com.kcc.lib_project.domain.book.vo.Status;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;


@Data
public class BookDetailDto {

    private final String callNumber;
    private final String imageUrl;
    private final String title;
    private final String author;
    private final String publisher;
    private final String publicationYear;
    private final Integer pageSize;
    private final String isbn;
    private final String status;
    private String receiptAt;
    // 반납예정일 추가 해야 함
    private String contents;
    private String bookIndex;
    private String loanEndedAt;

    @Builder
    public BookDetailDto(String author, String bookIndex, String callNumber, String contents, String imageUrl, String isbn, String loanEndedAt, Integer pageSize, String publicationYear, String publisher, String receiptAt, String status, String title) {
        this.author = author;
        this.bookIndex = bookIndex;
        this.callNumber = callNumber;
        this.contents = contents;
        this.imageUrl = imageUrl;
        this.isbn = isbn;
        this.loanEndedAt = loanEndedAt;
        this.pageSize = pageSize;
        this.publicationYear = publicationYear;
        this.publisher = publisher;
        this.receiptAt = receiptAt;
        this.status = status;
        this.title = title;
    }





    public static BookDetailDto from(OwnBookVo ownBookVo) {
        BookVo bookVo = ownBookVo.getBookVo();
        return BookDetailDto.builder()
                .callNumber(ownBookVo.getCallNumber())
                .imageUrl(bookVo.getImageUrl())
                .title(bookVo.getTitle())
                .author(bookVo.getAuthor())
                .publisher(bookVo.getPublisher())
                .publicationYear(bookVo.getPublicationYear().toString())
                .pageSize(bookVo.getPageSize())
                .isbn(ownBookVo.getIsbn().toString())
                .status(Status.toKorean(ownBookVo.getStatus()))
                .contents(bookVo.getContents())
                .bookIndex(bookVo.getBookIndex())
                .receiptAt(ownBookVo.getReceiptAt().toString())
                .build();
    }

    public static BookDetailDto of(OwnBookVo ownBookVo, LocalDate endedAt) {
        BookVo bookVo = ownBookVo.getBookVo();
        return BookDetailDto.builder()
                .callNumber(ownBookVo.getCallNumber())
                .imageUrl(bookVo.getImageUrl())
                .title(bookVo.getTitle())
                .author(bookVo.getAuthor())
                .publisher(bookVo.getPublisher())
                .publicationYear(bookVo.getPublicationYear().toString())
                .pageSize(bookVo.getPageSize())
                .isbn(ownBookVo.getIsbn().toString())
                .status(Status.toKorean(ownBookVo.getStatus()))
                .contents(bookVo.getContents())
                .bookIndex(bookVo.getBookIndex())
                .receiptAt(ownBookVo.getReceiptAt().toString())
                .loanEndedAt(endedAt.toString())
                .build();
    }
}
