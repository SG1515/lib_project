package com.kcc.lib_project.domain.admin.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper  {

    public void getUserById(String id);
}
