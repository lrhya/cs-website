package com.jplus.service.impl;

import base.SpringTestBase;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Resource;
import com.jplus.service.ResourceService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/11/4.
 */
public class ResourceServiceImplTest extends SpringTestBase{
    @Test
    public void updateResource() throws Exception {
        Resource resource =new Resource();
        resource.setId(8);
        resource.setFilePath("test");
        resourceService.updateResource(resource,"");
    }

    @Autowired
    private ResourceService resourceService;

    @Test
    public void deleteResource() throws Exception {
        JsonMessage jsonMessage = resourceService.deleteResource(11,"/cs3/upload");
        System.out.println(jsonMessage.getResult());
    }
    @Test
    public void findAllResource() throws Exception {
        Resource resource =new Resource();
//        resource.setIspost(1);
        resourceService.findAllResource(1,5,resource);
    }

}