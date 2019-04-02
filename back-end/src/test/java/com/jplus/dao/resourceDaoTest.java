package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.Resource;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/9/19.
 */
public class resourceDaoTest extends SpringTestBase {
    @Autowired
    private ResourceDao resourceDao;

    @Test
    public void getResourceCount() throws Exception {
        Resource resource=new Resource();
//        resource.setFilename("test");
        resource.setLb(1);
        int n = resourceDao.getResourceCount(resource);
    }

    @Test
    public void addResource() throws Exception {
        Resource resource = new Resource();
        resource.setFilename("test");
        resourceDao.addResource(resource);
    }

    @Test
    public void updateResource() throws Exception {
        Resource resource = new Resource();
        resource.setFilename("test2");
        resource.setId(9);
        resourceDao.updateResource(resource);
    }

    @Test
    public void findResourceById() throws Exception {
        Resource resource = resourceDao.findResourceById(1);
        System.out.println(resource.getFilename());
    }

    @Test
    public void findAllResource() throws Exception {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("start", 1);
        param.put("size", 6);
        resourceDao.findAllResource(param);
    }

    @Test
    public void findResourceSelective() throws Exception {
    }

    @Test
    public void deleteResource() throws Exception {
        resourceDao.deleteResource(9);
    }
}

