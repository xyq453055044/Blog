package com.blog.controller;

import com.blog.model.Article;
import com.blog.model.ChildComment;
import com.blog.model.Comment;
import com.blog.model.User;
import com.blog.service.ArticleService;
import com.blog.service.CommentService;
import com.blog.service.UserService;
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
 * @date 2019/07/02
 */
@Controller
public class DetailController extends BaseController{

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    @RequestMapping("/detail")
    public String detailById(Model model,
                             @RequestParam(value = "aId") String aId){
        User user = (User) getSession().getAttribute("user");
        User admin = userService.findAdmin();
        //Long ad = Long.parseLong(aId);
        Article articleByAId = articleService.findArticleByAId(Long.parseLong(aId));
        articleService.modifyArticlePageView(Long.parseLong(aId));
        //Long.parseLong(String s); 将字符串改为 进制数  默认是十进制
        List<Comment>  comments = commentService.findAllCommentsByAId(Long.parseLong(aId));
        Map<Long, List<ChildComment>> allChildComments = new HashMap<>();
        Map<Long, String> commentMaps = new HashMap<>();
        System.out.println("articleByAId" + articleByAId);
        System.out.println("comments" + comments);

        for (Comment comment : comments){
            User u = userService.findUserById(comment.getById());
            commentMaps.put(u.getId(), u.getName());

            List<ChildComment> childComments = commentService.findChildCommentsByCId(comment.getcId());
            allChildComments.put(comment.getcId(), childComments);
        }

        List<User> users = userService.findAllUsers();


        model.addAttribute("users", users);
        model.addAttribute("admin", admin);
        model.addAttribute("commentMaps", commentMaps);
        model.addAttribute("comments", comments);
        model.addAttribute("article", articleByAId);
        model.addAttribute("user", user);
        model.addAttribute("allChildComments", allChildComments);
        return "./detail";

    }

    @RequestMapping("/submitComment")
    @ResponseBody
    public Map<String, Object> submitComment(String aId, String id, String content){
        Map<String, Object> map = new HashMap<>();

        if (StringUtils.isBlank(id)){
            map.put("message", "Fail");
            return map;
        }

        articleService.modifyArticleCommentNum(Long.parseLong(aId));

        Comment comment = new Comment();

        comment.setaId(Long.parseLong(aId));
        comment.setById(Long.parseLong(id));
        comment.setContent(content);
        comment.setCreateTime(new Date());
        commentService.addComment(comment);

        User user = userService.findUserById(Long.parseLong(id));
        map.put("message", user.getName());
        return map;
    }

    @RequestMapping("/submitChildComment")
    @ResponseBody
    public Map<String, Object> submitChildComment(String articleId, String cId, String byId, String content){

        articleService.modifyArticleCommentNum(Long.parseLong(articleId));

        Map<String , Object> map = new HashMap<>();
        if (StringUtils.isBlank(byId)){
            map.put("message", "Fail");
            return map;
        }

        ChildComment childComment = new ChildComment();
        childComment.setcId(Long.parseLong(cId));
        childComment.setById(Long.parseLong(byId));
        childComment.setContent(content);
        childComment.setCreateTime(new Date());

        commentService.addChildComment(childComment);

        User user = userService.findUserById(Long.parseLong(byId));
        map.put("message", user.getName());

        return map;
    }
}
