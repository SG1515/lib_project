package com.kcc.lib_project.domain.user.service;


import com.kcc.lib_project.domain.user.dto.SignupDto;
import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.domain.user.mapper.UserMapper;
import com.kcc.lib_project.global.exception.type.UserAlreadyExistsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
public class UserService {

  @Autowired
  UserMapper userMapper;

  LocalDate localTime = LocalDate.now();
  private final PasswordEncoder passwordEncoder;


  @Autowired
  public UserService(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }
  

  @Transactional
  public void saveUser(SignupDto signupDto) {
    signupDto.setPassword(passwordEncoder.encode(signupDto.getPassword()));
    signupDto.setCreated_at(localTime);

    //중복 아이디 검증
    List<UserDto> users = userMapper.getUserDetails();
    boolean checkUser = false;
    for(UserDto userDto : users){
      if(userDto.getId().equals(signupDto.getId()) ){
        checkUser = true;
      }
    }

    if(!checkUser){
      System.out.println(signupDto.toString());
      userMapper.saveUser(signupDto);
    } else {
      throw new UserAlreadyExistsException("id가 중복됩니다.");
    }
  }

  @Transactional
  public void updateUser(UserDto updateUser) {
    //비밀번호 해싱
    updateUser.setPassword(passwordEncoder.encode(updateUser.getPassword()));

    userMapper.updateUser(updateUser);
  }


  
}
