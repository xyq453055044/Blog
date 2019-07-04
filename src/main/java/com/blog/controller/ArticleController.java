package com.blog.controller;

import com.blog.model.Article;
import com.blog.model.POCategory;
import com.blog.model.User;
import com.blog.service.ArticleService;
import com.blog.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/02
 */
@Controller
public class ArticleController extends BaseController{

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    @RequestMapping("/article")
    public String article(Model model,
                          @RequestParam(value = "category", defaultValue = "") String category,
                          @RequestParam(value="pageNum", defaultValue = "1") Integer pageNum){
        User admin = userService.findAdmin();

        List<Article> articles = null;
        PageInfo<Article> pageInfo = null;

        if (StringUtils.isBlank(category)){
            PageHelper.startPage(pageNum, 6);
            articles = articleService.findAllArticles();
            pageInfo = new PageInfo<>(articles);
        }else {
            PageHelper.startPage(pageNum, 6);
            articles = articleService.findArticlesByCategory(category);
            pageInfo = new PageInfo<>(articles);
        }

        List<Article> saveArticles = articleService.findAllArticles();
        List<POCategory> categories = articleService.findCountCategory();
        List<Article> recommends = getRecommends(saveArticles);
        List<Article> randomLooks = getRandomLooks(saveArticles);

        User user = (User) getSession().getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("articles", articles);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("admin", admin);
        model.addAttribute("categories", categories);
        model.addAttribute("recommends", recommends);
        model.addAttribute("randomLooks", randomLooks);
        model.addAttribute("pageNumber", pageNum);

        return "./article";
    }
}
