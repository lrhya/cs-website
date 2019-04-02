package com.jplus.dao;

import com.jplus.entity.Jslx;
import com.jplus.entity.TeacherType;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("jslxDao")
public interface JslxDao {
    Jslx findJslxById(int id);

    /**
     * 查找所有老师类型
     * @return
     */
    List<Jslx> findAllJslx() throws  Exception;

    /**
     * 按条件查找老师类型
     * @return
     * @throws Exception
     */
    List<Jslx> findJslxSelective(Map<String ,Object> map) throws  Exception;

    /**
     * 查找符合条件的教师类别数目
     * @param jslx
     * @return
     * @throws Exception
     */
    int findJslxSelectiveNum(Jslx jslx) throws Exception;

    /**
     * 根据教师类别ID删除
     * @param id
     * @return
     */
    Boolean delJslx(int id);

    /**
     * 更改教师类型
     * @param jslx
     * @return
     */
    Boolean editJslx(Jslx jslx);

    /**
     * 添加教师类型
     * @param jslx
     * @return
     */
    Boolean addJslx(Jslx jslx);
}
