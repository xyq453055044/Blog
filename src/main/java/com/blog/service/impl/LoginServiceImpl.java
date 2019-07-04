package com.blog.service.impl;

import com.blog.dao.UserDao;
import com.blog.model.User;
import com.blog.service.LoginService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * @author xyq
 * @date 2019/06/29
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserDao userDao;
    @Override
    public String login(String email, String password, String captcha, String oldCaptcha) throws Exception{
        if (StringUtils.isEmpty(email)){
            throw new Exception("邮箱不能为空");
        }

        if (password.length() < 6)
        {
            throw new Exception("密码长度不能小于6位");

        }

        if (!captcha.equals(oldCaptcha)){
            throw new Exception("验证错误");
        }

        User user = userDao.selectUserByUsername(email);
        if (user == null){
            throw new Exception("用户不存在");

        }

        PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        boolean isMatches = passwordEncoder.matches(password, user.getPassword());

        if (!isMatches){
            throw new Exception("密码不相等");
        }

        if (!user.getState().equals("1")){
            throw new Exception("请激活邮箱");
        }

        return "登录成功";



    }
}
