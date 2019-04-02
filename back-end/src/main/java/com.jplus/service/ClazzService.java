
package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Clazz;

import java.util.Map;

/**
 * Created by rf on 2017/9/15.
 */
public interface ClazzService {
    /**
     * 添加毕业班级
     * @param clazz
     * @return
     */
    JsonMessage addClazz(Clazz clazz);

    //修改毕业班级，管理员权限
    JsonMessage updateClazz(Clazz clazz);

    /**
     * 通过用户id编辑毕业班级
     * @param id
     * @return
     */
    JsonMessage editClazz(int id);

    /**
     * 查找所有老师，分页显示，传入参数（pageSize，pageNum）
     * @param pageNum
     * @param  pageSize
     * @return
     */
    JsonMessage findAllClazz(int pageNum, int pageSize,Clazz clazz);

    JsonMessage findAllClazz();

    /**
     *  根据条件查找毕业班级
     * @param map
     * @return
     */
    JsonMessage findClazzSelective(Map<String,Object> map);

    /**
     *  删除毕业班级（根据主键id）
     * @param id
     * @return
     */
    JsonMessage deleteClazz(int id);

    JsonMessage findClazzByName(String name);
}
