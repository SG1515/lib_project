package com.kcc.lib_project.domain.user.vo;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public enum UserRole {
  ROLE_USER("ROLE_USER"),
  ROLE_ADMIN("ROLE_ADMIN");

  private final String role;
  public static UserRole fromRole(String role) {
    for (UserRole userRole : UserRole.values()) {
        if (userRole.getRole().equals(role)) {
            return userRole;
        }
    }
    throw new IllegalArgumentException("No matching role for " + role);
}

}
