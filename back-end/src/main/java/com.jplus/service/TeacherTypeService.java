package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.TeacherType;
import com.jplus.entity.V_teacher;

import java.util.List;

/**
 * Created by rf on 2017/9/17.
 */
public interface TeacherTypeService {
    /**
     * 根据教师id查找教师所在教师类型
     * @param id
     * @return
     */
    JsonMessage findTeacherTypeById(int id);

    /**
     * 查找所有教师类型
     * @return
     */
   JsonMessage findAllTeacherType();

    /**
     * 查找教师职称数目
     * @return
     * @throws Exception
     */
    int NumZc() throws  Exception;

    List<V_teacher> findTeacherBylx(int lx_id);

    JsonMessage findTeacherZc(int pageNum, int pageSize, TeacherType teacherType);

    /**
     * 添加教师职称
     * @param teacherType
     * @return
     */
    JsonMessage addTeacherZc(TeacherType teacherType);

    /**
     * 更新教师职称
     * @param teacherType
     * @return
     */
    JsonMessage updateTeacherZc(TeacherType teacherType);

    /**
     * 根据职称id删除职称
     * @param id
     * @return
     */
    JsonMessage delTeacherZc(int id);
}
