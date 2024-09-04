package com.kcc.lib_project.domain.admin.mapper;

import com.kcc.lib_project.domain.user.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface AdminMapper  {

    public Optional<UserDto> getUserById(String id);
}
