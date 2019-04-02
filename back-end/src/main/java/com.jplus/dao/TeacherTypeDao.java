package com.jplus.dao;

import com.jplus.entity.Teacher;
import com.jplus.entity.TeacherType;
import com.jplus.entity.V_teacher;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("TeacherTypeDao")
public interface TeacherTypeDao {
    TeacherType findTeacherTypeById(int id);

    /**
     * 查找所有老师类型
     * @return
     */
    List<TeacherType> findAllTeacherType() throws  Exception;

    /**
     * 查询符合条件的教师职称数目
     * @param teacherType
     * @return
     * @throws Exception
     */
    int findTeacherZCNum(TeacherType teacherType) throws Exception;

    /**
     * 查询符合条件的教师职称
     * @param map
     * @return
     * @throws Exception
     */
    List<TeacherType> findTeacherZC(Map<String,Object> map ) throws  Exception;


    /**
     *添加教师职称
     * @param teacherType
     * @return
     */
    Boolean addTeacherZc(TeacherType teacherType);

    /**
     * 更新教师职称
     * @param teacherType
     * @return
     */
    Boolean updateTeacherZc(TeacherType teacherType);

    /**
     * 根据职称id删除职称
     * @param id
     * @return
     */
    Boolean delTeacherZc(int id);

    /**
     * 老师职称数目
     * @return
     */
    int NumZc();


}
