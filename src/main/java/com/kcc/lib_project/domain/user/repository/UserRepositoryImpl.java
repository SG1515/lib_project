package com.kcc.lib_project.domain.user.repository;

import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.domain.user.mapper.UserMapper;
import com.kcc.lib_project.domain.user.vo.UserVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class UserRepositoryImpl implements UserRepository {

    private final UserMapper userMapper;

    @Override
    public Optional<UserDto> getUserById(String id) {
        return userMapper.getUserById(id);
    }

    @Override
    public Optional<UserVo> getUserVoById(String id) {
        return userMapper.getUserVoById(id);
    }
}
