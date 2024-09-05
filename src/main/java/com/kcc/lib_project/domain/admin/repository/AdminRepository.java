package com.kcc.lib_project.domain.admin.repository;


import com.kcc.lib_project.domain.admin.dto.LoanDto;
import com.kcc.lib_project.domain.admin.dto.OwnBookDto;
import com.kcc.lib_project.domain.user.dto.UserDto;

import java.util.Optional;

public interface AdminRepository {

    Optional<UserDto> getUserById(String id);
    Optional<OwnBookDto> getOwnBookById(String callNumber);
    Boolean saveBookRent(LoanDto loanDto);
    void changeStatus(String callNumber);
}
