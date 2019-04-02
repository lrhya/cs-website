package com.jplus.dao;

import com.jplus.entity.Teacher;
import com.jplus.entity.TeacherType;
import com.jplus.entity.V_teacher;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("teacherDao")
public interface TeacherDao {

    int getTeacherCount();

    /**
     * 添加老师
     * @param teacher 
     */
    int addTeacher(Teacher teacher);

    /**
     * 修改老师
     * @param Teacher 
     */
    int updateTeacher(Teacher Teacher);

    /**
     * 通过id查找老师
     * @param id 户id
     * @return 返回单个老师
     */
    V_teacher findTeacherById(int id);

    /**
     * 通过教师类型查找老师
     * @param type
     * @return
     */
    List<Teacher> findTeacherByType(int type);
    /**
     * 通过姓名查找老师
     * @param name
     * @return
     */
    Teacher findTeacherByName(String name);

    /**
     *查找老师，并且分页
     * @param param 传入参数（pageSize，pageNum）
     * @return
     */
    List<V_teacher> findAllTeacher(Map<String, Object> param) throws Exception;

    /**
     * 根据条件查找老师数目
     * @param v_teacher (查找条件：老师名字、角色名称)
     * @return
     */
    int findAllTeacherNum(V_teacher v_teacher) throws Exception;

    /**
     * 删除老师
     * @param id（根据主键id）
     */
    int deleteTeacher(int id);

//    List<TeacherType> findTeacherByZC(int zc_id);

    List<V_teacher> findTeacherByZC(@Param("zc_id") int zc_id, @Param("lx_id") int lx_id) ;
}
