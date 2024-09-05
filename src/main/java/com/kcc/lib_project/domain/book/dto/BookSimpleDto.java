package com.kcc.lib_project.domain.book.dto;

import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import com.kcc.lib_project.domain.reserve.vo.ReserveVo;
import lombok.Builder;
import lombok.Data;

@Data
public class BookSimpleDto {

    private final String callNumber;
    private final String imageUrl;
    private final String title;
    private final String author;
    private final String publisher;
    private final String publicationYear;
    private final String contents;
    private final String bookIndex;

    @Builder
    public BookSimpleDto(String callNumber, String imageUrl, String title, String author, String publisher, String publicationYear, String contents, String bookIndex) {
        this.callNumber = callNumber;
        this.imageUrl = imageUrl;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.publicationYear = publicationYear;
        this.contents = contents;
        this.bookIndex = bookIndex;
    }

    public static BookSimpleDto from(OwnBookVo ownBookVo) {
        // publicationYear가 null일 경우 "Unknown" 또는 빈 문자열을 설정
        String publicationYear = (ownBookVo.getBookVo().getPublicationYear() != null)
                ? ownBookVo.getBookVo().getPublicationYear().toString()
                : "Unknown";

        return BookSimpleDto.builder()
                .callNumber(ownBookVo.getCallNumber())
                .imageUrl(ownBookVo.getBookVo().getImageUrl())
                .title(ownBookVo.getBookVo().getTitle())
                .author(ownBookVo.getBookVo().getAuthor())
                .publisher(ownBookVo.getBookVo().getPublisher())
                .publicationYear(publicationYear)
                .contents(ownBookVo.getBookVo().getContents())
                .bookIndex(ownBookVo.getBookVo().getBookIndex())
                .build();
    }

}
