package com.blog.service;

import com.blog.model.POSecondLevel;
import com.blog.model.ResourceChild;
import com.blog.model.ResourceParent;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/04
 */
public interface ResourceService {
    
    List<ResourceParent> findAllResource();

    List<POSecondLevel> findSecondLevels();

    List<ResourceChild> findResourceChild(String name);

    ResourceParent findResourceParentByName(String resFirstLevel);

    void addResourceParent(ResourceParent resourceParent);

    void addResourceChild(ResourceChild resourceChild);

    void removeResourceChildById(Integer childResId);
}
