
package com.jplus.dao;

import base.SpringTestBase;
import com.jplus.entity.News;
import com.jplus.entity.V_news;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/16.
 */
public class NewsDaoTest extends SpringTestBase {
    @Resource
    private NewsDao newsDao;

   @Test
    public void findNewsSelective() throws Exception {
        Map<String,Object> param=new HashMap<String, Object>();
       V_news news=new V_news();
        news.setTitle("hl");
        news.setNewstype(1);
        param.put("news",news);
        param.put("start",1);
        param.put("size",4);
        List<V_news> newsList = newsDao.findNewsSelective(param);
        System.out.println(newsList);
    }

    @Test
    public void getNewsCountByNewsType() throws Exception {
        int count = newsDao.getNewsCountByNewsType(1);
        System.out.println(count);
    }

    @Test
    public void getNewsCount() throws Exception {
        int n = newsDao.getNewsCount();
        System.out.println(n);
    }



    @Test
    public void findNewsLimitByNewsType() throws Exception {
        Map<String,Integer> param = new HashMap<String, Integer>();
        param.put("newsType",1);
        param.put("n",7);
        List<V_news> newsList =newsDao.findNewsLimitByNewsType(param);
        System.out.println(newsList.get(0).getTypename());
    }


    @Test
    public void findNewsPageByNewsType() throws Exception {
        Map<String,Integer> param=new HashMap<String, Integer>();
        param.put("newstype",1);
        param.put("start",5);
        param.put("size",6);
        List<V_news> newsList = newsDao.findNewsPageByNewsType(param);
        System.out.println(newsList);
    }
    @Test
    public void findAllNewsPage() throws Exception {
        Map<String,Integer> param=new HashMap<String, Integer>();
        param.put("start",5);
        param.put("size",6);
        List<V_news> newsList = newsDao.findAllNewsPage(param);
        System.out.println(newsList);
        System.out.println(newsList.get(0).getTypename());
    }

    @Test
    public void addNews() throws Exception {
        News news=new News(1,"test","content","20151130",1,0);
        newsDao.addNews(news);
    }

    @Test
    public void updateNews() throws Exception {
        News news=new News(1,"test","content2","20151130",1,0);
        newsDao.updateNews(news);
    }

    @Test
    public void findNewsById() throws Exception {
        V_news  news = newsDao.findNewsById(808);
        System.out.println(news.getTitle());
    }

    @Test
    public void deleteNews() throws Exception {
        newsDao.deleteNews(808);
    }

   @Test
    public void getCount() throws  Exception{
       V_news news=new V_news();
        news.setNewstype(1);
        news.setTitle("hl");

        System.out.println(newsDao.getCount(news));
    }
}

