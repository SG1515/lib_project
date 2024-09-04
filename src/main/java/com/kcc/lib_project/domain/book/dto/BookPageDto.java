package com.kcc.lib_project.domain.book.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class BookPageDto implements Serializable {

    private int currentPage;
    private int startPage;
    private int endPage;
    private Long totalCount;
    private int realEndPage;

    private List<BookSimpleDto> bookSimpleDtoList;
}
