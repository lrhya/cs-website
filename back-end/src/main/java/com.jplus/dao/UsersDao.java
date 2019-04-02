
package com.jplus.dao;

import com.jplus.entity.Users;
import com.jplus.entity.V_user;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository("userDao")
public interface UsersDao {

    int getUsersCount();

    /**
     * 通过用户名和密码查找用户，用于登录
     * @param user 传入用户username，password
     * @return 返回单个用户
     */
    V_user findUsersByNameAndPass(V_user user) throws Exception;

    /**
     * 用户姓名做唯一校验
     * @param name
     * @return
     */
    Users findUsersByName(String name) throws Exception;

    /**
     * 添加用户
     * @param users 传入用户username，password，rank
     */
    int addUsers(Users users)throws Exception;

    /**
     * 修改用户，管理员权限
     * @param users 传入用户id,username，password，rank
     */
    int updateUsers(Users users) throws Exception;

    /**
     * 通过用查找用户
     * @param id 户id
     * @return 返回单个用户
     */
    Users findUsersById(int id) throws Exception;

    /**
     *查找用户，并且分页
     * @param param 传入参数（pageSize，pageNum）
     * @return
     */
    List<V_user> findAllUsers(Map<String, Integer> param) throws Exception;

    /**
     * 根据条件查找用户
     * @param user (查找条件：用户名字、角色名称)
     * @return 返回用户集合
     */
    List<Users> findUsersSelective(Users user) throws Exception;

    /**
     * 删除用户
     * @param id（根据主键id）
     */
    int deleteUsers(int id) throws Exception;

    /**
     * 查询符合条件的用户
     * @return
     * @throws Exception
     */
    List<V_user> findUsersSelective(Map<String,Object> map) throws Exception;

    /**
     * 查询符合条件的用户数量
     * @param v_user
     * @return
     * @throws Exception
     */
    int findUsersSelectiveNum(V_user v_user) throws  Exception;

}
