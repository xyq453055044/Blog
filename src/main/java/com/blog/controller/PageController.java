package com.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author xyq
 * @date 2019/06/29
 */
@Controller
public class PageController {

    @RequestMapping("/login")
    public String login(){
        return "../login";
    }

    @RequestMapping("/register")
    public String register(){
        return "../register";
    }

    @RequestMapping("/home")
    public String home(){
        return "../home";
    }

    @RequestMapping("/password")
    public String password(){
        return "../password";
    }

    @RequestMapping("/email")
    public String email(){
        return "../email";
    }



}
