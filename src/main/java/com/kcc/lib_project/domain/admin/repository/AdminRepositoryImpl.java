package com.kcc.lib_project.domain.admin.repository;


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
        return Optional.empty();
    }
}
