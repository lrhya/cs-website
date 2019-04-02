package com.jplus.dao;

import com.jplus.entity.Student;
import com.jplus.entity.V_student;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("studentDao")
public interface StudentDao {

    int getStudentCount();

    /**
     * 添加学生
     * @param student 学生
     */
    int addStudent(Student student);

    /**
     * 修改学生
     * @param student 学生
     */
    int updateStudent(Student student);

    /**
     * 通过用查找学生
     * @param id 户id
     * @return 返回单个学生
     */
    V_student findStudentById(int id);

    /**
     * 通过姓名查找学生
     * @param name
     * @return
     */
    Student findStudentByName(String name);

    /**
     *查找学生，并且分页
     * @param param 传入参数（pageSize，pageNum）
     * @return
     */
    List<V_student> findAllStudent(Map<String, Integer> param);


    /**
     * 删除学生
     * @param id（根据主键id）
     */
   void deleteStudent(int id);

    /**
     * 根据班级删除学生
     * @param cid
     * @return
     */
    void deleteStuByClz(int cid);

    /**
     * 根据条件查询学生分页
     * @param map
     * @return
     */
    List<V_student> findStudentSelective(Map<String,Object> map);

    /**
     * 查询符合条件的学生记录数
     * @param v_student
     * @return
     */
    int findStuNumSelective(V_student v_student);

    Boolean batchDeleteStus(int[] stuId);
}
