
package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.Teacher;
import com.jplus.entity.TeacherType;
import com.jplus.entity.V_student;
import com.jplus.entity.V_teacher;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;
public class TeacherDaoTest extends SpringTestBase {
    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private TeacherTypeDao teacherTypeDao;


    public TeacherDaoTest() throws Exception {
    }

    @Test
    public void findTeacherByType() throws Exception {
        teacherDao.findTeacherByType(1);
    }

    @Test
    public void findTeacherByName() throws Exception {
        Teacher teacher = teacherDao.findTeacherByName("汪自云");
        System.out.println(teacher);
    }

    @Test
    public void getTeacherCount() throws Exception {
        int n = teacherDao.getTeacherCount();
        System.out.println(n);
    }

    @Test
    public void addTeacher() throws Exception {
        List<TeacherType> teacherTypes = teacherTypeDao.findAllTeacherType();
        Teacher teacher = new Teacher();
        teacher.setZhichenghao(teacherTypes.get(2).getId());
        teacher.setName("test");
        teacher.setZhichenghao(2);
        teacher.setJslx(1);
        teacherDao.addTeacher(teacher);
    }

    @Test
    public void updateTeacher() throws Exception {
        List<TeacherType> teacherTypes =teacherTypeDao.findAllTeacherType();
        Teacher teacher=new Teacher();
        teacher.setId(1);
        teacher.setZhichenghao(teacherTypes.get(2).getId());
        teacher.setName("test");
        teacher.setZhichenghao(2);
        teacher.setJslx(1);
        teacherDao.updateTeacher(teacher);
    }

    @Test
    public void findTeacherById() throws Exception {
        V_teacher v_teacher = teacherDao.findTeacherById(1);
        System.out.println(v_teacher.getZhicheng());
    }

   /* @Test
    public void findAllTeacher() throws Exception {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("start", 5);
        param.put("size", 6);
        List<V_teacher> teacherList = teacherDao.findAllTeacher(param);
        System.out.println(teacherList.get(1).getZhicheng());
    }*/
/*
    @Test
    public void findTeacherSelective() throws Exception {
        Teacher teacher = new Teacher();
        teacher.setZhichenghao(2);
        List<V_teacher> teacherList = teacherDao.findTeacherSelective(teacher);
        System.out.println(teacherList);
    }*/

    @Test
    public void deleteTeacher() throws Exception {
        teacherDao.deleteTeacher(95);
    }

    //    @Test
//    public void findTeacherByZC(){
//       // Teacher teacher = new Teacher();
//       List<TeacherType> teacherTypeController= teacherDao.findTeacherByZC(1);
//        List<Teacher> teacherList=teacherTypeController.getTeachers();
//       System.out.println(teacherList);
//    }
    @Test
    public void findTeacherByZC() {
        List<V_teacher> v_teachers = teacherDao.findTeacherByZC(1, 1);
        System.out.println(v_teachers);
    }
}