package com.jplus.service.impl;

import base.SpringTestBase;
import com.jplus.entity.Student;
import com.jplus.service.StudentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/11/3.
 */
public class StudentServiceImplTest extends SpringTestBase{
    @Autowired
    private StudentService studentService;
    @Test
    public void addStudent() throws Exception {
        Student student =new Student();
        studentService.addStudent(student);
    }

}