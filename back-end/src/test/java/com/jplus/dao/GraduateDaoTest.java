
package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.Graduate;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/9/19.
 */
public class GraduateDaoTest extends SpringTestBase{
    @Autowired
    private GraduateDao graduateDao;
    @Test
    public void getGraduateCount() throws Exception {
        graduateDao.getGraduateCount();
    }

    @Test
    public void addGraduate() throws Exception {
        Graduate graduate =new Graduate();
        graduate.setImagename("test");
        graduateDao.addGraduate(graduate);

    }

    @Test
    public void updateGraduate() throws Exception {
    }

    @Test
    public void findGraduateById() throws Exception {
        graduateDao.findGraduateById("ff41cdc07a70b16d52f188597649b0f6");
    }

    @Test
    public void findAllGraduate() throws Exception {
        Map<String,Integer> map = new HashMap<String, Integer>();
        map.put("start",2);
        map.put("size",5);
        graduateDao.findAllGraduate(map);
    }

    @Test
    public void findGraduateSelective() throws Exception {
    }

    @Test
    public void deleteGraduate() throws Exception {
    }

}