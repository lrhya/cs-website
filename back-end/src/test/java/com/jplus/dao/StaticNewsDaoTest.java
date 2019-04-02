package com.jplus.dao;

import base.SpringTestBase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/10/8.
 */
public class StaticNewsDaoTest extends SpringTestBase{
    @Autowired StaticNewsDao staticNewsDao;
    @Test
    public void addStaticNews() throws Exception {
    }

    @Test
    public void updateStaticNews() throws Exception {

    }


    @Test
    public void findStaticNewsById() throws Exception {
        staticNewsDao.findStaticNewsById(1);
    }

    @Test
    public void findAllStaticNews() throws Exception {
        staticNewsDao.findAllStaticNews();
    }

    @Test
    public void deleteStaticNews() throws Exception {
    }

}