package com.jplus.service.impl;

import com.jplus.dao.NewsDao;
import com.jplus.dao.NewsTypeDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.NewsType;
import com.jplus.entity.Page;
import com.jplus.service.NewsTypeService;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/17.
 */
@Service("newsTypeService")
public class NewsTypeServiceImpl implements NewsTypeService {
    @Resource
    private NewsTypeDao newsTypeDao;
    @Resource
    private NewsTypeService newsTypeService;

    @Resource
    private  NewsDao newsDao;

    public JsonMessage findNewsTypeNameById(int id){
        NewsType newsType = null;
        try {
            newsType = newsTypeDao.findNewsTypeById(id);
        } catch (Exception e) {
            return new JsonMessage(false,"查找新闻类型失败！");
        }
        if(newsType!=null){
            return new JsonMessage(true,newsType);
        }else{
            return new JsonMessage(false,"查找新闻类型失败！");
        }
    }

    public JsonMessage findAllNewsType(){
        List<NewsType> newsTypeList = null;
        try {
            newsTypeList = newsTypeDao.findAllNewsType();
        } catch (Exception e) {
            return new JsonMessage(false,"查找新闻类型失败！");
        }
        if(newsTypeList!=null&&!newsTypeList.isEmpty()){
            return new JsonMessage(true,newsTypeList);
        }else{
            return new JsonMessage(false,"查找新闻类型失败！");
        }
    }

    public JsonMessage findNewsTypelimit(int pageNum,int pageSize) {
        Map<String,Integer> map=new HashMap<String, Integer>();
        int totalRecold=newsTypeDao.findNewsTypeNum();
        Page<NewsType>newsTypePage=new Page<NewsType>(pageSize,pageNum,totalRecold,null);
        int start=(newsTypePage.getCurrentPage()-1)*pageSize;
        map.put("start",start);
        map.put("size",pageSize);
        List<NewsType> newsTypeList = null;
        try {
            newsTypeList = newsTypeDao.findNewsTypeLimit(map);
            newsTypePage.setDataList(newsTypeList);
        } catch (Exception e) {
            return new JsonMessage(false,"查找新闻类型失败！");
        }
            return new JsonMessage(false,newsTypePage);
    }

    public  JsonMessage updateNewsType(NewsType newsType) throws Exception {

        if(newsTypeDao.updateNewsType(newsType)){
            return new JsonMessage(true,"修改新闻类型成功");
        }
        return new JsonMessage(false,"修改新闻类型失败");
    }

    public  JsonMessage deleteNewsType(int id) throws Exception {
        if(newsDao.deleteNewsByNewsType(id)&&newsTypeDao.deleteNewsType(id))
        {
            return new JsonMessage(true,"删除成功");
        }
        return new JsonMessage(false,"删除失败");
    }

    public  JsonMessage addNewsType(NewsType newsType) throws Exception {
        if(newsTypeDao.addNewsType(newsType)){
            return new JsonMessage(true,"添加新闻类型成功");
        }
        return new JsonMessage(false,"添加新闻类型失败");
    }
}
