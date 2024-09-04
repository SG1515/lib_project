package com.kcc.lib_project.domain.admin.repository;


import com.kcc.lib_project.domain.user.dto.UserDto;
import org.springframework.stereotype.Repository;

import java.util.Optional;

public interface AdminRepository {

    Optional<UserDto> getUserById(String id);

}
