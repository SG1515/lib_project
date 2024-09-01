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


}
