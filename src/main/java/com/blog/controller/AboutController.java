package com.blog.controller;

import com.blog.model.AboutBlog;
import com.blog.model.AboutBlogVersion;
import com.blog.model.User;
import com.blog.service.AboutBlogService;
import com.blog.service.AboutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xyq
 * @date 2019/07/03
 */
@Controller
public class AboutController extends BaseController{

    @Autowired
    private AboutService aboutService;

    @Autowired
    private AboutBlogService aboutBlogService;

    /**
     * 用Get方式返回about页面
     * @param model model
     * @return 返回about页面
     */
    @RequestMapping("/about")
    public String about(Model model){

        User user = (User) getSession().getAttribute("user");
        AboutBlog aboutBlog = aboutService.findAboutBlog();
        List<AboutBlogVersion> aboutBlogVersions = aboutBlogService.findAboutBlogVersions();

        model.addAttribute("user", user);
        model.addAttribute("aboutBlog", aboutBlog);
        model.addAttribute("aboutBlogVersions", aboutBlogVersions);

        return "about";
    }

    @RequestMapping("/submitBlogIntro")
    @ResponseBody
    public Map<String, Object> submitBlogIntro(String content, Short blogIntroId){
        Map<String, Object> map = new HashMap<>();
        AboutBlog aboutBlog = aboutService.findAboutBlogById(blogIntroId);
        if (aboutBlog != null){
            aboutBlog.setAbBlogIntro(content);
            aboutBlog.setAbBlogModifyTime(new Date());
            aboutBlogService.modifyAboutBlog(aboutBlog);
            map.put("message", "success");
        }else {
            map.put("message", "fail");
        }
       return map;
    }


}
