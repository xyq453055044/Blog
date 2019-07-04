package com.blog.controller;

import com.blog.model.*;
import com.blog.service.ArticleService;
import com.blog.service.FriendLinkService;
import com.blog.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @author xyq
 * @date 2019/07/01
 */
@Controller
public class HomeController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private FriendLinkService friendLinkService;

    @Autowired
    private ArticleService articleService;

    @GetMapping("/home")
    public String home(Model model,
                       @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                       @RequestParam(value = "time", required = false) String time) {
        // 从Session中获取用户
        User user = (User) getSession().getAttribute("user");
        model.addAttribute("user", user);

        if (StringUtils.isNotBlank(time)) {
            List<Article> articles = articleService.findAllArticles();
            List<Article> articlesByCreateTime = new ArrayList<>();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月");
            for (Article article : articles) {
                String formatTime = formatter.format(article.getCreateTime());
                if (formatTime.equals(time)) {
                    articlesByCreateTime.add(article);
                }
            }
            model.addAttribute("articlesByCreateTime", articlesByCreateTime);
        } else {
            // 分页插件PageHelper进行分页（pageNUm表示当前为第几页，从Get中获取，pageSize表示每页显示多少条数据）
            PageHelper.startPage(pageNum, 5);
            List<Article> articles = articleService.findAllArticles();
            PageInfo<Article> pageInfo = new PageInfo<>(articles);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("articles", articles);
        }

        List<Article> articlesByPageView = articleService.findAllArticlesOrderByPageView();
        List<POCategory> articleCategory = articleService.findCountCategory();
        List<POTime> yearAndMonths = articleService.findCountYearAndMonth();
        User admin = userService.findAdmin();
        List<FriendLink> links = friendLinkService.findAllFriendLink();

        model.addAttribute("articlesByPageView", articlesByPageView);
        model.addAttribute("categories", articleCategory);
        model.addAttribute("yearAndMonths", yearAndMonths);
        model.addAttribute("admin", admin);
        model.addAttribute("links", links);


        model.addAttribute("pageNumber", pageNum);
        return "../home";
    }
}
