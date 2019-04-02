
package com.jplus.service.impl;

import com.jplus.dao.UsersDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Page;
import com.jplus.entity.Users;
import com.jplus.entity.V_user;
import com.jplus.service.UsersService;
import com.jplus.util.MD5Util;
import com.jplus.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/15.
 */
@Service("usersService")
public class UsersServiceImpl implements UsersService {
    @Resource
    private UsersDao usersDao;

    public JsonMessage login(V_user user, String inputCode, String captchaCode) {
        if (user == null || StringUtil.isBlank(user.getUsername())) {
            return new JsonMessage(false, "用户名不能为空！");
        }
        String initPassword;
        if (StringUtil.isBlank(user.getPassword())) {
            return new JsonMessage(false, "密码不能为空！");
        }
        if (StringUtil.isBlank(inputCode)) {
            return new JsonMessage(false, "验证码不能为空！");
        }
        if (!inputCode.trim().equalsIgnoreCase(captchaCode)) {
            return new JsonMessage(false, "输入的验证码错误！");
        }
        //旧系统加密方式
        String password = MD5Util.encode("@jplus" + user.getPassword() + "!@#$%^&*()_+");
        user.setPassword(password);
        V_user user1 = null;
        try {
            user1 = usersDao.findUsersByNameAndPass(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(user1);
        if (user1 != null) {
            return new JsonMessage(true, user1);
        } else {
            return new JsonMessage(false, "用户名错误或者密码错误！");
        }
    }

    public JsonMessage addUsers(Users users, String rePassword) {
        if (users == null || StringUtil.isBlank(users.getUsername())) {
            return new JsonMessage(false, "用户名不能为空！");
        }
        if (StringUtil.isBlank(users.getPassword())) {
            return new JsonMessage(false, "密码不能为空！");
        }
        if (StringUtil.isBlank(rePassword)) {
            return new JsonMessage(false, "确认密码不能为空！");
        }
        if (!users.getPassword().equals(rePassword.trim())) {
            return new JsonMessage(false, "两次输入密码不相等！");
        }
        if (users.getRank() == null || users.getRank() < 1 || users.getRank() > 4) {
            return new JsonMessage(false, "用户权限等级不能为空！");
        }
        Users users1 = null;
        try {
            users1 = usersDao.findUsersByName(users.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (users1 != null) {
            return new JsonMessage(false, "该用户名已经有人使用！");
        }
        //旧系统加密方式
        String password = MD5Util.encode("@jplus" + users.getPassword() + "!@#$%^&*()_+");
        users.setPassword(password);
        try {
            usersDao.addUsers(users);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new JsonMessage(true, "添加用户成功！");
    }

    public JsonMessage updateUsers(Users users, String rePassword) {
        if (users == null || StringUtil.isBlank(users.getUsername())) {
            return new JsonMessage(false, "用户名不能为空！");
        }
        if (!users.getPassword().trim().equals(rePassword.trim())) {
            return new JsonMessage(false, "两次输入密码不一致！");
        }
        Users users1 = null;
        try {
            users1 = usersDao.findUsersByName(users.getUsername());
        } catch (Exception e) {
            return new JsonMessage(false, "更新用户出现错误！" + e.getMessage());
        }
        if (users1 != null && !users1.getUsername().equals(users.getUsername())) {
            return new JsonMessage(false, "该用户名已经有人使用！");
        }
        if (!StringUtil.isBlank(users.getPassword())) {
            String password = MD5Util.encode("@jplus" + users.getPassword() + "!@#$%^&*()_+");
            users.setPassword(password);
        }
        //旧系统加密方式
        int result = 0;
        try {
            result = usersDao.updateUsers(users);
        } catch (Exception e) {
            return new JsonMessage(false, "更新用户出现错误！" + e.getMessage());
        }
        if (result != 0) {
            return new JsonMessage(true, "更新用户成功！");
        } else {
            return new JsonMessage(false, "更新用户失败！");
        }

    }


    public JsonMessage findUsersById(int id) {
        if (id == 0) {
            return new JsonMessage(false, "请选择要更新的用户！");
        }
        Users users = null;
        try {
            users = usersDao.findUsersById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new JsonMessage(true, users);
    }

    public JsonMessage findAllUsers(int pageNum, int pageSize) {
        int userCount = usersDao.getUsersCount();
        Page<V_user> usersPage = new Page<V_user>(pageSize, pageNum, userCount, null);

        pageNum = usersPage.getCurrentPage();
        int start = (pageNum - 1) * pageSize;
        Map<String, Integer> param = new HashMap<String, Integer>();
        param.put("start", start);
        param.put("size", pageSize);
        List<V_user> usesList = null;
        try {
            usesList = usersDao.findAllUsers(param);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (usesList == null || usesList.isEmpty()) {
            return new JsonMessage(false, "未查到任何用户！");
        }
        usersPage.setDataList(usesList);
        return new JsonMessage(true, usersPage);
    }

    public JsonMessage findUsersSelective(Users user) {
        try {
            List<Users> users = usersDao.findUsersSelective(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public JsonMessage deleteUsers(int id) {
        if (id == 0) {
            return new JsonMessage(false, "请选择要删除的用户！");
        }
        Users users = null;
        try {
            users = usersDao.findUsersById(id);
        } catch (Exception e) {
            return new JsonMessage(true, "删除用户错误！"+e.getMessage());
        }
        if (users==null) {
            return new JsonMessage(true, "删除用户失败，用户不存在！");
        }
        try {
            usersDao.deleteUsers(id);
        } catch (Exception e) {
            return new JsonMessage(true, "删除用户错误！"+e.getMessage());
        }
        return new JsonMessage(true, users);
    }

    public JsonMessage findUsersSelective(int pageNum, int pageSize, V_user v_user) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            int count = usersDao.findUsersSelectiveNum(v_user);
            Page<V_user> v_userPage = new Page<V_user>(pageSize, pageNum, count, null);
            int start = pageSize * (v_userPage.getCurrentPage() - 1);
            map.put("start", start);
            map.put("size", pageSize);
            map.put("v_user", v_user);
            List<V_user> v_users = usersDao.findUsersSelective(map);
            v_userPage.setDataList(v_users);
            return new JsonMessage(true, v_userPage);
        } catch (Exception e) {
            return new JsonMessage(false, "查找失败");
        }
    }
}
