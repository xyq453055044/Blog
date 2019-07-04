package com.blog.service;

/**
 * @author xyq
 * @date 2019/06/29
 */
public interface LoginService {

    /**
     * 登录验证
     * @param email
     * @param password
     * @param captcha
     * @param oldCaptcha
     * @return
     */
    String login(String email, String password, String captcha, String oldCaptcha) throws Exception;
}
