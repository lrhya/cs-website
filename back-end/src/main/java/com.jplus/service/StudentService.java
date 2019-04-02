
package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Student;
import com.jplus.entity.V_student;

import java.util.Map;

/**
 * Created by rf on 2017/9/15.
 */
public interface StudentService {
    /**
     * 添加学生
     * @param student
     * @return
     */
    JsonMessage addStudent(Student student);

    //修改学生，管理员权限
    JsonMessage updateStudent(Student student);

    public JsonMessage uploadPhoto(Student Student,String basePath);

    public JsonMessage uploadResume(Student Student,String basePath);
    /**
     * 通过id编辑学生
     * @param id
     * @return
     */
    JsonMessage editStudent(int id);

    /**
     * 查找所有学生，分页显示，传入参数（pageSize，pageNum）
     * @param pageNum
     * @param  pageSize
     * @return
     */
    JsonMessage findAllStudentPage(int pageNum, int pageSize);


    /**
     *  根据条件查找学生分页
     * @param v_student ,pageNum,size
     * @return
     */
    JsonMessage findStudentSelective(V_student v_student,int pageNum,int size);

    /**
     *  删除学生（根据主键id）
     * @param id
     * @return
     */
    JsonMessage deleteStudent(int id,String basePath);


    JsonMessage batchDeleteStus(int[] stuId,String basePath);
}
