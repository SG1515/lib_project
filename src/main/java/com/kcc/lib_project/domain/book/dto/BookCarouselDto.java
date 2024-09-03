package com.kcc.lib_project.domain.book.dto;

import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import lombok.Data;

@Data
public class BookCarouselDto {
    private final String title;
    private final String imageUrl;
    private final String callNumber;

    public static BookCarouselDto from(OwnBookVo ownBookVo) {
        return new BookCarouselDto(
                ownBookVo.getBookVo().getTitle(),
                ownBookVo.getBookVo().getImageUrl(),
                ownBookVo.getCallNumber()
        );
    }
}