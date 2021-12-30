package com.lyx.hrms.service.impl;


import com.lyx.hrms.domain.User;
import com.lyx.hrms.dto.CheckUsernameResult;
import com.lyx.hrms.dto.LoginDto;
import com.lyx.hrms.dto.PageQueryResult;
import com.lyx.hrms.dto.UserRegisterDto;
import com.lyx.hrms.mapper.UserMapper;
import com.lyx.hrms.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 用户业务层
 */
@Service
public class UserServiceImpl implements UserService {

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    @Autowired
    private UserMapper userMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean register(UserRegisterDto userRegisterDto) {
        boolean flag = false;
        User temp = userMapper.findByUsername(userRegisterDto.getUsername());
        if (temp == null
                && userRegisterDto.getPassword() != null
                && userRegisterDto.getRePassword() != null
                && userRegisterDto.getRePassword().equals(userRegisterDto.getPassword())) {
            String md5 = DigestUtils.md5Hex(userRegisterDto.getPassword());
            User user = new User(
                    userRegisterDto.getUsername(),
                    md5,
                    userRegisterDto.getEmail(),
                    userRegisterDto.getPhone(),
                    userRegisterDto.getRealName(),
                    userRegisterDto.getGender(),
                    userRegisterDto.getPhotoPath()
            );
            user.setStatus(1);
            flag = userMapper.save(user) == 1;
        }
        return flag;
    }

    @Override
    public boolean login(LoginDto loginDto) {
        boolean flag = false;
        User temp = userMapper.findByUsername(loginDto.getUsername());
        if (temp != null || temp.getStatus() != 0) {
            String md5 = DigestUtils.md5Hex(loginDto.getPassword());
            flag = temp.getPassword().equals(md5);
            if (flag) {
                loginDto.setUsername(temp.getUsername());
                loginDto.setId(temp.getId());
                loginDto.setRealName(temp.getRealName());
            }
        }
        return flag;
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.findById(id);
    }

    @Override
    public User findByUsername(String username) {
        if (!StringUtils.isEmpty(username)) {
            return userMapper.findByUsername(username);
        }
        return null;
    }

    @Override
    public CheckUsernameResult checkUsername(String username) {
        boolean valid = userMapper.findByUsername(username) == null;
        String message = valid ? "该用户名可以注册!!!" : "该用户名已被注册,请更换!!!";
        return new CheckUsernameResult(username, valid, message);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean updateUserInfo(User user) {
        return userMapper.update(user) == 1;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public boolean updatePassword(User user) {
        user.setPassword(DigestUtils.md5Hex(user.getPassword()));
        return userMapper.update(user) == 1;
    }

    @Override
    public boolean modifyStatus(User user) {
        return userMapper.modifyStatus(user) == 1;
    }

    @Override
    public PageQueryResult<User> pageUser(Integer currentPage, Integer pageSize) {
        Integer totalRecords = userMapper.countAll();
        currentPage = currentPage == null ? 1 : currentPage;
        pageSize = pageSize == null ? 10 : pageSize;
        List<User> userList = userMapper.pageUser((currentPage - 1) * pageSize, pageSize);
        int totalPages = (totalRecords - 1) / pageSize + 1;
        return new PageQueryResult<>(currentPage, pageSize, totalRecords, totalPages, userList);
    }

    @Override
    public List<User> findByPhone(String phone) {
        return userMapper.queryByPhone(phone);
    }
}
