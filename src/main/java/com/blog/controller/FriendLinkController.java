package com.blog.controller;

import com.blog.model.FriendLink;
import com.blog.service.FriendLinkService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author xyq
 * @date 2019/07/03
 */
@Controller
public class FriendLinkController {

    @Autowired
    private FriendLinkService friendLinkService;

    @RequestMapping("/friendLink")
    @ResponseBody
    public Map<String, Object> friendLink(String linkContent, String linkUrl){
        FriendLink friendLink = new FriendLink();
        if (StringUtils.isNotBlank(linkContent) && StringUtils.isNotBlank(linkUrl)){
            friendLink.setLinkContent(linkContent);
            friendLink.setLinkUrl(linkUrl);
            friendLinkService.addFriendLink(friendLink);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("message", "success");
        return map;
    }
}
