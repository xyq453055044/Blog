package com.blog.service.impl;

import com.blog.dao.UserDao;
import com.blog.mail.SendEmail;
import com.blog.service.RegisterService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.blog.model.User;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.concurrent.TimeUnit;


/**
 * @author xyq
 * @date 2019/06/29
 */
@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private UserDao userDao;

    @Override
    public String register(String email, String password, String rePassword, String captcha, String oldCaptcha) {
        if (StringUtils.isEmpty(email)) {
            return "邮箱不能为空";
        }

        if (password.length() < 6) {
            return "密码小于6位";
        }

        if (!password.equals(rePassword)) {
            return "两次密码不相等";
        }
        if (!captcha.equals(oldCaptcha)) {
            return "验证码输入错误";
        }

        User user = userDao.selectUserByUsername(email);
        if (user != null) {
            return "用户名已存在";
        }

        PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        String passwordMd5 = passwordEncoder.encode(password);

        user = new User();
        user.setEmail(email);
        user.setName("博客" + System.currentTimeMillis());
        user.setPassword(passwordMd5);
        user.setState("0");
        user.setAdmin("0");
        user.setDescription("对方很懒，没有留下简介");
        user.setAddress("江苏-杭州");
        user.setUpdateTime(new Date());
        user.setCreateTime(new Date());

        userDao.insertUser(user);

        String code = email + password;
        String validateCode = passwordEncoder.encode(code);

        String msg = "个人博客激活邮件通知";

        // 注册成功发送激活邮件
        SendEmail.sendEmailMessage(email, validateCode, msg);
        String message = email + "," + validateCode;
        return "注册成功" + message;
    }

}

