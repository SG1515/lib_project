package com.kcc.lib_project.domain.book.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public record BookDummyDto(
        @JsonProperty("EA_ISBN")
        String ISBN,
        @JsonProperty("TITLE")
        String title,
        @JsonProperty("AUTHOR")
        String author,
        @JsonProperty("PUBLISHER")
        String publisher,
        @JsonProperty("PUBLISH_PREDATE")
        String publishPredate,
        @JsonProperty("PAGE")
        String page,
        @JsonProperty("KDC")
        String KDC,
        @JsonProperty("BOOK_SUMMARY")
        String contents,
        @JsonProperty("BOOK_TB_CNT")
        String bookIndex,
        @JsonProperty("TITLE_URL")
        String imageUrl
) {
}
