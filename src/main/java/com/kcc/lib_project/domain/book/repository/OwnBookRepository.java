package com.kcc.lib_project.domain.book.repository;

import com.kcc.lib_project.domain.book.vo.OwnBookVo;

import java.util.List;
import java.util.Optional;

public interface OwnBookRepository {

    Optional<OwnBookVo> selectOwnBookDetailByCallNumber(String callNumber);
    List<OwnBookVo> selectRecentlyTopTenOwnBooks();
    List<OwnBookVo> selectPopularTopTenOwnBooks();
    List<OwnBookVo> selectOwnBooksByPageAndTypeAndKeyword(String type, String keyword, int page, int limit, long offset);
    Long count(String type, String keyword, int page, int limit);
    int tryReserveBook(String callNumber, Long version);
}
