package com.kcc.lib_project.domain.user.dto;

import com.kcc.lib_project.domain.user.vo.UserRole;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserDto {

  private String id;
  private String password;
  private String role = UserRole.ROLE_USER.getRole();

  @Builder
  public UserDto(String id, String password) {
    this.id = id;
    this.password = password;
  }
}
