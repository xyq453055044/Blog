package com.blog.dao;

import com.blog.model.Article;
import com.blog.model.POCategory;
import com.blog.model.POTime;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/01
 */
public interface ArticleDao {


    List<Article> selectAllArticles();

    List<Article> selectAllArticlesOrderByPageView();

    List<POCategory> selectCountCategory();

    List<POTime> selectCountYearAndMonth();

    List<Article> selectArticlesByCategory(String category);

    Article selectArticleByAId(@Param("aId") long aId);

    void updateArticlePageView(@Param("aId") long aId);

    void updateArticleCommentNum(@Param("aId") long aId);

    void deleteArticleByAId(long aId);

    void updateArticle(Article article);

    void insertArticle(Article article);
}
