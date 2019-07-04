package com.blog.service;

/**
 * @author xyq
 * @date 2019/06/29
 */
public interface RegisterService {

    /**
     * 验证注册信息
     * @param email
     * @param password
     * @param rePassword
     * @param captcha
     * @param oldCaptcha
     */
    String register(String email, String password, String rePassword, String captcha, String oldCaptcha);
}
