package com.jplus.dao;

import base.SpringTestBase;
import org.junit.Test;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/10/24.
 */
public class JslxDaoTest extends SpringTestBase{
    @Resource
    private JslxDao jslxDao;
    @Test
    public void findJslxById() throws Exception {
        jslxDao.findJslxById(1);
    }

    @Test
    public void findAllJslx() throws Exception {
        jslxDao.findAllJslx();
    }

}