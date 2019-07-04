package com.blog.service;

import com.blog.model.AboutBlog;

/**
 * @author xyq
 * @date 2019/07/03
 */
public interface AboutService {

    AboutBlog findAboutBlog();

    AboutBlog findAboutBlogById(Short blogIntroId);
}
