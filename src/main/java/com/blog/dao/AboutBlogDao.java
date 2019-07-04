package com.blog.dao;

import com.blog.model.AboutBlog;
import com.blog.model.AboutBlogVersion;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/03
 */
public interface AboutBlogDao {
    
    AboutBlog selectAboutBlog();

    List<AboutBlogVersion> selectAboutBlogVersions();

    AboutBlog selectAboutBlogById(Short blogIntroId);

    void updateAboutBlog(AboutBlog aboutBlog);
}
