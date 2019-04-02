
package com.jplus.service.impl;

import com.jplus.dao.NewsDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.News;
import com.jplus.entity.Page;
import com.jplus.entity.V_news;
import com.jplus.service.NewsService;
import com.jplus.util.DateUtil;
import com.jplus.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("newsService")
public class NewsServiceImpl implements NewsService {
    @Resource
    private NewsDao newsDao;

    /**
     * 添加新闻
     *
     * @param news id,主键，自动添加，不需要添加
     * @return
     */
    public JsonMessage addNews(News news) {
        int result = 0;
        if (news == null || StringUtil.isBlank(news.getTitle()))
            return new JsonMessage(false, "新闻标题不能为空！");
        if (StringUtil.isBlank(news.getContent()))
            return new JsonMessage(false, "新闻内容不能为空！！");
        news.setComposetime(DateUtil.getFormatDate());
        try {
            result = newsDao.addNews(news);
        } catch (Exception e) {
            return new JsonMessage(false, "发生未知错误，请联系管理员！！" + e.getMessage());
        }
        if (result != 0) {
            return new JsonMessage(true, "添加新闻成功！");
        } else {
            return new JsonMessage(false, "添加新闻失败，请填写完新闻基本信息！！");
        }
    }

    public JsonMessage updateNews(News news) {
        int result = 0;
        if (news == null || StringUtil.isBlank(news.getTitle()))
            return new JsonMessage(false, "新闻标题不能为空！");
        if (StringUtil.isBlank(news.getContent()))
            return new JsonMessage(false, "新闻内容不能为空！！");
        try {
            result = newsDao.updateNews(news);
        } catch (Exception e) {
            return new JsonMessage(false, "发生未知错误，请联系管理员！！");
        }
        if (result != 0) {
            return new JsonMessage(true, "更新新闻成功！");
        } else {
            return new JsonMessage(false, "更新新闻失败，请填写完新闻基本信息！");
        }
    }

    /**
     * 通过id查找新闻
     *
     * @param id
     * @return
     */
    public JsonMessage findNewsById(int id) {
        V_news news = newsDao.findNewsById(id);
        if (news != null) {
            return new JsonMessage(true, news);
        } else {
            return new JsonMessage(false, "未查到任何新闻");
        }
    }

    /**
     * 根据新闻类型，查找该新闻类型下所有新闻
     *
     * @param pageNum  第几页
     * @param pageSize 每页显示记录数
     * @param newstype
     * @return
     * @throws Exception
     */
    public JsonMessage findNewsPageByNewsType(int pageNum, int pageSize, int newstype) {
        int totalRecord = 0;
        try {
            totalRecord = newsDao.getNewsCountByNewsType(newstype);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, Integer> param = new HashMap<String, Integer>();
        Page<V_news> newsPage = new Page<V_news>(pageSize, pageNum, totalRecord, null);
        int start = (newsPage.getCurrentPage() - 1) * pageSize;
        param.put("start", start);
        param.put("size", pageSize);
        param.put("newstype", newstype);
        List<V_news> newsList = null;
        try {
            newsList = newsDao.findNewsPageByNewsType(param);
        } catch (Exception e) {
            return new JsonMessage(false, "查找新闻失败！");
        }
        if (newsList == null || newsList.isEmpty()) {
            return new JsonMessage(false, "查找新闻失败！请检查新闻条件");
        }
        newsPage.setDataList(newsList);
        return new JsonMessage(true, newsPage);

    }

    /**
     * 查找所有新闻
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    public JsonMessage findAllNewsPage(int pageNum, int pageSize) {
        int totalRecord = 0;
        try {
            totalRecord = newsDao.getNewsCount();
        } catch (Exception e) {
            return new JsonMessage(false, "查找新闻失败!");
        }
        Map<String, Integer> param = new HashMap<String, Integer>();
        int start = (pageNum - 1) * pageSize;
        param.put("start", start);
        param.put("size", pageSize);
        List<V_news> newsList = null;
        try {
            newsList = newsDao.findAllNewsPage(param);
        } catch (Exception e) {
            return new JsonMessage(false, "查找新闻失败！");
        }
        if (newsList == null || newsList.isEmpty()) {
            return new JsonMessage(false, "查找新闻失败！请检查新闻条件");
        }
        Page<V_news> newsPage = new Page<V_news>(pageSize, pageNum, totalRecord, newsList);
        return new JsonMessage(true, newsPage);
    }

    /**
     * 按条件查询新闻
     *
     * @param v_news
     * @param pageNum
     * @param pageSize
     * @return
     */
    public JsonMessage findNewsSelective(V_news v_news, int pageNum, int pageSize) {
        List<V_news> newsList = null;
        int totalRecord = 0;
        Map<String, Object> map = new HashMap<String, Object>();
        Page<V_news> newsPage = null;
        try {
            totalRecord = newsDao.getCount(v_news);
            newsPage = new Page<V_news>(pageSize, pageNum, totalRecord, null);
            int start = (newsPage.getCurrentPage() - 1) * pageSize;
            map.put("start", start);
            map.put("size", pageSize);
            map.put("v_news", v_news);
            newsList = newsDao.findNewsSelective(map);
            newsPage.setDataList(newsList);
        } catch (Exception e) {
            return new JsonMessage(false, "查找新闻失败！");
        }
        if (newsList == null || newsList.isEmpty()) {
            return new JsonMessage(false, "查找新闻失败！请检查新闻条件");
        } else {
            return new JsonMessage(true, newsPage);
        }
    }

    public JsonMessage findNewsLimitByNewsType(int newsType, int n) {
        List<V_news> newsList = null;
        Map<String, Integer> param = new HashMap<String, Integer>();
        param.put("n", n);
        param.put("newsType", newsType);
        try {
            newsList = newsDao.findNewsLimitByNewsType(param);

        } catch (Exception e) {
            return new JsonMessage(false, "查找新闻失败！");
        }
        if (newsList == null || newsList.isEmpty()) {
            return new JsonMessage(false, "查找新闻失败！请检查新闻条件");
        } else {
            return new JsonMessage(true, newsList);
        }
    }

    public JsonMessage deleteNews(int id) {
        int result = 0;
        try {
            result = newsDao.deleteNews(id);
        } catch (Exception e) {
            return new JsonMessage(false, "发生未知错误，请联系管理员！！");
        }
        if (result != 0) {
            return new JsonMessage(true, "删除新闻成功！");
        } else {
            return new JsonMessage(false, "删除新闻失败，请选择要删除新闻！");
        }
    }

    public JsonMessage batchDeleteNews(int[] newsId) {
        if (newsDao.batchDeleteNews(newsId)) {
            return new JsonMessage(true, "删除新闻成功！");
        }
        return new JsonMessage(false, "删除新闻失败，请选择要删除新闻！");
    }
}
