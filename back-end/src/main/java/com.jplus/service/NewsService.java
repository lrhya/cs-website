
package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.News;
import com.jplus.entity.Page;
import com.jplus.entity.V_news;

import java.util.List;
import java.util.Map;

/**
 * 后端不做数据校验，由前端负责数据校验
 */
public interface NewsService {

    /**
     * 添加新闻
     * @param news id,主键，自动添加，不需要添加
     *  @return 0,操作失败，>0 操作成功
     */
    JsonMessage addNews(News news) ;

    /**
     *更新新闻
     * @param news news id,必须传入，指定要更新新闻id
     * @return
     * @
     */
    JsonMessage updateNews(News news) ;

    /**
     *通过id查找新闻
     * @param id
     * @return
     * @
     */
    JsonMessage findNewsById(int id) ;

    /**
     * 查找新闻，并且分页
     * @param pageNum 第几页
     * @param pageSize 每页显示记录数
     * @return
     */
    JsonMessage findNewsPageByNewsType(int pageNum,int pageSize,int newstype);

    /**
     * 返回所有新闻列表，并且分页
     * @param pageNum
     * @param pageSize
     * @return
     */
    JsonMessage findAllNewsPage(int pageNum,int pageSize);

    /**
     *根据条件查找新闻
     * @param
     * @return
     * @
     */
    JsonMessage findNewsSelective(V_news v_news,int pageNum,int pageSize);

    /**
     * 按新闻类型，查找新闻
     * @param newsType 新闻类型
     * @param  n 显示个数
     * @return
     * @
     */
    JsonMessage findNewsLimitByNewsType(int newsType,int n);

    /**
     * 删除新闻
     * @param id id,主键
     */
    JsonMessage  deleteNews(int id);

    /**
     * 批量删除新闻
     * @param newsId
     * @return
     */
    JsonMessage batchDeleteNews(int[] newsId);

}
