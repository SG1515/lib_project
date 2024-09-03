package com.kcc.lib_project.domain.user.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Optional;

import com.kcc.lib_project.domain.user.dto.SignupDto;
import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.domain.user.vo.UserVo;

@Mapper
public interface UserMapper {

  void saveUser(SignupDto signupDto);

  List<UserDto> getUserDetails();

  Optional<UserDto> getUserById(String id);

  Optional<UserVo> getUserVoById(String id);
}
