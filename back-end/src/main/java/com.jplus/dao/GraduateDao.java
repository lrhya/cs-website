
package com.jplus.dao;

import com.jplus.entity.Graduate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("graduateDao")
public interface GraduateDao {
    /**
     *
     * 更改首页图片
     */
    void updateIndexPic(Graduate graduate);
    /**
     * @return 返回风采展示记录数
     * @throws Exception
     */
    int getGraduateCount() throws Exception;

    /**
     * @param graduate id,uuid
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int addGraduate(Graduate graduate) throws Exception;

    /**
     *
     * @param graduate
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int updateGraduate(Graduate graduate) throws Exception;

    /**
     *
     * @param id uuid
     * @return 新闻对象
     */
    Graduate findGraduateById(String id);

    /**
     *
     * @param param 分页参数
     * @return
     * @throws Exception
     */
    List<Graduate> findAllGraduate(Map<String, Integer> param) throws Exception;

    /**
     *
     * @param graduate 新闻查询条件
     * @return
     * @throws Exception
     */
    List<Graduate> findGraduateSelective(Graduate graduate) throws Exception;

    /**
     *
     * @param id
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int deleteGraduate(String id) throws Exception;

    /**
     * 展示首页图片
     * @return
     * @throws Exception
     */
    List<Graduate> indexPic() throws Exception;

    Boolean addIndexPic(Graduate graduate);

    int indexNum() ;
}
