
package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.StaticNews;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by rf on 2017/9/15.
 */
public interface StaticNewsService {
    

    /**
     * 添加静态新闻
     * @param staticNews
     * @return
     */
    JsonMessage addStaticNews(StaticNews staticNews);

    /**
     * 
     * @param staticNews
     * @return
     */
    JsonMessage updateStaticNews(StaticNews staticNews);

    /**
     * 通过静态新闻id编辑静态新闻
     * @param id
     * @return
     */
    JsonMessage findStaticNewsByNewsType(int id);
    /**
     * 通过静态新闻id编辑静态新闻
     * @param id
     * @return
     */
    JsonMessage editStaticNews(int id);

    JsonMessage findById(int id);
    /**
     * 查找所有静态新闻
     * @return
     */
    JsonMessage findAllStaticNews();
    

    /**
     *  删除静态新闻（根据主键id）
     * @param id
     * @return
     */
    JsonMessage deleteStaticNews(int id);

    JsonMessage findStaticNews(int pageNum, int pageSize, String typename);
}
