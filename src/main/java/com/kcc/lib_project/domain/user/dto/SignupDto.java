package com.kcc.lib_project.domain.user.dto;

import com.kcc.lib_project.domain.user.vo.UserRole;
import jakarta.validation.constraints.Pattern;
import lombok.*;

import java.time.LocalDate;

import org.apache.ibatis.javassist.tools.framedump;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SignupDto {
    private String id;
    private String password;
    private String name;
    private String email;
    private LocalDate created_at;
    private String birth;
    @Pattern(regexp = "(([가-힣]|\\\\d)+(시 ))+(([가-힣]|\\\\d)+(구))")
    private String address;
    private String role = UserRole.ROLE_USER.getRole();
    private int phone;
    private int address_checked = 0;
    
    @Builder
    public SignupDto( String id, String password, String name, String email, LocalDate created_at, String birth, String address, int phone, String role, int address_checked) {
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
