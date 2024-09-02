package com.kcc.lib_project.domain.user.service;

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
    System.out.println(signupDto.toString());
    userMapper.saveUser(signupDto);
  }
  
}
