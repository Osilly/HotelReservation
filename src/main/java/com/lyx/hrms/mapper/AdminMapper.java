package com.lyx.hrms.mapper;

import com.lyx.hrms.domain.Admin;

import java.util.List;

/**
 *
 * 管理员数据持久层接口---增删只能超级管理员使用
 */
public interface AdminMapper {

    int save(Admin admin);

    int delete(Integer id);

    int update(Admin admin);

    Admin findByEmpNum(String empNum);

    Admin findById(Integer id);

    Admin findByUsername(String username);

    List<Admin> listAll();
}
