package com.kcc.lib_project.domain.user.repository;

import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.domain.user.vo.UserVo;

import java.util.Optional;

public interface UserRepository {

    Optional<UserDto> getUserById(String id);
    Optional<UserVo> getUserVoById(String id);
}
