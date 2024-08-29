package com.kcc.lib_project.domain.book.vo;

import com.kcc.lib_project.domain.book.dto.BookDummyDto;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BookVo {

    private String isbn;
    private String title;
    private String author;
    private String publisher;
    private String publishPredate;
    private String page;
    private String kdc;
    private String contents;
    private String bookIndex;
    private String imageUrl;

    public static BookVo from(BookDummyDto bookDummyDto) {
        return new BookVo(
                bookDummyDto.ISBN(),
                bookDummyDto.title(),
                bookDummyDto.author(),
                bookDummyDto.publisher(),
                bookDummyDto.publishPredate(),
                bookDummyDto.page(),
                bookDummyDto.KDC(),
                bookDummyDto.contents(),
                bookDummyDto.bookIndex(),
                bookDummyDto.imageUrl()
        );
    }
}
