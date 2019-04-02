package com.jplus.controller;

import com.jplus.dao.TeacherDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.TeacherType;
import com.jplus.service.TeacherTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/teacher")
public class TeacherZCController {
    @Resource
    private TeacherTypeService teacherTypeService;
    @Resource
    private TeacherDao teacherDao;
    /**
     * 查找教师职称
     */
    @RequestMapping("/findTeacherZC")
    public String findTeacherZC(Model model, TeacherType teacherType, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
            int pageSize) {
        JsonMessage jsonMessage = teacherTypeService.findTeacherZc(pageNum, pageSize, teacherType);
        model.addAttribute("teacherType", teacherType);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/teacher/teacherZc";
    }

    /**
     * 添加教师职称
     */
    @RequestMapping("/addTeacherZC")
    public String addTeacherZC(Model model, TeacherType teacherType, HttpServletRequest request) {
        JsonMessage jsonMessage = teacherTypeService.addTeacherZc(teacherType);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "添加教师职称：" + teacherType.getZhicheng());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/teacher/findTeacherZC.do";
    }

    /**
     * 更改教师职称
     */
    @RequestMapping("/updateTeacherZc")
    public String updateTeacherZc(Model model, TeacherType teacherType, HttpServletRequest request) {
        JsonMessage jsonMessage = teacherTypeService.updateTeacherZc(teacherType);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "更改教师职称：" + teacherType.getZhicheng());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/teacher/findTeacherZC.do";
    }

    /**
     * 删除教师职称
     */
    @RequestMapping("/delTeacherZc")
    public String delTeacherZc(Model model, int id, HttpServletRequest request) {
        TeacherType teacherType = (TeacherType) teacherDao.findTeacherByType(id);
        JsonMessage jsonMessage = teacherTypeService.delTeacherZc(id);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "删除教师职称：" + teacherType.getZhicheng());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/teacher/findTeacherZC.do";
    }

}
