package com.kcc.lib_project.domain.admin.dto;

import com.kcc.lib_project.domain.book.dto.BookDetailDto;
import com.kcc.lib_project.domain.book.vo.BookVo;
import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
public class OwnBookDto {

    private final String callNumber;
    private final String title;
    private final String publisher;
    private final LocalDate publicationYear;
    private final String status;
    private Boolean isReserved;

    @Builder
    public OwnBookDto(String callNumber, String title, String publisher, LocalDate publicationYear, String status, Boolean isReserved) {
        this.callNumber = callNumber;
        this.title = title;
        this.publisher = publisher;
        this.publicationYear = publicationYear;
        this.status = status;
        this.isReserved = isReserved;
    }


//    public static OwnBookDto of(OwnBookVo ownBookVo, BookVo bookVo) {
//        return OwnBookDto.builder()
//                .callNumber(ownBookVo.getCallNumber())
//                .title(bookVo.getTitle())
//                .publisher(bookVo.getPublisher())
//                .publicationYear(String.valueOf(bookVo.getPublicationYear()))
//                .status(ownBookVo.getStatus())
//                .isReserved(ownBookVo.getIsReserved())
//                .build();
//
//    }

}
