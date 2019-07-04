package com.blog.service.impl;

import com.blog.dao.UserDao;
import com.blog.model.User;
import com.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author xyq
 * @date 2019/07/01
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findAdmin() {
        return userDao.selectAdmin();
    }

    @Override
    public User findUserByEmail(String mail) {

        return userDao.selectUserByEmail(mail);
    }

    @Override
    public void updateState(String mail, String state) {
        userDao.updateState(mail, state, new Date());
    }

    @Override
    public void modifyUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public List<User> findAllUsers() {
        return userDao.selectAllUsers();
    }

    @Override
    public User findUserById(Long id) {
        return userDao.selectUserById(id);
    }

    @Override
    public void removeUserById(long id) {
        userDao.deleteUserById(id);
    }


}
