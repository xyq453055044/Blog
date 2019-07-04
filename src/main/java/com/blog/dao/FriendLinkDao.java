package com.blog.dao;

import com.blog.model.FriendLink;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/01
 */
public interface FriendLinkDao {

    List<FriendLink> selectAllFriendLink();

    void insertFriendLink(FriendLink friendLink);
}
