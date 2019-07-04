package com.blog.controller;

import com.blog.model.User;
import com.blog.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author xyq
 * @date 2019/07/03
 */
@Controller
public class ModifyController extends BaseController{

    @Autowired
    private UserService userService;

    @RequestMapping("/modifyUser")
    public String modifyUser(Model model){
        User user = (User) getSession().getAttribute("user");
        model.addAttribute("user", user);
        return "modify";
    }

    @RequestMapping("/submitModify")
    @ResponseBody
    public Map<String, Object> submitModify(String id, String password, String phone, String name,
                                            String description, String province, String city){
        User user = userService.findUserById(Long.parseLong(id));

        if (StringUtils.isNotBlank(password)){
            PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
            String password_md5 = passwordEncoder.encode(password);
            user.setPassword(password_md5);
        }
        if (StringUtils.isNotBlank(phone)){
            user.setPhone(phone);
        }
        if (StringUtils.isNotBlank(name)){
            user.setName(name);
        }
        if (StringUtils.isNotBlank(description)){
            user.setDescription(description);
        }
        if (StringUtils.isNotBlank(province) && StringUtils.isNotBlank(city)){
            user.setAddress(province + "-" + city);
        }

        userService.modifyUser(user);
        getSession().setAttribute("user", user);

        Map<String, Object> map = new HashMap<>();
        map.put("message", "success");

        return map;
    }

}
