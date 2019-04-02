package com.jplus.service.impl;

import base.SpringTestBase;
import com.jplus.entity.Graduate;
import com.jplus.service.GraduateService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/11/16.
 */
public class GraduateServiceImplTest extends SpringTestBase{
    @Autowired
    private GraduateService graduateService;
    @Test
    public void changIndexPic() throws Exception {
        Graduate graduate = new Graduate();
        graduate.setId("cdb-f74d222a0453");
        graduate.setImagepath("test");
        graduateService.changIndexPic(graduate,"");
    }

}