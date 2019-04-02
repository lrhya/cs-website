package com.jplus.dao;

import com.jplus.entity.NewsType;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("newsTypeDao")
public interface NewsTypeDao {
    /**
     *根据新闻id查找新闻名称
     * @param typeId
     * @return
     * @throws Exception
     */
    NewsType findNewsTypeById(int typeId) throws Exception;

    /**
     * 查找所有新闻类型
     * @return
     * @throws Exception
     */
    List<NewsType> findAllNewsType() throws Exception;

    /**
     * 按分页条件查找所有的新闻类型
     * @return
     * @throws Exception
     */
    List<NewsType> findNewsTypeLimit(Map<String,Integer> map) throws Exception;


    /**
     * 修改新闻类型
     * @param newsType
     * @return
     */
    Boolean updateNewsType(NewsType newsType)throws Exception;

    /**
     * 根据新闻类型id删除新闻类型
     * @param nt_id
     * @return
     */
    Boolean deleteNewsType (int nt_id)throws Exception;

    /**
     * 添加新闻类型
     * @param newsType
     * @return
     */
    Boolean addNewsType(NewsType newsType)throws Exception;

    int findNewsTypeNum();
}
