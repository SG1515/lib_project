package com.kcc.lib_project.domain.book.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class BookTopTenDto {
    private final List<BookCarouselDto> bookRecentlyTopTenDtos;
    private final List<BookCarouselDto> bookPopularTopTenDtos;
}