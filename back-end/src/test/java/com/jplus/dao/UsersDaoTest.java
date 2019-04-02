
package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.Users;
import com.jplus.entity.V_user;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/16.
 */
public class UsersDaoTest extends SpringTestBase {
    @Resource
    private UsersDao usersDao;

    @Test
    public void findAllUsers() throws Exception {
        Map<String,Integer> param=new HashMap<String, Integer>();
        param.put("start",5);
        param.put("size",6);
       List<V_user> userList = usersDao.findAllUsers(param);
       System.out.println(userList.get(0).toString());
    }

    @Test
    public void findUsersByName() throws Exception {
        Users users = usersDao.findUsersByName("lisi");
        System.out.println(users);
    }
    @Test
    public void findUsersByNameAndPass() throws Exception {
        V_user user=new V_user();
        user.setUsername("admin");
        user.setPassword("1c3760ba1b6bb79d0458a0c2619ce971");
        V_user users1=usersDao.findUsersByNameAndPass(user);
        System.out.println(users1.getId());
    }

    @Test
    public void addUsers() throws Exception {
        Users u=new Users(1,"wanger","admin",4);
        usersDao.addUsers(u);
    }

    @Test
    public void updateUsers() throws Exception {
        Users u=new Users(3,"admin","admin",4);
        usersDao.updateUsers(u);
    }

    @Test
    public void findUsersById() throws Exception {
        Users users=usersDao.findUsersById(1);
        System.out.println(users.getId());
    }

    @Test
    public void findUsersSelective() throws Exception {
    }

    @Test
    public void deleteUsers() throws Exception {
        usersDao.deleteUsers(42);
    }

}