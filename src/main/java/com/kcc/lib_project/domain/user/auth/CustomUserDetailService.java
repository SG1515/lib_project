package com.kcc.lib_project.domain.user.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.domain.user.mapper.UserMapper;
import java.util.*;

@Service
public class CustomUserDetailService implements UserDetailsService {

  @Autowired
  private UserMapper userMapper;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @Override
  public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
    UserDto user = userMapper.getUserById(id);

    if (user == null) {
      throw new UsernameNotFoundException("User not found with id: " + id);
    }

//    System.out.println("아이디 : " + user.getId());
//    System.out.println("비밀번호 : " + user.getPassword());

    // 비밀번호 검증
    // if (!validatePassword(rawPassword, user.getPassword())) {
    // throw new BadCredentialsException("Invalid password");
    // }

    return new UserDetail(user);
  }

  public boolean validatePassword(String rawPassword, String encodedPassword) {
    return passwordEncoder.matches(rawPassword, encodedPassword);
  }

}
