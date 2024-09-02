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
  
  private int user_id;
  private String id;
  private String password;
  private String name;
  private String email;
  private LocalDate created_at;
  private String birth;
  private String address;
  private int phone;
  private String role;
  private int address_checked;

  @Builder
  public UserVo (String id, String password, String name, String email, LocalDate created_at, String birth, String address, int phone, String role, int address_checked){
    this.id = id;
    this.password = password;
    this.name = name;
    this.email = email;
    this.created_at = created_at;
    this.birth = birth;
    this.address = address;
    this.phone = phone;
    this.role = role;
    this.address_checked = address_checked;
  } 

}
