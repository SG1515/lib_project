package com.kcc.lib_project.domain.book.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public record BookDummyListDto(
        @JsonProperty("TOTAL_COUNT")
        int totalCount,
        @JsonProperty("PAGE_NO")
        int pageNo,
        @JsonProperty("docs")
        List<BookDummyDto> bookDummyDtoList
) {
}
