package com.blog.model;

/**
 * @author xyq
 * @date 2019/07/04
 */
public class POSecondLevel {

    private Integer fkParentId;

    private String childName;

    private Integer count;

    public Integer getFkParentId() {
        return fkParentId;
    }

    public void setFkParentId(Integer fkParentId) {
        this.fkParentId = fkParentId;
    }

    public String getChildName() {
        return childName;
    }

    public void setChildName(String childName) {
        this.childName = childName;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
