package com.kcc.lib_project.domain.book.repository;

import com.kcc.lib_project.domain.book.mapper.OwnBookMapper;
import com.kcc.lib_project.domain.book.vo.OwnBookVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class OwnBookRepositoryImpl implements OwnBookRepository {

    private final OwnBookMapper ownBookMapper;

    @Override
    public Optional<OwnBookVo> selectOwnBookDetailByCallNumber(String callNumber) {
        return ownBookMapper.selectOwnBookDetailByCallNumber(callNumber);
    }

    @Override
    public List<OwnBookVo> selectRecentlyTopTenOwnBooks() {
        return ownBookMapper.selectRecentlyTopTenOwnBooks();
    }

    @Override
    public List<OwnBookVo> selectPopularTopTenOwnBooks() {
        return ownBookMapper.selectPopularTopTenOwnBooks();
    }

    @Override
    public List<OwnBookVo> selectOwnBooksByPageAndTypeAndKeyword(String type, String keyword, int page, int limit, long offset) {
        return ownBookMapper.selectOwnBooksByPageAndTypeAndKeyword(type, keyword, page, limit, offset);
    }

    @Override
    public Long count(String type, String keyword, int page, int limit) {
        return ownBookMapper.count(type, keyword, page, limit);
    }

    @Override
    public int tryReserveBook(String callNumber, Long version) {
        return ownBookMapper.tryReserveBook(callNumber, version);
    }

    @Override
    public int createOwnBook(OwnBookVo ownBookVo) {
        return ownBookMapper.createOwnBook(ownBookVo);
    }

    @Override
    public List<OwnBookVo> adminSelectBooksByPageAndKeyword(String category, String keyword, int page, int limit, long offset) {
        return ownBookMapper.adminSelectBooksByPageAndKeyword(category, keyword, page, limit, offset);
    }

    @Override
    public int deleteBookByCallNumber(String callNumber) {
        return ownBookMapper.deleteBookByCallNumber(callNumber);
    }

}
