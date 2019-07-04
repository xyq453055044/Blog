package com.blog.model;

/**
 * @author xyq
 * @date 2019/07/03
 */
public class AboutBlogVersion {

    private Short blogVerId;

    private String blogVerTitle;

    private String blogVerContent;

    private String blogVerTime;

    public Short getBlogVerId() {
        return blogVerId;
    }

    public void setBlogVerId(Short blogVerId) {
        this.blogVerId = blogVerId;
    }

    public String getBlogVerTitle() {
        return blogVerTitle;
    }

    public void setBlogVerTitle(String blogVerTitle) {
        this.blogVerTitle = blogVerTitle;
    }

    public String getBlogVerContent() {
        return blogVerContent;
    }

    public void setBlogVerContent(String blogVerContent) {
        this.blogVerContent = blogVerContent;
    }

    public String getBlogVerTime() {
        return blogVerTime;
    }

    public void setBlogVerTime(String blogVerTime) {
        this.blogVerTime = blogVerTime;
    }
}
