package com.blog.service;

import java.io.IOException;

/**
 * @author xyq
 * @date 2019/06/29
 */
public interface CaptchaService {

    /**
     * 获取验证码
     * @param codeCaptcha
     * @return 验证码
     * @throws IOException
     */
    String getCaptcha(String codeCaptcha) throws IOException;

    /**
     * 生成验证码
     * @return
     */
    String genCaptcha();
}
