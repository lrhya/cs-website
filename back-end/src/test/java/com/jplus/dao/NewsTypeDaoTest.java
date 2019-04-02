package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.NewsType;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NewsTypeDaoTest extends SpringTestBase {

    @Resource
    private NewsTypeDao newsTypeDao;

    @Test
    public void findNewsTypeLimit()throws Exception{

        NewsType newsType=new NewsType();
        Map<String,Integer> map=new HashMap<String, Integer>();
        map.put("start",0);
        map.put("size",5);
        List<NewsType>newsTypes=newsTypeDao.findNewsTypeLimit(map);
        System.out.println(newsTypes);
    }
    @Test
    public void addnewsTypes()throws Exception{
        NewsType newsType=new NewsType();
        newsType.setTypename("hhhhhh");
        System.out.println(newsTypeDao.addNewsType(newsType));
    }
}

