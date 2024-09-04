package com.kcc.lib_project.domain.admin.service;

import com.kcc.lib_project.domain.admin.repository.AdminRepository;
import com.kcc.lib_project.domain.user.dto.UserDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.User;
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

    public UserDto getUser(String id) {
        Optional<UserDto> user = adminRepository.getUserById(id);

        if(user.isPresent()) {
            return user.get();
        } else {
            throw new UsernameNotFoundException("User with ID" + id + "not found");
        }
    }
}
