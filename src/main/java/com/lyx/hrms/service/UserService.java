package com.lyx.hrms.service;


import com.lyx.hrms.domain.User;
import com.lyx.hrms.dto.CheckUsernameResult;
import com.lyx.hrms.dto.LoginDto;
import com.lyx.hrms.dto.PageQueryResult;
import com.lyx.hrms.dto.UserRegisterDto;

import java.util.List;

/**
 * 用户业务相关接口
 *
 *
 */
public interface UserService {

    /**
     * 用户注册
     *
     * @param userRegisterDto 用户注册DTO西乡
     * @return 注册成功-true，否则-false
     */
    boolean register(UserRegisterDto userRegisterDto);

    /**
     * 用户登录
     *
     * @param loginDto 用户登录DTO对象
     * @return 是否登录成功
     */
    boolean login(LoginDto loginDto);

    /**
     * 根据id查找用户对象
     *
     * @param id 用户的id主键
     * @return 用户对象
     */
    User getUserById(Integer id);

    User findByUsername(String username);

    /**
     * 检查用户名是否可以注册（用户名是否已经存在）
     *
     * @param username 用户名
     * @return 检查用户名是否存在的结果对象
     */
    CheckUsernameResult checkUsername(String username);

    /**
     * 用户更改信息
     *
     * @param user 用户更改信息的DTO
     * @return 是否更改成功
     */
    boolean updateUserInfo(User user);

    boolean updatePassword(User user);

    boolean modifyStatus(User user);

    PageQueryResult<User> pageUser(Integer currentPage,Integer pageSize);

    List<User> findByPhone(String phone);

}
