package com.blog.service.impl;

import com.blog.dao.UserDao;
import com.blog.mail.SendEmail;
import com.blog.model.User;
import com.blog.service.CaptchaService;
import com.blog.service.SetPasswordService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author xyq
 * @date 2019/07/01
 */
@Service
public class SetPasswordServiceImpl implements SetPasswordService {

    @Autowired
    private CaptchaService captchaService;

    @Autowired
    private UserDao userDao;

    @Override
    public String checkEmail(String email, String captcha, String oldCaptcha, HttpServletRequest request) {

        if (StringUtils.isEmpty(email)) {
            return "邮箱不能为空";
        }

        if (!captcha.equals(oldCaptcha)) {
            return "验证码输入错误";
        }

        User user = userDao.selectUserByUsername(email);
        if (user == null) {
            return "用户名不存在";
        }

        //生成验证码
        request.getSession().removeAttribute("emailCaptcha");
        String validateCode = captchaService.genCaptcha();
        request.getSession().setAttribute("emailCaptcha", validateCode);

        String msg = "重置密码的验证码为：" + validateCode;

        // 邮箱存在给该邮箱发送验证码
        SendEmail.sendEmailMessage(email, validateCode, msg);

        return "验证码已发送到邮箱";
    }

    @Override
    public String checkvalidateCode(String validateCode, String emailCode) {

        if (!validateCode.equals(emailCode)) {
            return "验证码输入错误";
        }

        return "验证码正确";
    }

    @Override
    public String setPassword(String email, String password, String rePassword, String emailCode , String oldEmailCode, String captcha, String oldCaptcha) {

        if (!emailCode.equals(oldEmailCode)) {
            return "邮箱验证码输入错误";
        }

        if (!captcha.equals(oldCaptcha)) {
            return "验证码输入错误";
        }

        PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        String passwordMd5 = passwordEncoder.encode(password);
        userDao.updatePassword(passwordMd5, new Date(), email);
        return "设置密码成功";
    }
}
