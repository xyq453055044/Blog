package com.blog.model;

import java.util.Date;

/**
 * @author xyq
 * @date 2019/07/02
 */
public class Comment {

    private Long cId;

    private Long aId;

    private Long byId;

    private String content;

    private Date createTime;

    public Long getcId() {
        return cId;
    }

    public void setcId(Long cId) {
        this.cId = cId;
    }

    public Long getaId() {
        return aId;
    }

    public void setaId(Long aId) {
        this.aId = aId;
    }

    public Long getById() {
        return byId;
    }

    public void setById(Long byId) {
        this.byId = byId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cId=" + cId +
                ", aId=" + aId +
                ", byId=" + byId +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
