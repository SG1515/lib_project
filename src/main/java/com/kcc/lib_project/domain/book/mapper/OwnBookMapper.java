package com.kcc.lib_project.domain.book.mapper;

import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface OwnBookMapper {

    int createOwnBook(OwnBookVo ownBookVo);
    Optional<OwnBookVo> selectOwnBookDetailByCallNumber(String callNumber);
    List<OwnBookVo> selectRecentlyTopTenOwnBooks();
    List<OwnBookVo> selectPopularTopTenOwnBooks();
    List<OwnBookVo> selectOwnBooksByPageAndTypeAndKeyword(@Param("type") String type, @Param("keyword") String keyword, @Param("page") int page, @Param("limit") int limit, @Param("offset") long offset);
    Long count(@Param("type") String type, @Param("keyword") String keyword, @Param("page") int page, @Param("limit") int limit);
    int tryReserveBook(String callNumber, Long version);
    List<OwnBookVo> adminSelectBooksByPageAndKeyword(@Param("category") String category, @Param("keyword") String keyword, @Param("page") int page, @Param("limit") int limit, @Param("offset") long offset);
    int deleteBookByCallNumber(String callNumber);
}
