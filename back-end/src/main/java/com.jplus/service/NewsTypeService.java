
package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.NewsType;

import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/17.
 */
public interface NewsTypeService {
    /**
     * 根据id查找新闻所在新闻类型
     * @param typeId
     * @return
     */
    JsonMessage findNewsTypeNameById(int typeId);

    /**
     * 查找所有新闻类型
     * @return
     */
    JsonMessage findAllNewsType();

    /**
     * 根据分页查找新闻类型
     * @return
     */
    JsonMessage findNewsTypelimit(int pageNum,int pageSize);

    JsonMessage updateNewsType(NewsType newsType)throws Exception;

    JsonMessage deleteNewsType (int id)throws Exception;

    JsonMessage addNewsType(NewsType newsType)throws Exception;

}
