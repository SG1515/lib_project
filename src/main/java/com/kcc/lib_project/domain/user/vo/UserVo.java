package com.kcc.lib_project.domain.user.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;
import java.time.LocalDate;

import jakarta.validation.constraints.Pattern;


@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UserVo {
  
  private Long userId;
  private String id;
  private String password;
  private String name;
  private String email;
  private LocalDate createdAt;
  private String birth;
  private String address;
  private int phone;
  private String role;
  private int addressChecked;

  @Builder
  public UserVo(String address, int addressChecked, String birth, LocalDate createdAt, String email, String id, String name, String password, int phone, String role, Long userId) {
    this.address = address;
    this.addressChecked = addressChecked;
    this.birth = birth;
    this.createdAt = createdAt;
    this.email = email;
    this.id = id;
    this.name = name;
    this.password = password;
    this.phone = phone;
    this.role = role;
    this.userId = userId;
  }
}
