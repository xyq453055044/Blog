package com.blog.controller;

import com.blog.base.CodeEnum;
import com.blog.common.CommonResponse;
import com.blog.service.RegisterService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author xyq
 * @date 2019/06/29
 */
@Controller
public class RegisterController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CaptchaController.class);

    @Autowired
    private RegisterService registerService;

    @RequestMapping("/doRegister")
    @ResponseBody
    public String doRegister(String email, String password, String rePassword, String captcha,
                             HttpServletRequest request) {
        try {
            String oldCaptcha = (String) request.getSession().getAttribute("captcha");
            String message = registerService.register(email, password, rePassword, captcha, oldCaptcha);


            return new CommonResponse(CodeEnum.SUCCESS.getValue(), message).toJSONString();
        } catch (Exception e) {
            LOGGER.error("", e);
            return new CommonResponse(CodeEnum.CAPTCHA_ERROR.getValue(), e.getMessage()).toJSONString();
        }
    }


}
