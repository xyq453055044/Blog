package com.blog.controller;

import com.blog.base.CodeEnum;
import com.blog.common.CommonResponse;
import com.blog.service.CaptchaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author xyq
 * @date 2019/06/29
 */
@Controller
public class CaptchaController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CaptchaController.class);

    @Autowired
    private CaptchaService captchaService;

    @RequestMapping("/captcha")
    @ResponseBody
    public String captcha(HttpServletRequest request){
        try{
            request.getSession().removeAttribute("captcha");
            String captcha = captchaService.genCaptcha();
            request.getSession().setAttribute("captcha", captcha);
            Map<String, Object> data = new HashMap<>();
            String newCaptcha = captchaService.getCaptcha(captcha);
            data.put("image", newCaptcha);
            return new CommonResponse(CodeEnum.SUCCESS.getValue(), "验证码生成成功", data).toJSONString();
        }catch (Exception e){
            LOGGER.error("", e);
            return new CommonResponse(CodeEnum.CAPTCHA_ERROR.getValue(), e.getMessage()).toJSONString();
        }
    }

}
