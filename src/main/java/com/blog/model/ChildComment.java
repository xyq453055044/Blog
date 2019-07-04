package com.blog.model;

import java.util.Date;

/**
 * @author xyq
 * @date 2019/07/02
 */
public class ChildComment {

    private Long childId;

    private Long cId;

    private Long byId;

    private String content;

    private Date createTime;

    public Long getChildId() {
        return childId;
    }

    public void setChildId(Long childId) {
        this.childId = childId;
    }

    public Long getcId() {
        return cId;
    }

    public void setcId(Long cId) {
        this.cId = cId;
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

}
