package com.blog.model;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/04
 */
public class ResourceParent {


    private Integer parentId;

    private String parentName;

    private List<ResourceChild> resourceChildren;

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public List<ResourceChild> getResourceChildren() {
        return resourceChildren;
    }

    public void setResourceChildren(List<ResourceChild> resourceChildren) {
        this.resourceChildren = resourceChildren;
    }
}
