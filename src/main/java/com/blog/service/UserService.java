package com.blog.service;

import com.blog.model.User;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/01
 */
public interface UserService {

    User findAdmin();

    User findUserByEmail(String mail);



    void updateState(String mail, String state);

    void modifyUser(User user);

    List<User> findAllUsers();

    User findUserById(Long id);

    void removeUserById(long id);
}
