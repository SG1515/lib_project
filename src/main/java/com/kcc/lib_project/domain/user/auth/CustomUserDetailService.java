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

  public CustomUserDetailService(UserMapper userMapper) {
    this.userMapper = userMapper;
  }

  @Override
  public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
    UserDto user = userMapper.getUserById(id).orElseThrow(() -> new UsernameNotFoundException("User not found with id: " + id));

    if (user == null) {

      return null;
    }

    System.out.println("아이디 : " + user.getId());
    System.out.println("비밀번호 : " + user.getPassword());

    return new UserDetail(user);
  }


}
