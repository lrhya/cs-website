
package com.jplus.controller;

import com.jplus.dao.UsersDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Users;
import com.jplus.entity.V_user;
import com.jplus.service.RoleService;
import com.jplus.service.UsersService;
import com.jplus.util.CaptchaUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by rf on 2017/9/15.
 */
@Controller
@RequestMapping("/user")
public class UsersController {
    @Resource
    private UsersService usersService;
    @Resource
    private RoleService roleService;
    @Resource
    private UsersDao usersDao;

    /**
     * 转发到后台登录页面
     */
    @RequestMapping("/toLoginPage.do")
    public String toLoginPage() {
        return "front/view/login";
    }

    /**
     * 后台登录
     *
     * @param user 用户
     * @param inputCode 验证码
     */

    @RequestMapping("login.do")
    public String login(V_user user, String inputCode, HttpServletRequest request, Model model) {
        String captchaCode = (String) request.getSession().getAttribute(CaptchaUtil.RANDOMCODEKEY);
        JsonMessage jsonMessage = usersService.login(user, inputCode, captchaCode);
        model.addAttribute("jsonMessage", jsonMessage);
        if (jsonMessage.isSuccess()) {
            V_user users = (V_user) jsonMessage.getResult();
            request.getSession().setAttribute("userSession", users);
            request.getSession().setAttribute("username", users.getUsername());
            request.setAttribute("mess","登陆系统");
            return "redirect:/toAdmin.do";
        } else {
            model.addAttribute("user", user);
            return "front/view/login";
        }

    }

//    @RequestMapping("/ToAddUser.do")
//    public String ToAddUser(Model model) {
//            JsonMessage rolejsonMessage = roleService.findAllRole();
//            System.out.println(rolejsonMessage.getResult());
//            model.addAttribute("roleList", rolejsonMessage.getResult());
//            return "redirect:/user/addUsers.do";
//    }

    /**
     * 添加用户
     *
     * @param users 传入用户姓名、密码、权限等级
     */
    @RequestMapping("/addUsers.do")
    public String addUsers(Users users, String rePassword,HttpServletRequest request, Model model) {
        JsonMessage jsonMessage = usersService.addUsers(users, rePassword);
        model.addAttribute("jsonMessage", jsonMessage);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess","添加用户："+users.getUsername());
            return "forward:/user/findUsersPage.do";
        } else {
            model.addAttribute("user", users);
            model.addAttribute("rePassword", rePassword);
            return "forward:/user/toAddUi.do";
        }

    }

    /**
     * 后台删除用户
     *
     * @param id 用户id
     */
    @RequestMapping("deleteUser.do")
    public String deleteUser(int id,HttpServletRequest request, Model model) {
        JsonMessage jsonMessage = usersService.deleteUsers(id);
        Users users = (Users) jsonMessage.getResult();
        if(jsonMessage.isSuccess()){
            request.setAttribute("mess","删除用户："+users.getUsername());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/user/findUsersPage.do";
    }

    /**
     * 后台跳转到编辑用户页面
     *
     * @param Id 用户id
     */
    @RequestMapping("/toEditUi.do")
    public String toEditUi(@RequestParam(defaultValue = "0") int Id, Model model) {
        JsonMessage roleListJson = roleService.findAllRole();
        model.addAttribute("roleListJson", roleListJson);
        JsonMessage jsonMessage = usersService.findUsersById(Id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/user/editUser";
    }

    /**
     * 后台跳转到添加用户界面
     *
     */
    @RequestMapping("/toAddUi.do")
    public String toAddUi(Model model) {
        JsonMessage roleListJson = roleService.findAllRole();
        model.addAttribute("roleListJson", roleListJson);
        return "admin/view/user/addUser";
    }

    /**
     * @param users 用户
     */
    @RequestMapping("/updateUsers.do")
    public String updateUsers(Users users, HttpServletRequest request,Model model,String rePassword) {
        JsonMessage jsonMessage = usersService.updateUsers(users,rePassword);
        model.addAttribute("jsonMessage2", jsonMessage);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess","更改用户："+users.getUsername());
            return "redirect:/user/findUsersPage.do";
        } else {
            model.addAttribute("user", users);
            model.addAttribute("rePassword", rePassword);
//            JsonMessage roleListJson = roleService.findAllRole();
//            model.addAttribute("roleListJson",roleListJson);
            return "forward:/user/toEditUi.do";
        }

    }

    /**
     * 更改用户基本信息
     * @param users
     * @param request
     * @param model
     * @param rePassword
     * @param response
     * @throws IOException
     */
    @RequestMapping("/updateUsers1.do")
    public void updateUsers1(Users users, HttpServletRequest request, Model model, String rePassword,
                             HttpServletResponse response) throws IOException {
        JsonMessage jsonMessage = usersService.updateUsers(users,rePassword);
        model.addAttribute("jsonMessage2", jsonMessage);
        PrintWriter out = null;
        response.setCharacterEncoding("utf-8");  //防止ajax接受到的中文信息乱码
        out = response.getWriter();

        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess",users.getUsername()+"用户修改自己基本信息：");
            request.getSession().invalidate();
            out.print("信息修改成功！");
            out.flush();
            out.close();
        } else {
            model.addAttribute("user", users);
            model.addAttribute("rePassword", rePassword);
            out.print(jsonMessage.getResult());
            out.flush();
            out.close();
        }

    }


    /**
     * 查找用户
     *
     * @param pageNum 第几页
     * @param pageSize 每页显示数目
     */
    @RequestMapping("/findUsersPage.do")
    public String findUsersPage(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
            int pageSize, Model model, V_user v_user) {
        JsonMessage jsonMessage = usersService.findUsersSelective(pageNum, pageSize, v_user);
        model.addAttribute("jsonMessage", jsonMessage);
        model.addAttribute("v_user", v_user);
        return "admin/view/user/userList";
    }

    /**
     * 退出登录
     */
    @RequestMapping("/logout.do")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/user/toLoginPage.do";
    }
}

