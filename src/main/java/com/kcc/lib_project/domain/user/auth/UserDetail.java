package com.kcc.lib_project.domain.user.auth;

import com.kcc.lib_project.domain.user.dto.UserDto;
import com.kcc.lib_project.domain.user.vo.UserRole;
import jakarta.validation.Valid;
import lombok.Data;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Getter
public class UserDetail implements UserDetails {

  private UserDto userDto;

  public UserDetail(UserDto userDto) {
    //생성될 때 admin이면 Role을 설정해주기.
    if(userDto.getId().equals("admin")){
      userDto.setRole(UserRole.ROLE_ADMIN.getRole());
    }
    System.out.println(userDto.getRole());
    this.userDto = userDto;
  }

  // 추가된 getRole() 메서드
  public String getRole() {
    return userDto.getRole();
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
