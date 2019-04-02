package com.jplus.dao;

import base.SpringTestBase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/9/21.
 */
public class RoleDaoTest extends SpringTestBase{
    @Autowired
    private RoleDao roleDao;
    @Test
    public void findRoleById() throws Exception {
    }

    @Test
    public void findAllRole() throws Exception {
        roleDao.findAllRole();
    }

}