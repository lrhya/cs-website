
package com.jplus.controller;

import com.jplus.dao.TeacherDao;
import com.jplus.entity.*;
import com.jplus.service.JslxService;
import com.jplus.service.TeacherService;
import com.jplus.service.TeacherTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 教师管理
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Resource
    private TeacherService teacherService;
    @Resource
    private TeacherTypeService teacherTypeService;
    @Resource
    private JslxService jslxService;
    @Resource
    private TeacherDao teacherDao;

    /**
     * 前台根据职称来获取Teacher列表
     *
     * @param lx_id 职称id
     */
    @RequestMapping("/front/findZcTeacher.do")
    public String findZcTeacher(Model model, int lx_id) {

        Map<String, List<V_teacher>> map = teacherService.findTeacherByZc(lx_id);
//        req.setAttribute("teachers",map);
        model.addAttribute("teachers", map);
        for (Map.Entry<String, List<V_teacher>> entry : map.entrySet()) {
            System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
//            System.out.println(entry.getValue().get(0).getId());
        }
        System.out.println();
        return "front/view/teacherZcList";
    }


    /**
     * 前台根据教师id，查看教师简介
     *
     * @param Id 教师id
     */
    @RequestMapping("/font/findTeacherById.do")
    public String findTeacherById(@RequestParam(defaultValue = "0") int Id, Model model) {
        JsonMessage jsonMessage = teacherService.findTeacherById(Id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "front/view/teacherDetail";
    }

    /**
     * 后台根据教师id，查看教师简介
     *
     * @param id 教师id
     */
    @RequestMapping("/admin/findById.do")
    public String findTeacherById2(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage jsonMessage = teacherService.findTeacherById(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/teacher/teacherDetail";
    }

    /**
     * 添加教师
     *
     * @param teacher 传入教师相关信息
     */
    @RequestMapping("addTeacher.do")
    public String addTeacher(Teacher teacher, Model model, HttpServletRequest request) {
        JsonMessage jsonMessage = teacherService.addTeacher(teacher);
        model.addAttribute("jsonMessage", jsonMessage);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "添加教师：" + teacher.getName());
            return "redirect:/teacher/findTeacherPage.do";
        } else {
            model.addAttribute("teacher", teacher);
            return "forward:/teacher/toAddUi.do";
        }

    }

    /**
     * 后台根据id删除教师
     *
     * @param id 教师id
     */
    @RequestMapping("deleteTeacher.do")
    public String deleteTeacher(@RequestParam(defaultValue = "0") int id, Model model, HttpServletRequest request) {
        V_teacher teacher = teacherDao.findTeacherById(id);
        JsonMessage jsonMessage = teacherService.deleteTeacher(id);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "删除教师：" + teacher.getName());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/teacher/findTeacherPage.do";
    }

    /**
     * 后台跳到编辑教师页面
     *
     * @param model 存放向前台页面存入的数据
     */
    @RequestMapping("/toEditUi.do")
    public String toEditUi(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage teacherType = teacherTypeService.findAllTeacherType();
        JsonMessage jslxJson = jslxService.findAllJslx();
        model.addAttribute("jslxJson", jslxJson);
        model.addAttribute("teacherTypeJson", teacherType);
        JsonMessage jsonMessage = teacherService.editTeacher(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/teacher/editTeacher";
    }

    /**
     * 后台跳到添加教师页面
     *
     * @param model 存放向前台页面存入的数据
     */
    @RequestMapping("/toAddUi.do")
    public String toAddUi(Model model) {
        JsonMessage teacherType = teacherTypeService.findAllTeacherType();
        JsonMessage jslxJson = jslxService.findAllJslx();
        model.addAttribute("jslxJson", jslxJson);
        model.addAttribute("teacherTypeJson", teacherType);
        return "admin/view/teacher/addTeacher";
    }

    /**
     * 更新教师
     *
     * @param model 存放向前台页面存入的数据
     */
    @RequestMapping("/updateTeacher.do")
    public String updateTeacher(Teacher teacher, @RequestParam(defaultValue = "0") int id, Model model, HttpServletRequest request) {
        JsonMessage updateMsg = teacherService.updateTeacher(teacher);
        model.addAttribute("updateMsg",updateMsg);
        if (updateMsg.isSuccess()) {
            request.setAttribute("mess", "更改教师：" + teacher.getName());
            return "redirect:/teacher/findTeacherPage.do";
        } else {
            model.addAttribute("teacher", teacher);
            return "forward:/teacher/toEditUi.do";
        }
    }

    /**
     * 查找教师并且分页
     *
     * @param model    存放向前台页面存入的数据
     */
    @RequestMapping("/findTeacherPage.do")
    public String findTeacherPage(V_teacher v_teacher, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
            int pageSize, Model model) throws Exception {
        System.out.println("v_teacher:" + v_teacher);
        JsonMessage jsonMessage = teacherService.findAllTeacher(pageNum, pageSize, v_teacher);
        JsonMessage teacherType = teacherTypeService.findAllTeacherType();
        model.addAttribute("v_teacher", v_teacher);
        model.addAttribute("teacherType", teacherType);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/teacher/teacherList";
    }

   /* @RequestMapping("/findZcTeacher2.do")
    public String findTeacherBy(HttpServletRequest req){

        Map<String,List<V_teacher>> map =teacherService.findTeacherByZc(2);
        req.setAttribute("teachers",map);
        for (Map.Entry<String, List<V_teacher>> entry : map.entrySet()) {
            System.out.println("key= " + entry.getKey() + " and value= " + entry.getValue());
        }
        return "front/view/teacher2";
    }*/

}
