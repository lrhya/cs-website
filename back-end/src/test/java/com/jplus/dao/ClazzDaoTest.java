package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.Clazz;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/9/28.
 */
public class ClazzDaoTest extends SpringTestBase{

    @Autowired
    private ClazzDao clazzDao;

    @Test
    public void findClazzByName() throws Exception {
        clazzDao.findClazzByName("1205");
    }
    @Test
    public void getClazzCount() throws Exception {
        int count = clazzDao.getClazzCount(new Clazz());
        System.out.println(count);
    }


    @Test
    public void addClazz() throws Exception {
        Clazz clazz=new Clazz();
        clazz.setName("test");
        clazz.setBoy(23);
        clazz.setGirl(22);
        clazzDao.addClazz(clazz);
    }

    @Test
    public void updateClazz() throws Exception {
        Clazz clazz=new Clazz();
        clazz.setName("test");
        clazz.setBoy(53);
        clazz.setId(7);
        clazzDao.updateClazz(clazz);
    }

    @Test
    public void findClazzById() throws Exception {
        clazzDao.findClazzById(1);
    }

    @Test
    public void findAllClazz() throws Exception {
        Map<String,Object> map= new HashMap<String,Object>();
        map.put("start",0);
        map.put("size",4);
        clazzDao.findAllClazz(map);
    }

    @Test
    public void findClazzSelective() throws Exception {
    }

    @Test
    public void deleteClazz() throws Exception {
        clazzDao.deleteClazz(7);
    }

}