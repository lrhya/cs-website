package com.jplus.service.impl;

import com.jplus.dao.RoleDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Role;
import com.jplus.entity.Users;
import com.jplus.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rf on 2017/9/17.
 */
@Service("RoleService")
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleDao RoleDao;

    /**
     *
     * @param id
     * @return
     * @throws Exception
     */
    public JsonMessage findRoleById(int id){
        Role role=null;
        try {
         role= RoleDao.findRoleById(id);
        } catch (Exception e) {
            return new JsonMessage(false,"查找角色失败！");
        }
        if(role!=null){
            return new JsonMessage(true,role);
        }else {
            return new JsonMessage(false,"查找角色失败！");
        }
    }

    /**
     *
     * @return
     * @throws Exception
     */
    public JsonMessage findAllRole(){
        List<Role> roleList=null;
        try {
           roleList = RoleDao.findAllRole();
        } catch (Exception e) {
            return new JsonMessage(false,"查找角色失败！");
        }
        if(roleList!=null){
            return new JsonMessage(true,roleList);
        }else {
            return new JsonMessage(false,"查找角色失败！");
        }
    }
}
