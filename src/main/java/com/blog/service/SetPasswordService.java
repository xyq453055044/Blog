package com.blog.service;

import javax.servlet.http.HttpServletRequest;

/**
 * @author xyq
 * @date 2019/07/01
 */
public interface SetPasswordService {


    String checkEmail(String email, String captcha, String oldCaptcha, HttpServletRequest request);

    String checkvalidateCode(String validateCode, String emailCode);

    String setPassword(String email, String password, String rePassword, String emailCode , String oldEmailCode, String captcha, String oldCaptcha);
}
