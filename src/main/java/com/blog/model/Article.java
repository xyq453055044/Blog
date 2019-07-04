package com.blog.model;

import java.util.Date;

/**
 * @author xyq
 * @date 2019/07/01
 */
public class Article {

    private Long aId;

    private Long id;

    private String title;

    private String content;

    private String category;

    private String personal;

    private Date createTime;

    private Integer pageView;

    private Integer commentNum;

    private String recommend;

    public Long getaId() {
        return aId;
    }

    public void setaId(Long aId) {
        this.aId = aId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPersonal() {
        return personal;
    }

    public void setPersonal(String personal) {
        this.personal = personal;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getPageView() {
        return pageView;
    }

    public void setPageView(Integer pageView) {
        this.pageView = pageView;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }
}
