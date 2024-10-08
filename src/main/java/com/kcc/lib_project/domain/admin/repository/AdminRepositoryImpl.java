package com.kcc.lib_project.domain.admin.repository;


import com.kcc.lib_project.domain.admin.dto.LoanDto;
import com.kcc.lib_project.domain.admin.dto.OwnBookDto;
import com.kcc.lib_project.domain.admin.mapper.AdminMapper;
import com.kcc.lib_project.domain.user.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class AdminRepositoryImpl implements AdminRepository {

    private final AdminMapper adminMapper;

    @Override
    public Optional<UserDto> getUserById(String id) {
        Optional<UserDto> user = adminMapper.getUserById(id);
        return user;
    }

    @Override
    public Optional<OwnBookDto> getOwnBookById(String callNumber) {
        Optional<OwnBookDto> bookInfo = adminMapper.getBookInfoByCallNumber(callNumber);

        return bookInfo;
    }

    @Override
    public Boolean saveBookRent(LoanDto loanDto) {
        int save = adminMapper.saveBookRent(loanDto);

        if (save == 1) {
            return true;
        } else  {
            return false;
        }
    }

    @Override
    public void changeStatus(String callNumber) {
        adminMapper.changeStatus(callNumber);
    }

    @Override
    public void returnBook(LoanDto loanDto) {
        adminMapper.returnBook(loanDto);
    }

    @Override
    public void returnBookChangeStatus(String callNumber) {
        adminMapper.returnBookChangeStatus(callNumber);
    }
}
