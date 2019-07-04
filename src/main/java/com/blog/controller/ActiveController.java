package com.blog.controller;

import com.blog.model.User;
import com.blog.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * @author xyq
 * @date 2019/07/02
 */
@Controller
public class ActiveController {

    @Autowired
    private UserService userService;

    @RequestMapping("/activeCode")
    public String activeCode(Model model){
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        String validateCode = attrs.getRequest().getParameter("validateCode");
        String mail = attrs.getRequest().getParameter("email");

        User user = userService.findUserByEmail(mail);
        if (user != null && "1".equals(user.getState())){
            model.addAttribute("success", "您的邮箱已激活，请直接登录");
            return "../login";
        }
        if (StringUtils.isNotBlank(validateCode)){
            user.setState("1");
            user.setAdmin("0");

            //userService.updateState(mail, user.getState());
            userService.modifyUser(user);
            model.addAttribute("email", mail);
            return "./activeSuccess";
        }else {
            model.addAttribute("fail", "您的激活码错误,请重新激活");
            return "./activeFail";
        }
    }
}
