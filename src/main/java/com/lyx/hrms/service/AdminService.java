package com.lyx.hrms.service;

import com.lyx.hrms.domain.Admin;
import com.lyx.hrms.dto.AddAdminDto;
import com.lyx.hrms.dto.CheckUsernameResult;
import com.lyx.hrms.dto.LoginDto;

import java.util.List;

/**
 *
 */
public interface AdminService {

    /**
     * 超级管理员指定
     *
     * @return
     */
    boolean register(AddAdminDto addAdminDto);

    /**
     * 超级管理员权限
     *
     * @param id
     * @return
     */
    boolean delete(Integer id);

    Admin login(LoginDto loginDto);

    boolean updatePassword(Admin admin);

    Admin getById(Integer id);

    CheckUsernameResult checkUsername(String username);

    List<Admin> listAll();
}
