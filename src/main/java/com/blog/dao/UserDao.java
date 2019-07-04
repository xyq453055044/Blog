package com.blog.dao;


import com.blog.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author xyq
 * @date 2019/06/29
 */
public interface UserDao {

    /**
     * 获取用户邮箱
     * @param email
     * @return
     */
    User selectUserByUsername(String email);

    void insertUser(User user);

//    void updateUser(User user);

    User selectAdmin();

    void updatePassword(@Param("password") String passwordMd5, @Param("updateTime") Date date, @Param("email") String email);

    User updateState(@Param("email") String mail, @Param("state") String state, @Param("updateTime") Date date);

    User selectUserByEmail(@Param("email") String mail);

    void updateUser(User user);

    List<User> selectAllUsers();

    User selectUserById(Long id);

    void deleteUserById(long id);
}
