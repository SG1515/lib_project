package com.kcc.lib_project.domain.user.dto;

import com.kcc.lib_project.domain.user.vo.UserRole;

import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
public class UserDto {

  private String id;
  private String password;
  private String role = UserRole.ROLE_USER.getRole();
  private String name;
  private String email;
  private String birth;
  @Pattern(regexp = "(([가-힣]|\\\\d)+(시 ))+(([가-힣]|\\\\d)+(구))")
  private String address;
  private int phone;

  @Builder
  public UserDto(String id, String password, String name, String email, String birth, String address, int phone) {
    this.id = id;
    this.password = password;
    this.name = name;
    this.email = email;
    this.birth = birth;
    this.address = address;
    this.phone = phone;
  }
}
