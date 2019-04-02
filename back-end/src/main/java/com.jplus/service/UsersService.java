
package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Users;
import com.jplus.entity.V_user;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/15.
 */
public interface UsersService {
    /**
     * 通过用户名和密码查找用户，用于登录
     * @param user
     * @param captchaCode
     * @return
     */
    JsonMessage login(V_user user,String inputCode, String captchaCode);

    /**
     * 添加用户
     * @param users
     * @return
     */
    JsonMessage addUsers(Users users,String rePassword);

    //修改用户，管理员权限
    JsonMessage updateUsers(Users users,String rePassword);

    /**
     * 通过用户id编辑用户
     * @param id
     * @return
     */
    JsonMessage findUsersById(int id);

    /**
     * 查找所有用户，分页显示，传入参数（pageSize，pageNum）
     * @param pageNum
     * @param  pageSize
     * @return
     */
    JsonMessage findAllUsers(int pageNum,int pageSize);

    /**
     *  根据条件查找用户(查找条件：用户名字、角色名称)
     * @param user
     * @return
     */
    JsonMessage findUsersSelective(Users user);

    /**
     *  删除用户（根据主键id）
     * @param id
     * @return
     */
    JsonMessage deleteUsers(int id);

    JsonMessage findUsersSelective(int pageNum, int pageSize, V_user v_user);
}
