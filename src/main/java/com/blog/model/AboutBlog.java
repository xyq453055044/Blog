package com.blog.model;

import java.util.Date;

/**
 * @author xyq
 * @date 2019/07/03
 */
public class AboutBlog {

    private short abBlogId;

    private String abBlogIntro;

    private Date abBlogModifyTime;

    public short getAbBlogId() {
        return abBlogId;
    }

    public void setAbBlogId(short abBlogId) {
        this.abBlogId = abBlogId;
    }

    public String getAbBlogIntro() {
        return abBlogIntro;
    }

    public void setAbBlogIntro(String abBlogIntro) {
        this.abBlogIntro = abBlogIntro;
    }

    public Date getAbBlogModifyTime() {
        return abBlogModifyTime;
    }

    public void setAbBlogModifyTime(Date abBlogModifyTime) {
        this.abBlogModifyTime = abBlogModifyTime;
    }
}
