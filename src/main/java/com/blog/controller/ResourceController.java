package com.blog.controller;

import com.blog.model.POSecondLevel;
import com.blog.model.ResourceChild;
import com.blog.model.ResourceParent;
import com.blog.model.User;
import com.blog.service.ResourceService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xyq
 * @date 2019/07/04
 */
@Controller
public class ResourceController extends BaseController {

    @Autowired
    private ResourceService resourceService;

    @RequestMapping("/resource")
    public String resource(Model model,
                           @RequestParam(value = "name", required = false) String name){
        User user = (User) getSession().getAttribute("user");
        model.addAttribute("user", user);

        List<ResourceParent> resourceParents = resourceService.findAllResource();
        if(resourceParents.size() <= 0){
            model.addAttribute("message", "notAnyMsg");
            return "resource";
        }

        model.addAttribute("resourceParents", resourceParents);

        List<POSecondLevel> secondLevels = resourceService.findSecondLevels();
        model.addAttribute("secondLevels", secondLevels);

        if (StringUtils.isNotBlank(name)){
            List<ResourceChild> resourceChildren = resourceService.findResourceChild(name);
            model.addAttribute("resourceChildren", resourceChildren);
        }else {
            String secondLevel = resourceParents.get(0).getResourceChildren().get(0).getChildName();
            List<ResourceChild> resourceChildren = resourceService.findResourceChild(secondLevel);
            model.addAttribute("resourceChildren", resourceChildren);
        }

        return "resource";
    }

    @RequestMapping("/addResource")
    @ResponseBody
    public Map<String, Object> addResource(Model model,
                                           String resFirstLevel, String resSecondLevel, String resUrl, String resPass, String resIntro){
        Map<String, Object> map = new HashMap<>();
        ResourceParent resourceParent = new ResourceParent();
        ResourceChild resourceChild  = new ResourceChild();

        ResourceParent resParent = resourceService.findResourceParentByName(resFirstLevel);
        if (resParent == null){
            resourceParent.setParentName(resFirstLevel);
            resourceService.addResourceParent(resourceParent);
            resourceChild.setFkParentId(resourceParent.getParentId());
        }else{
            resourceChild.setFkParentId(resParent.getParentId());
        }

        resourceChild.setChildName(resFirstLevel);
        resourceChild.setUrl(resUrl);
        resourceChild.setPass(resPass);
        resourceChild.setIntroduction(resIntro);
        resourceChild.setCreateTime(new Date());

        resourceService.addResourceChild(resourceChild);
        model.addAttribute("message", "success");
        return map;
    }


    @RequestMapping("/removeRes")
    @ResponseBody
    public Map<String, Object> removeRes(Model model, Integer childResId){
        Map<String, Object> map = new HashMap<>();
        resourceService.removeResourceChildById(childResId);
        model.addAttribute("message", "success");
        return map;
    }
}
