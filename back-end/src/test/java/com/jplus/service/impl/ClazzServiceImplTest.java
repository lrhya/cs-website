package com.jplus.service.impl;

import base.SpringTestBase;
import com.jplus.entity.Clazz;
import com.jplus.service.ClazzService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/11/3.
 */
public class ClazzServiceImplTest extends SpringTestBase{
    @Autowired
    private ClazzService clazzService;

    @Test
    public void findAllClazz1() throws Exception {
        clazzService.findAllClazz(0,2,new Clazz());
    }

    @Test
    public void editClazz() throws Exception {
        clazzService.editClazz(1);
    }
    @Test
    public void findAllClazz() throws Exception {
        clazzService.findAllClazz();
    }

}