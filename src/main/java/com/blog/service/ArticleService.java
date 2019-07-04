package com.blog.service;

import com.blog.model.Article;
import com.blog.model.POCategory;
import com.blog.model.POTime;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/01
 */
public interface ArticleService {


    List<Article> findAllArticles();

    List<Article> findAllArticlesOrderByPageView();

    List<POCategory> findCountCategory();

    List<POTime> findCountYearAndMonth();

    List<Article> findArticlesByCategory(String category);

    Article findArticleByAId(long aId);

    void modifyArticlePageView(long aId);

    void modifyArticleCommentNum(long aId);

    void removeArticleByAId(long aId);

    void modifyArticle(Article article);

    void addArticle(Article article);
}
