package com.kcc.lib_project.domain.user.service;

import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.global.exception.type.UserAlreadyExistsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kcc.lib_project.domain.user.dto.SignupDto;
import com.kcc.lib_project.domain.user.mapper.UserMapper;
import com.kcc.lib_project.domain.user.vo.UserVo;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.LocalDate;
import java.util.List;

@Service
public class UserService {

  @Autowired
  UserMapper userMapper;

  
  private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserService(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }
  
  LocalDate localTime = LocalDate.now();

  @Transactional
  public void  saveUser(SignupDto signupDto) {
    signupDto.setPassword(passwordEncoder.encode(signupDto.getPassword()));
    signupDto.setCreated_at(localTime);


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
  
}
