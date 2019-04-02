package com.jplus.service;

import base.SpringTestBase;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Resource;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/11/2.
 */
public class ResourceServiceTest extends SpringTestBase{
    @Autowired
    private ResourceService resourceService;
    @Test
    public void findResourceById() throws Exception {
    }

    @Test
    public void findAllResource() throws Exception {
        Resource resource=new Resource();
//        resource.setFilename("test");
        resource.setLb(1);
        JsonMessage jsonMessage = resourceService.findAllResource(1,5,resource);
        System.out.println(jsonMessage.getResult());
    }

}