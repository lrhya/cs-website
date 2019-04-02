package com.jplus.service.impl;

import base.SpringTestBase;
import com.jplus.entity.V_user;
import com.jplus.service.UsersService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/11/19.
 */
public class UsersServiceImplTest extends SpringTestBase{
    @Autowired
    private UsersService usersService;
    @Test
    public void findUsersSelective() throws Exception {
        usersService.findUsersSelective(0,6,new V_user());
    }

}