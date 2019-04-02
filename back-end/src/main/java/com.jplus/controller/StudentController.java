package com.jplus.controller;
import com.jplus.dao.StudentDao;
import com.jplus.entity.Student;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.V_student;
import com.jplus.service.ClazzService;
import com.jplus.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by rf on 2017/9/15.
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private StudentService StudentService;
    @Autowired
    private ClazzService clazzService;

    @RequestMapping("/toAddUi.do")
    public String toAddUi(Model model){
        JsonMessage clazzListJson = clazzService.findAllClazz();
        model.addAttribute("clazzListJson", clazzListJson);
        return "admin/view/student/addStudent";
    }
    /**
     * @param student 传入用户姓名、密码、权限等级
     */
    @RequestMapping("addStudent.do")
    public String addStudent(Student student,HttpServletRequest request, Model model) {
        JsonMessage jsonMessage = StudentService.addStudent(student);
        model.addAttribute("jsonMessage", jsonMessage);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess","添加学生："+student.getName());
            return "redirect:/student/findStudentPage.do";
        } else {
            model.addAttribute("student", student);
            return "forward:/student/toAddUi.do";
        }

    }

    @RequestMapping("deleteStudent.do")
    public String deleteStudent(int id,HttpServletRequest request, Model model,String username,String name,Integer cid) {
        String basePath =request.getServletContext().getRealPath("/upload");
        JsonMessage jsonMessage = StudentService.deleteStudent(id,basePath);
        if(jsonMessage.isSuccess()){
            V_student v_student = (V_student) jsonMessage.getResult();
            model.addAttribute("v_student", v_student);
            request.setAttribute("mess","删除用户："+ v_student.getName());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/student/findStudentPage.do?cid="+cid+"&name="+name+"&username="+username;
    }

    @RequestMapping("/deleteStudentBatch.do")
    public String batchDeleteNews(Model model, @RequestParam(defaultValue = "{0}") int[] stuId,
         HttpServletRequest request,Student student) {
        String basePath = request.getServletContext().getRealPath("/upload");
        JsonMessage jsonMessage = StudentService.batchDeleteStus(stuId,basePath);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "批量删除学生...");
        }
        model.addAttribute("student",student);
        model.addAttribute("jsonMessage", jsonMessage);
        return "forward:/student/findStudentPage.do";
    }

    @RequestMapping("/toEditUi.do")
    public String toEditUi(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage clazzListJson = clazzService.findAllClazz();
        model.addAttribute("clazzListJson", clazzListJson);
        JsonMessage jsonMessage = StudentService.editStudent(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/student/editStudent";
    }
    @RequestMapping("/updateStudent.do")
    public String updateStudent(Student student, HttpServletRequest request,Model model) {
        JsonMessage jsonMessage = StudentService.updateStudent(student);
        model.addAttribute("jsonMessage2", jsonMessage);
        if(jsonMessage.isSuccess()){
            request.setAttribute("mess","更改学生："+student.getName());
            return "forward:/student/findStudentPage.do";
        }else{
            return "forward:/student/toEditUi.do";
        }
    }

    /**
     *
     *上传简历
     */
    @RequestMapping("/updateResume.do")
    public String uploadResume(Student student, HttpServletRequest request,Model model) {
        String basePath = request.getServletContext().getRealPath("/upload")+"/resume";
        JsonMessage jsonMessage = StudentService.uploadResume(student,basePath);
        if(jsonMessage.isSuccess()){
            request.setAttribute("mess","更换简历："+student.getResume());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/student/findStudentPage.do";
    }

    /**
     *上传学生图片
     */
    @RequestMapping("/updatePhoto.do")
    public String uploadPhoto(Student student, HttpServletRequest request,Model model) {
        String basePath = request.getServletContext().getRealPath("/upload")+"/photo";
        JsonMessage jsonMessage = StudentService.uploadPhoto(student,basePath);
        if(jsonMessage.isSuccess()){
            request.setAttribute("mess","更换图片："+student.getPhoto());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/student/findStudentPage.do";
    }

    /**
     *
     *查找学生并且分页
     */
    @RequestMapping("/findStudentPage.do")
    public String findStudentPage(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
            int pageSize, Model model, V_student v_student) {
        System.out.println(v_student);
        JsonMessage clazzListJson = clazzService.findAllClazz();
        model.addAttribute("clazzListJson", clazzListJson);
        JsonMessage jsonMessage = StudentService.findStudentSelective( v_student,pageNum,pageSize);
        model.addAttribute("jsonMessage", jsonMessage);
        model.addAttribute("v_student",v_student);
        return "admin/view/student/stuList";
    }
}


