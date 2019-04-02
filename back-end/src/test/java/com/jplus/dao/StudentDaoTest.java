package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.Student;
import com.jplus.entity.V_student;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/9/28.
 */
public class StudentDaoTest extends SpringTestBase{
    @Test
    public void findStuNumSelective() throws Exception {
        V_student v_student=new V_student();
        studentDao.findStuNumSelective(v_student);
    }

    @Autowired
    private StudentDao studentDao;
    @Test
    public void getStudentCount() throws Exception {
        studentDao.getStudentCount();
    }

    @Test
    public void addStudent() throws Exception {
        Student student = new Student();
        student.setName("test");
        student.setUsername("1111");
        student.setCid(1);
        studentDao.addStudent(student);
    }


    @Test
    public void updateStudent() throws Exception {
        Student student = new Student();
        student.setName("test3");
        student.setUsername("1111");
        student.setId(451);
        studentDao.updateStudent(student);
    }

    @Test
    public void findStudentById() throws Exception {
        studentDao.findStudentById(1);
    }

    @Test
    public void findStudentByName() throws Exception {
    }

    @Test
    public void findAllStudent() throws Exception {
        Map<String,Integer> map =new HashMap<String, Integer>();
        map.put("start",0);
        map.put("size",6);
        studentDao.findAllStudent(map);
    }


    @Test
    public void deleteStudent() throws Exception {
        studentDao.deleteStudent(451);
    }

    @Test
    public void findStudentSelective(){
        Map<String,Object> map=new HashMap<String ,Object>() ;

        map.put("start",0);
        map.put("size",6);
        map.put("v_student",null);
        List<V_student> v_students=studentDao.findStudentSelective(map);
    }

}