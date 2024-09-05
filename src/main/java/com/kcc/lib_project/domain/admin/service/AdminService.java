package com.kcc.lib_project.domain.admin.service;

import com.kcc.lib_project.domain.admin.dto.LoanDto;
import com.kcc.lib_project.domain.admin.dto.OwnBookDto;
import com.kcc.lib_project.domain.admin.repository.AdminRepository;
import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.global.exception.type.BookNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
@Slf4j
public class AdminService {

    private final AdminRepository adminRepository;

    public UserDto getUser(String id) throws UsernameNotFoundException {
        Optional<UserDto> user = adminRepository.getUserById(id);

        if(user.isPresent()) {
            return user.get();
        } else {
            throw new UsernameNotFoundException("User with ID" + id + "not found");
        }
    }

    public OwnBookDto getOwnBook(String callNumber) throws BookNotFoundException {
        Optional<OwnBookDto> bookInfo = adminRepository.getOwnBookById(callNumber);

        if(bookInfo.isPresent()) {
            return bookInfo.get();
        } else {
            throw new BookNotFoundException("Book with ID " + callNumber + "not found");
        }
    }

    public Boolean rentBook(LoanDto loanDto) {
        Boolean success = adminRepository.saveBookRent(loanDto);
        if(success) {
            return true;
        } else {
            return false;
        }

    }

    public void changeStatus(String callNumber){
        adminRepository.changeStatus(callNumber);
    }
}
