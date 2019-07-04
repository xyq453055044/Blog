package com.blog.controller;

import com.blog.model.Article;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import xin.xihc.utils.common.DateUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * @author xyq
 * @date 2019/07/01
 */
public class BaseController {

    /**
     * 获取request
     *
     * @return request对象
     */
    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getRequest();
    }

    /**
     * 获取response
     *
     * @return response对象
     */
    public static HttpServletResponse getResponse() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
    }

    /**
     * 获取Session
     *
     * @return Session对象
     */
    public static HttpSession getSession() {
        HttpSession session = null;
        try {
            session = getRequest().getSession();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return session;
    }

    public static String fileUpload(MultipartFile imageFile, HttpServletRequest request) throws IOException {
        String fileName = null;
        if (!imageFile.isEmpty()) {
            //获取项目跟路径
            String filePath = request.getServletContext().getRealPath("/");
            //获取项目名
            String projectName = request.getContextPath();
            //将项目根路径下的项目名称置为空，因为图片需要在项目外的webapp下面存放,sub截取下标为1的字符
            filePath = filePath.replace(projectName.substring(1), "");
            System.out.println("filePath" + filePath);
            //重新生成文件名字
            fileName = DateUtil.getNow() + "." + imageFile.getOriginalFilename().split("\\.")[1];
            System.out.println("fileName" + fileName);
            //将文件保存到指定目录
            imageFile.transferTo(new File(filePath + "images/uploadImg/" + fileName));
        }
        //返回文件名字供保存
        return fileName;
    }

    // 获得作者推荐文章
    public List<Article> getRecommends(List<Article> articles) {
        List<Article> recommends = new ArrayList<Article>();
        // 遍历所有文章
        for (Article article : articles) {
            // 将推荐文章加入集合（推荐文章在数据库中recommend=1的表示推荐）
            if (article.getRecommend().equals("1")) {
                recommends.add(article);
            }
        }
        return recommends;
    }

    // 获得随便看看文章（随机推荐几篇文章供读者阅读）
    public List<Article> getRandomLooks(List<Article> articles) {
        List<Article> randomLooks = new ArrayList<Article>();
        // 随机添加文章(最多10篇)到list中（随便看看）
        Random random = new Random();
        int randomNum = articles.size() < 8 ? articles.size() : 8;
        for (int i = 0; i < randomNum; i++) {
            int index = random.nextInt(articles.size());
            if (!randomLooks.contains(articles.get(index))) {
                randomLooks.add(articles.get(index));
            }
        }
        return randomLooks;
    }
}
