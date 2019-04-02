
package com.jplus.dao;

import com.jplus.entity.News;
import com.jplus.entity.V_news;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("newsDao")
public interface NewsDao {
    /**
     *
     * @param newsType
     * @return 返回某新闻类型下新闻总记录数
     * @throws Exception
     */
    int getNewsCountByNewsType(int newsType) throws Exception;

    /**
     * 返回所有新闻总记录数
     * @return
     * @throws Exception
     */
    int getNewsCount() throws Exception;
    /**
     * @param news id,主键，自动添加，不需要添加
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int addNews(News news) throws Exception;

    /**
     *
     * @param news
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int updateNews(News news) throws Exception;

    /**
     *
     * @param id
     * @return 新闻对象
     */
    V_news findNewsById(int id);

    /**
     * 查找所有新闻
     * @param param 分页参数
     * @return
     * @throws Exception
     */
    List<V_news> findAllNewsPage(Map<String, Integer> param) throws Exception;
    /**
     *
     * @param param 分页参数
     * @return
     * @throws Exception
     */
    List<V_news> findNewsPageByNewsType(Map<String, Integer> param) throws Exception;

    /**
     *
     * @param map 新闻查询条件
     * @return
     * @throws Exception
     */
    List<V_news> findNewsSelective(Map<String,Object> map) throws Exception;

    /**
     *
     * @param map 新闻类型，显示个数
     * @return
     * @throws Exception
     */
    List<V_news> findNewsLimitByNewsType(Map<String,Integer> map) throws Exception;
    /**
     *
     * @param id
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int deleteNews(int id) throws Exception;

    /*int findNewsByType(int ty_id) throws Exception;*/


    /**
     * 根据条件查询记录
     * @param v_news
     * @return
     * @throws Exception
     */
    int getCount(V_news v_news) throws Exception;

    /**
     * 批量删除新闻
     * @param newsId
     * @return
     */
    Boolean batchDeleteNews(int[] newsId);

    /**
     * 根据新闻类型删除新闻
     * @param id
     * @return
     */
    Boolean deleteNewsByNewsType(int id);

}
