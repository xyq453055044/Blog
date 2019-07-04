package com.blog.dao;

import com.blog.model.POSecondLevel;
import com.blog.model.ResourceChild;
import com.blog.model.ResourceParent;

import java.util.List;

/**
 * @author xyq
 * @date 2019/07/04
 */
public interface ResourceDao {
    
    List<ResourceParent> selectAllResource();

    List<POSecondLevel> selectSecondLevels();

    List<ResourceChild> selectResourceChild(String name);

    ResourceParent selectResourceParentByName(String resFirstLevel);

    void insertResourceParent(ResourceParent resourceParent);

    void insertResourceChild(ResourceChild resourceChild);

    void deleteResourceChildById(Integer childResId);

    List<ResourceChild> resourceChildByChildId();
}
