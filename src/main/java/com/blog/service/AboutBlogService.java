package com.blog.service;

import com.blog.model.AboutBlog;
import com.blog.model.AboutBlogVersion;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/03
 */
public interface AboutBlogService {
    
    List<AboutBlogVersion> findAboutBlogVersions();

    void modifyAboutBlog(AboutBlog aboutBlog);
}
