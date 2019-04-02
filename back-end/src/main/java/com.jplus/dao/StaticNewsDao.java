
package com.jplus.dao;

import com.jplus.entity.News;
import com.jplus.entity.StaticNews;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("staticNews")
public interface StaticNewsDao {
    int addStaticNews(StaticNews staticNews) throws Exception;

    /**
     *
     * @param staticNews 静态新闻
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int updateStaticNews(StaticNews staticNews) throws Exception;

    /**
     *
     * @param id
     * @return 静态新闻对象
     */
    StaticNews findStaticNewsById(int id);

    /**
     *
     * @param newsType 静态新闻类型
     * @return 静态新闻对象
     */
    StaticNews findStaticNewsByNewsType(int newsType);

    /**
     * 查找所有静态新闻
     * @return
     * @throws Exception
     */
    List<StaticNews> findAllStaticNews() throws Exception;

    /**
     *删除静态新闻
     * @param id
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int deleteStaticNews(int id) throws Exception;

    /**
     * 查找符合条件的数目
     * @param map
     * @return
     */
    int findStaticNewsNum(Map<String, Object> map);

    List<StaticNews> findStaticNews(Map<String, Object> map);
}
