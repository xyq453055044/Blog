package com.blog.service.impl;

import com.blog.dao.ResourceDao;
import com.blog.model.POSecondLevel;
import com.blog.model.ResourceChild;
import com.blog.model.ResourceParent;
import com.blog.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xyq
 * @date 2019/07/04
 */
@Service
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceDao resourceDao;

    @Override
    public List<ResourceParent> findAllResource() {
        return resourceDao.selectAllResource();
    }

    @Override
    public List<POSecondLevel> findSecondLevels() {
        return resourceDao.selectSecondLevels();
    }

    @Override
    public List<ResourceChild> findResourceChild(String name) {
        return resourceDao.selectResourceChild(name);
    }

    @Override
    public ResourceParent findResourceParentByName(String resFirstLevel) {
        return resourceDao.selectResourceParentByName(resFirstLevel);
    }

    @Override
    public void addResourceParent(ResourceParent resourceParent) {
        resourceDao.insertResourceParent(resourceParent);
    }

    @Override
    public void addResourceChild(ResourceChild resourceChild) {
        resourceDao.insertResourceChild(resourceChild);
    }

    @Override
    public void removeResourceChildById(Integer childResId) {
        resourceDao.deleteResourceChildById(childResId);
    }
}
