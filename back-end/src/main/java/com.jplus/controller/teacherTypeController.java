package com.jplus.controller;

import com.jplus.dao.JslxDao;
import com.jplus.entity.Jslx;
import com.jplus.entity.JsonMessage;
import com.jplus.service.JslxService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/teacher")
public class teacherTypeController {
    @Resource
    private JslxService jslxService;
    @Resource
    private JslxDao jslxDao;

    /**
     * 删除教师类型
     */
    @RequestMapping("/delJslx")
    public String delJslx(Model model, int id, HttpServletRequest request) {
        Jslx jslx = jslxDao.findJslxById(id);
        JsonMessage jsonMessage = jslxService.delJslx(id);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "删除教师类型：" + jslx.getLxmc());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/teacher/findJslxSelective.do";
    }

    /**
     * 编辑教师类型
     */
    @RequestMapping("/editJslx")
    public String editJslx(Model model, Jslx jslx, HttpServletRequest request) {
        JsonMessage jsonMessage = jslxService.editJslx(jslx);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "修改教师类型：" + jslx.getLxmc());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/teacher/findJslxSelective.do";
    }

    /**
     * 添加教师类型
     */
    @RequestMapping("/addJslx")
    public String addJslx(Model model, Jslx jslx, HttpServletRequest request) {
        JsonMessage jsonMessage = jslxService.addJslx(jslx);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "添加教师类型：" + jslx.getLxmc());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/teacher/findJslxSelective.do";
    }

    @RequestMapping("/findJslxSelective")
    public String findJslxSelective(Model model, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
            int pageSize, Jslx jslx) {
        JsonMessage jsonMessage = jslxService.findJslxSelective(pageNum, pageSize, jslx);
        model.addAttribute("jslx", jslx);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/teacher/teacherType";
    }
}
