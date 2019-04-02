
package com.jplus.dao;

import com.jplus.entity.Clazz;
import com.jplus.entity.V_user;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("clazzDao")
public interface ClazzDao {

    int getClazzCount(Clazz clazz);

    /**
     * 班级姓名做唯一校验
     * @param name
     * @return
     */
    Clazz findClazzByName(String name);

    /**
     * 添加班级
     * @param clazz 传入班级username，password，rank
     */
    int addClazz(Clazz clazz);

    /**
     * 修改班级，管理员权限
     * @param clazz
     */
    int updateClazz(Clazz clazz);

    /**
     * 通过用查找班级
     * @param id 户id
     * @return 返回单个班级
     */
    Clazz findClazzById(int id);

    /**
     *根据条件查找班级，并且分页
     * @param param 传入参数（pageSize，pageNum）
     * @return
     */
    List<Clazz> findAllClazz(Map<String, Object> param);

    List<Clazz> findAllClazz2();

//    /**
//     * 根据条件查找班级
//     * @param map
//     * @return 返回班级集合
//     */
//    List<Clazz> findClazzSelective(Map<String,Object> map);

    /**
     * 删除班级
     * @param id（根据主键id）
     */
    void deleteClazz(int id);



}
