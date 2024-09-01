package com.kcc.lib_project.domain.book.dto;

import com.kcc.lib_project.domain.book.vo.EntireBookVo;
import lombok.Data;
import lombok.Getter;

@Data
public class BookCarouselDto {
    private final String title;
    private final String imageUrl;
    private final String callNumber;

    public static BookCarouselDto from(EntireBookVo entireBookVo) {
        return new BookCarouselDto(
                entireBookVo.getTitle(),
                entireBookVo.getImageUrl(),
                entireBookVo.getCallNumber()
        );
    }
}