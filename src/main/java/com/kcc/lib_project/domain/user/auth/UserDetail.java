package com.kcc.lib_project.domain.user.auth;

import com.kcc.lib_project.domain.user.dto.UserDto;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class UserDetail implements UserDetails {

  private UserDto userDto;

  public UserDetail(UserDto userDto) {
    this.userDto = userDto;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    Collection<GrantedAuthority> collect = new ArrayList<>();
    collect.add((GrantedAuthority) () -> userDto.getRole());
    return collect;
  }

  @Override
  public String getPassword() {
    return userDto.getPassword();
  }

  @Override
  public String getUsername() {
    return userDto.getId();
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }
}
