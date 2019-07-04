package com.blog.model;

/**
 * @author xyq
 * @date 2019/07/01
 */
public class FriendLink {

    private Integer linkId;

    private String linkContent;

    private String linkUrl;

    public Integer getLinkId() {
        return linkId;
    }

    public void setLinkId(Integer linkId) {
        this.linkId = linkId;
    }

    public String getLinkContent() {
        return linkContent;
    }

    public void setLinkContent(String linkContent) {
        this.linkContent = linkContent;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }
}
