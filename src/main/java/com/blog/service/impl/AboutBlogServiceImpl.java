package com.blog.service.impl;

import com.blog.dao.AboutBlogDao;
import com.blog.model.AboutBlog;
import com.blog.model.AboutBlogVersion;
import com.blog.service.AboutBlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/03
 */
@Service
public class AboutBlogServiceImpl implements AboutBlogService {

    @Autowired
    private AboutBlogDao aboutBlogDao;

    @Override
    public List<AboutBlogVersion> findAboutBlogVersions() {
        return aboutBlogDao.selectAboutBlogVersions();
    }

    @Override
    public void modifyAboutBlog(AboutBlog aboutBlog) {
        aboutBlogDao.updateAboutBlog(aboutBlog);
    }
}
