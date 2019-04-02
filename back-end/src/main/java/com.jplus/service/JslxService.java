package com.jplus.service;

import com.jplus.entity.Jslx;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.V_teacher;

import java.util.List;

/**
 * Created by rf on 2017/9/17.
 */
public interface JslxService {
    /**
     * 根据教师id查找教师所在教师类型
     * @param id
     * @return
     */
    JsonMessage findJslxById(int id);

    /**
     * 查找所有教师类型
     * @return
     */
   JsonMessage findAllJslx();

    /**
     * 按条件查找老师类型
     * @return
     */
   JsonMessage findJslxSelective(int pageNum, int size, Jslx jslx);

    /**
     * 删除教师类型
     * @param id
     * @return
     */
    JsonMessage delJslx(int id);

    /**
     * 编辑教师类型
     * @param jslx
     * @return
     */
    JsonMessage editJslx(Jslx jslx);

    /**
     * 添加教师类型
     * @param jslx
     * @return
     */
    JsonMessage addJslx(Jslx jslx);
}
