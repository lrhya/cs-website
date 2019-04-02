
package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Teacher;
import com.jplus.entity.TeacherType;
import com.jplus.entity.V_teacher;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/15.
 */
public interface TeacherService {
    /**
     * 添加老师
     * @param Teacher
     * @return 操作结果
     */
    JsonMessage addTeacher(Teacher Teacher);

    //修改老师，管理员权限
    JsonMessage updateTeacher(Teacher Teacher);

    /**
     * 通过用户id编辑老师
     * @param id
     * @return
     */
    JsonMessage editTeacher(int id);

    /**
     * 查找所有老师，分页显示，传入参数（pageSize，pageNum, v_teacher）
     * @param pageNum
     * @param  pageSize
     * @return
     */
    JsonMessage findAllTeacher(int pageNum, int pageSize,V_teacher v_teacher)throws Exception;

    /**
     *  根据主键id删除老师
     * @param id 主键id
     * @return
     */
    JsonMessage deleteTeacher(int id);

    /**
     * 通过id查找老师
     * @param Id 主键id
     * @return
     */
    JsonMessage findTeacherById(int Id);
    /**
     * 查找老师按职称显示
     * @param lx_id
     * @return
     */
    Map<String,List<V_teacher>> findTeacherByZc(int lx_id);

}
