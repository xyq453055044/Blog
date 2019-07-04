package com.blog.controller;

import com.blog.model.Article;
import com.blog.model.User;
import com.blog.service.ArticleService;
import com.blog.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xyq
 * @date 2019/07/03
 */
@Controller
public class AdminController extends BaseController{

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;



    @RequestMapping("/admin")
    public String admin(Model model,
                        @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum){
        User user = (User) getSession().getAttribute("user");

        PageHelper.startPage(pageNum, 12);
        List<Article> articles = articleService.findAllArticles();
        PageInfo<Article> pageInfo = new PageInfo<>(articles);

        PageHelper.startPage(pageNum, 12);
        List<User> users = userService.findAllUsers();
        PageInfo<User> pageInfoUser = new PageInfo<>(users);

        model.addAttribute("user", user);
        model.addAttribute("articles", articles);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("users", users);
        model.addAttribute("pageInfoUsers", pageInfoUser);

        return "admin";
    }

    @RequestMapping("/modify")
    public String modify(Model model, String aId){
        Article article = articleService.findArticleByAId(Long.parseLong(aId));
        model.addAttribute("article", article);
        return "write";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(String aId){
        articleService.removeArticleByAId(Long.parseLong(aId));
        Map<String, Object> map = new HashMap<>();
        map.put("message", "success");
        return map;
    }

    @RequestMapping("/setPermission")
    @ResponseBody
    public Map<String, Object> setPermission(String id){
        Map<String, Object> map = new HashMap<>();
        User user = userService.findUserById(Long.parseLong(id));
        if (user.getAdmin().equals("1")){
            user.setAdmin("0");
            map.put("message", "setHighPer");
        }else {
            user.setAdmin("1");
            map.put("message", "setLowerPer");
        }
        userService.modifyUser(user);
        return map;
    }

    @RequestMapping("/setRecommend")
    @ResponseBody
    public Map<String, Object> setRecommend(String aId){
        Map<String, Object> map = new HashMap<>();
        Article article = articleService.findArticleByAId(Long.parseLong(aId));
        if (article.getRecommend().equals("1")){
            article.setRecommend("0");
            map.put("message", "notRecommend");
        }else if (article.getRecommend().equals("0")){
            article.setRecommend("0");
            map.put("message", "recommend");
        }
        articleService.modifyArticle(article);
        return map;
    }


    @RequestMapping("/deleteUser")
    @ResponseBody
    public Map<String, Object> deleteUser(String id){
        userService.removeUserById(Long.parseLong(id));
        Map<String, Object> map = new HashMap<>();
        map.put("message", "success");
        return map;
    }

}
