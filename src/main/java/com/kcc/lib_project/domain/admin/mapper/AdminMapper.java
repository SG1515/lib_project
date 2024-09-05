package com.kcc.lib_project.domain.admin.mapper;

import com.kcc.lib_project.domain.admin.dto.LoanDto;
import com.kcc.lib_project.domain.admin.dto.OwnBookDto;
import com.kcc.lib_project.domain.user.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface AdminMapper  {

    public Optional<UserDto> getUserById(String id);
    public Optional<OwnBookDto> getBookInfoByCallNumber(String callNumber);
    int saveBookRent(LoanDto loanDto);
    void changeStatus(String callNumber);
    void returnBook(LoanDto loanDto);
    void returnBookChangeStatus(String callNumber);
}
