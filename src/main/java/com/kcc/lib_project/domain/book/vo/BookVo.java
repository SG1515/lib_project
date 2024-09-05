package com.kcc.lib_project.domain.book.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kcc.lib_project.domain.book.dto.BookCreateDto;
import com.kcc.lib_project.domain.book.dto.BookDummyDto;
import lombok.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class BookVo {

    private Long isbn;
    private String title;
    private String author;
    private String publisher;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")

    private LocalDate publicationYear;
    private Integer pageSize;
    private String categoryNumber;
    private String contents;
    private String bookIndex;
    private String imageUrl;

    public static BookVo from(BookDummyDto bookDummyDto) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

        String ISBN = bookDummyDto.ISBN();
        if (ISBN == null || ISBN.isBlank()) {
            return null;
        }

        String page = bookDummyDto.page();
        if (page == null || page.isBlank() || !page.matches("[0-9]+")) {
            page = "0";
        }
        String categoryNumber = bookDummyDto.KDC();
        if (categoryNumber == null || categoryNumber.isBlank()) {
            categoryNumber = "0";
        }



        // parse 메소드를 사용하여 문자열을 LocalDate 객체로 변환
        LocalDate publicationYear;
        if (bookDummyDto.publishPredate() == null || bookDummyDto.publishPredate().isBlank()) {
            publicationYear = null;
        } else {
            publicationYear = LocalDate.parse(bookDummyDto.publishPredate(), formatter);
        }

        return new BookVo(
                Long.parseLong(bookDummyDto.ISBN()),
                bookDummyDto.title(),
                bookDummyDto.author(),
                bookDummyDto.publisher(),
                publicationYear,
                Integer.parseInt(page),
                categoryNumber,
                bookDummyDto.contents(),
                bookDummyDto.bookIndex(),
                bookDummyDto.imageUrl()
        );
    }

    public static BookVo from(BookCreateDto bookCreateDto) {

        return BookVo.builder()
            .isbn(bookCreateDto.getIsbn())
            .author(bookCreateDto.getAuthor())
            .title(bookCreateDto.getTitle())
            .publisher(bookCreateDto.getPublisher())
            .publicationYear(bookCreateDto.getPublicationYear())
            .pageSize(bookCreateDto.getPageSize())
            .contents(bookCreateDto.getContents())
            .bookIndex(bookCreateDto.getBookIndex())
            .imageUrl(bookCreateDto.getImageUrl())
            .categoryNumber(bookCreateDto.getCategoryNumber())
            .build();
        
    }

}
