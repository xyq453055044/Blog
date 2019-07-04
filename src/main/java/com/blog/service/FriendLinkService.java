package com.blog.service;

import com.blog.model.FriendLink;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/01
 */
public interface FriendLinkService {

    List<FriendLink> findAllFriendLink();

    void addFriendLink(FriendLink friendLink);
}
