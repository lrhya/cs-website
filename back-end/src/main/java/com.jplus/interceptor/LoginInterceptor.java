package com.jplus.interceptor;

import com.jplus.dao.LogDao;
import com.jplus.entity.Log;
import com.jplus.entity.V_user;
import com.jplus.util.DateUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class LoginInterceptor implements HandlerInterceptor {
    @Resource
    private LogDao logDao;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Cache-Control", "no-cache");
        String html = "<script language='javascript'> alert('sorry,权限不够') </script>";

        //根据用户等级拦截请求
        //拦截普通管理员请求
        List<String> commonUserUrls = new ArrayList<String>();
        commonUserUrls.add("user");
        commonUserUrls.add("student");
        commonUserUrls.add("/clazz");
        commonUserUrls.add("log");
        commonUserUrls.add("teacher");
        //拦截教师请求
        List<String> teacherUrls = new ArrayList<String>();
        teacherUrls.add("user");
        teacherUrls.add("log");
        teacherUrls.add("/teacher/deleteTeacher.do");
        //拦截系统管理员请求
        List<String> adminUrls = new ArrayList<String>();
        adminUrls.add("user/deleteUser.do");
        adminUrls.add("log/delete.do");
        adminUrls.add("log/batchDelete.do");
        String url = request.getServletPath();
        if (url.contains("front")) {
            return true;
        }
        //登录请求，放行
        if (url.equalsIgnoreCase("/user/login.do")) {
            return true;
        }
        String contextPath = request.getContextPath();
        HttpSession session = request.getSession();
        //用户等级可以从session中获取
//        int rank = usersDao.findUsersByName(username).getRank();
        V_user users = (V_user) session.getAttribute("userSession");
        if (users == null) {
            response.sendRedirect(contextPath + "/user/toLoginPage.do");
            return false;
        }

        int rank = users.getRank();
        if (rank > 4 || rank < 1) {
            response.sendRedirect(contextPath + "/user/toLoginPage.do");
            return false;
        }
        String username = (String) session.getAttribute("username");
//
        if (StringUtils.isEmpty(username)) {
            response.sendRedirect(contextPath + "/user/toLoginPage.do");
            return false;
        }

        //判断普通管理员请求
        if (rank == 1) {
            for (String commonUserUrl : commonUserUrls) {
                if (url.contains(commonUserUrl)) {
                    response.getWriter().write(html);
                    return false;
                }
            }
        }  //判断教师请求
        else if (rank == 2) {
            for (String teacherUrl : teacherUrls) {
                if (url.contains(teacherUrl)) {
                    response.getWriter().write(html);
                    return false;
                }
            }
        } //判断系统管理员请求
        else if (rank == 3) {
            System.out.println(url);
            for (String adminUrl : adminUrls) {
                if (url.contains(adminUrl)) {
                    response.getWriter().write(html);
                    return false;
                }
            }
        }

        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle**************");
        //拦截日志，将日志操作插入数据库
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String action = (String) request.getAttribute("mess");
        request.removeAttribute("mess");
        String ip = request.getRemoteAddr();
        if (action != null && !action.equals("")) {
            Log log = new Log();
            log.setAction(action);
            log.setIp(ip);
            log.setUser(username);
            log.setActionTime(DateUtil.getFormatDate());
            logDao.addLog(log);
        }
    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.out.println("afterCompletion**************");
    }
}
