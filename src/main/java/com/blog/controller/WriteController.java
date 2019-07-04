package com.blog.controller;

import com.blog.model.Article;
import com.blog.model.POCategory;
import com.blog.model.User;
import com.blog.service.ArticleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xyq
 * @date 2019/07/04
 */
@Controller
public class WriteController extends BaseController{

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/write")
    public String writeArticle(Model model){
        User user = (User) getSession().getAttribute("user");
        List<POCategory> categories = articleService.findCountCategory();
        model.addAttribute("categories", categories);
        model.addAttribute("user" ,user);
        return "write";
    }

    @RequestMapping("/doWrite")
    @ResponseBody
    public Map<String, Object> doWrite(@RequestParam("aId") String aId,
                                       @RequestParam("title") String title,
                                       @RequestParam("editor") String content,
                                       @RequestParam("modules") String modules,
                                       @RequestParam("category") String category,
                                       @RequestParam(value = "open", required = false) String open){
        Map<String, Object> map = new HashMap<>();
        User user = (User) getSession().getAttribute("user");

        Article art = null;

        if (StringUtils.isNotBlank(aId)){
            art = articleService.findArticleByAId(Long.parseLong(aId));
        }

        if(art == null){

            Article article = new Article();
            article.setId(user.getId());
            article.setTitle(title);
            article.setContent(content);

            if (!StringUtils.isBlank(modules)){
                article.setCategory(modules);
            }else {
                article.setCategory(category);
            }

            if (StringUtils.isBlank(open)){
                article.setPersonal("1");
            }else {
                article.setPersonal("0");
            }

            article.setCreateTime(new Date());
            article.setPageView(0);
            article.setCommentNum(0);
            article.setRecommend("0");

            articleService.addArticle(article);
            map.put("message", "addSuccess");
        }else {
            art.setTitle(title);
            art.setContent(content);

            if (!StringUtils.isBlank(modules)){
                art.setCategory(modules);
            }else {
                art.setCategory(category);
            }

            if (StringUtils.isBlank(open)){
                art.setPersonal("1");
            }else {
                art.setPersonal("0");
            }

            articleService.modifyArticle(art);
            map.put("message", "modifySuccess");
        }
        return map;
    }
}
