
package com.jplus.service.impl;

import com.jplus.dao.StaticNewsDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Page;
import com.jplus.entity.StaticNews;
import com.jplus.entity.V_user;
import com.jplus.service.StaticNewsService;
import com.jplus.util.MD5Util;
import com.jplus.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/15.
 */
@Service("staticNewsService")
public class StaticNewsServiceImpl implements StaticNewsService {
    @Resource
    private StaticNewsDao staticNewsDao;

    public JsonMessage addStaticNews(StaticNews StaticNews) {

        try {
            staticNewsDao.addStaticNews(StaticNews);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new JsonMessage(true, "添加静态新闻成功！");
    }

    public JsonMessage updateStaticNews(StaticNews StaticNews) {
        try {
            staticNewsDao.updateStaticNews(StaticNews);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public JsonMessage editStaticNews(int id) {
        if (id == 0) {
            return new JsonMessage(false, "请选择要更新的静态新闻！");
        }
        StaticNews StaticNews = staticNewsDao.findStaticNewsById(id);
        return new JsonMessage(true, StaticNews);
    }
    public JsonMessage findById(int id) {
        if (id == 0) {
            return new JsonMessage(false, "新闻id不能为空！");
        }
        StaticNews StaticNews = staticNewsDao.findStaticNewsById(id);
        return new JsonMessage(true, StaticNews);
    }

    public JsonMessage findStaticNewsByNewsType(int newsType) {
        if (newsType == 0) {
            return new JsonMessage(false, "静态新闻传入参数错误！");
        }
        StaticNews staticnews = staticNewsDao.findStaticNewsByNewsType(newsType);
        if(staticnews==null){
            return new JsonMessage(true, "未查到任何静态新闻！！");
        }else {
            return new JsonMessage(true, staticnews);
        }
    }

    public JsonMessage findAllStaticNews() {
        List<StaticNews> newsList=null;
        try {
           newsList= staticNewsDao.findAllStaticNews();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new JsonMessage(true,  newsList);
    }

    public JsonMessage findStaticNewsSelective(StaticNews user) {
        return null;
    }

    public JsonMessage deleteStaticNews(int id) {
        if (id == 0) {
            return new JsonMessage(false, "请选择要删除的静态新闻！");
        }
        StaticNews staticNews = staticNewsDao.findStaticNewsById(id);
        if(staticNews == null){
            return new JsonMessage(false, "静态新闻不存在！");
        }
        try {
            staticNewsDao.deleteStaticNews(id);
        } catch (Exception e) {
            return new JsonMessage(false, "删除静态新闻失败！"+e.getMessage());
        }
        return new JsonMessage(true, staticNews);
    }

    public JsonMessage findStaticNews(int pageNum, int pageSize, String typename) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("typename",typename);
        int count=staticNewsDao.findStaticNewsNum(map);
        Page<StaticNews> staticNewsPage=new Page<StaticNews>(pageSize,pageNum,count,null);
        map.put("start",pageSize*(staticNewsPage.getCurrentPage()-1));
        map.put("size",pageSize);
        List<StaticNews> staticNews=staticNewsDao.findStaticNews(map);
        if(staticNews!=null) {
            staticNewsPage.setDataList(staticNews);
            return new JsonMessage(true,staticNewsPage);
        }
        return new JsonMessage(false,"查找失败");
    }
}
