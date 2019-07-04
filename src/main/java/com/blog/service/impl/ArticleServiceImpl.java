package com.blog.service.impl;

import com.blog.dao.ArticleDao;
import com.blog.model.Article;
import com.blog.model.POCategory;
import com.blog.model.POTime;
import com.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/01
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;
    @Override
    public List<Article> findAllArticles() {
        return articleDao.selectAllArticles();
    }

    @Override
    public List<Article> findAllArticlesOrderByPageView() {
        return articleDao.selectAllArticlesOrderByPageView();
    }

    @Override
    public List<POCategory> findCountCategory() {
        return articleDao.selectCountCategory();
    }

    @Override
    public List<POTime> findCountYearAndMonth() {
        return articleDao.selectCountYearAndMonth();
    }

    @Override
    public List<Article> findArticlesByCategory(String category) {
        return articleDao.selectArticlesByCategory(category);
    }

    @Override
    public Article findArticleByAId(long aId) {
        return articleDao.selectArticleByAId(aId);
    }

    @Override
    public void modifyArticlePageView(long aId) {
        articleDao.updateArticlePageView(aId);
    }

    @Override
    public void modifyArticleCommentNum(long aId) {
        articleDao.updateArticleCommentNum(aId);
    }

    @Override
    public void removeArticleByAId(long aId) {
        articleDao.deleteArticleByAId(aId);
    }

    @Override
    public void modifyArticle(Article article) {
        articleDao.updateArticle(article);
    }

    @Override
    public void addArticle(Article article) {
        articleDao.insertArticle(article);
    }
}
