package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.Teacher;
import com.jplus.entity.TeacherType;
import com.jplus.entity.V_teacher;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by rf on 2017/9/21.
 */
public class TeacherTypeDaoTest extends SpringTestBase{
    @Autowired
    private TeacherTypeDao teacherTypeDao;
    @Test
    public void findTeacherTypeById() throws Exception {
    }

    @Test
    public void findAllTeacherType() throws Exception {
        teacherTypeDao.findAllTeacherType();
    }

    @Test
    public void NumZc(){
        System.out.println(teacherTypeDao.NumZc());
    }


    @Test
    public void findTeacherZCNum() throws Exception {
        TeacherType teacherType=new TeacherType();

        int count=teacherTypeDao.findTeacherZCNum(teacherType);
        System.out.println(count);
    }

}