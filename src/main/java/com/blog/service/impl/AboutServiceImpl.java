package com.blog.service.impl;

import com.blog.dao.AboutBlogDao;
import com.blog.model.AboutBlog;
import com.blog.service.AboutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author xyq
 * @date 2019/07/03
 */
@Service
public class AboutServiceImpl implements AboutService {

    @Autowired
    private AboutBlogDao aboutBlogDao;

    @Override
    public AboutBlog findAboutBlog() {
        return aboutBlogDao.selectAboutBlog();
    }

    @Override
    public AboutBlog findAboutBlogById(Short blogIntroId) {
        return aboutBlogDao.selectAboutBlogById(blogIntroId);
    }
}
