package com.lyx.hrms.mapper;

import com.lyx.hrms.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author
 * @date
 */
public interface UserMapper {

	/**
	 * 增加一个用户对象
	 * @param user 用户对象
	 * @return 受影响的行数
	 */
	int save(User user);
	
	/**
	 * 更新一个用户对象
	 * @param user 用户对象
	 * @return 受影响的行数
	 */
	int update(User user);
	
	/**
	 * 查找一个用户对象，根据用户名
	 * @param username 用户名
	 * @return 查找到的用户对象
	 */
	User findByUsername(String username);
	
	/**
	 * 查找一个用户对象，根据主键id
	 * @param id 主键
	 * @return 查找到的用户对象
	 */
	User findById(Integer id);

	int modifyStatus(User user);

	Integer countAll();

	List<User> pageUser(@Param("offset") Integer offset,
						@Param("pageSize") Integer pageSize);

	List<User> queryByPhone(String phone);
}
