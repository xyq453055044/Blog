package com.blog.controller;

import com.blog.base.CodeEnum;
import com.blog.common.CommonResponse;
import com.blog.service.SetPasswordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author xyq
 * @date 2019/07/01
 */
@Controller
public class SetPasswordController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CaptchaController.class);

    @Autowired
    private SetPasswordService setPasswordService;

    @RequestMapping("/checkEmail")
    @ResponseBody
    public String checkEmail(@RequestParam("email") String email,
                             @RequestParam("captcha") String captcha,
                             HttpServletRequest request) {
        try {
            String oldCaptcha = (String) request.getSession().getAttribute("captcha");
            String message = setPasswordService.checkEmail(email, captcha, oldCaptcha, request);
            return new CommonResponse(CodeEnum.SUCCESS.getValue(), message).toJSONString();
        } catch (Exception e) {
            LOGGER.error("", e);
            return new CommonResponse(CodeEnum.CAPTCHA_ERROR.getValue(), e.getMessage()).toJSONString();
        }
    }



    @RequestMapping("/checkValidateCode")
    @ResponseBody
    public String checkValidateCode(String emailCode, HttpServletRequest request) {
        try {
            String validateCode = (String) request.getSession().getAttribute("captcha");
            String message = setPasswordService.checkvalidateCode(validateCode, emailCode);
            return new CommonResponse(CodeEnum.SUCCESS.getValue(), message).toJSONString();
        } catch (Exception e) {
            LOGGER.error("", e);
            return new CommonResponse(CodeEnum.CAPTCHA_ERROR.getValue(), e.getMessage()).toJSONString();
        }
    }

    @RequestMapping("/setPassword")
    @ResponseBody
    public String setPassword(String email,  String password, String rePassword,String emailCode, String captcha,
                              HttpServletRequest request) {
        try {
            String oldCaptcha = (String) request.getSession().getAttribute("captcha");
            String oldEmailCode = (String) request.getSession().getAttribute("emailCaptcha");
            String message = setPasswordService.setPassword(email, password, rePassword, emailCode, oldEmailCode, captcha, oldCaptcha);
            return new CommonResponse(CodeEnum.SUCCESS.getValue(), message).toJSONString();
        } catch (Exception e) {
            LOGGER.error("", e);
            return new CommonResponse(CodeEnum.CAPTCHA_ERROR.getValue(), e.getMessage()).toJSONString();
        }
    }


}
