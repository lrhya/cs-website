package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.Log;
import org.junit.Test;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/10/27.
 */
public class LogDaoTest extends SpringTestBase{
    @Test
    public void findById() throws Exception {
        logDao.findById(1);
    }

    @Resource
    private LogDao logDao;
    @Test
    public void addLog() throws Exception {
        logDao.addLog(new Log(1,"test","127.0.0.1","2017","login"));
    }

    @Test
    public void deleteBach() throws Exception {
        int []logIds={1};
        logDao.deleteBach(logIds);
    }
/*
    @Test
    public void findLogSelective() throws Exception {
        Log log =new Log();
        log.setUserName("hyb");
        logDao.findLogSelective(log);
    }*/

}