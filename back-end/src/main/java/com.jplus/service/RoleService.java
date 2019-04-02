package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Role;

import java.util.List;

/**
 * Created by rf on 2017/9/17.
 */
public interface RoleService {
    /**
     * 根据id查找用户所在角色类型
     * @param id
     * @return
     */
    JsonMessage findRoleById(int id) throws Exception;

    /**
     * 查找所有角色类型
     * @return
     */
    JsonMessage findAllRole();
}
