package com.blog.service.impl;

import com.blog.dao.FriendLinkDao;
import com.blog.model.FriendLink;
import com.blog.service.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/01
 */
@Service
public class FriendLinkServiceImpl implements FriendLinkService {

    @Autowired
    private FriendLinkDao friendLinkDao;

    @Override
    public List<FriendLink> findAllFriendLink() {
        return friendLinkDao.selectAllFriendLink();
    }

    @Override
    public void addFriendLink(FriendLink friendLink) {
        friendLinkDao.insertFriendLink(friendLink);
    }
}
