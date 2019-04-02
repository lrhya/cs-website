
package com.jplus.controller;

import com.jplus.dao.NewsDao;
import com.jplus.dao.NewsTypeDao;
import com.jplus.entity.*;
import com.jplus.service.NewsService;
import com.jplus.service.NewsTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Resource
    private NewsService newsService;
    @Resource
    private NewsTypeService newsTypeService;
    @Resource
    private NewsDao newsDao;
    @Resource
    private NewsTypeDao newsTypeDao;

    /**
     * 前台新闻导航栏
     *
     * @param pageNum  第几页
     * @param pageSize 每页显示几条记录
     * @param newsType 新闻类型
     * @param model    存放数据
     * @return 跳转页面
     */
    @RequestMapping("/front/newTitleNav.do")
    public String findNewsPageByNewsType1(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "10")
            int pageSize, @RequestParam(defaultValue = "1") int newsType, Model model) {
        JsonMessage jsonMessage = newsService.findNewsPageByNewsType(pageNum, pageSize, newsType);
        model.addAttribute("jsonMessage", jsonMessage);
        return "front/view/newNav";
    }
    /**
     * 前台根据id查找新闻
     *
     * @param id 新闻id
     * @return string指向新闻列表视图
     */
    @RequestMapping("/front/findNewsById.do")
    public String findNewsById(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage jsonMessage = newsService.findNewsById(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "front/view/news";
    }


    /**
     * 根据新闻类型，查找新闻,并且分页,用于首页，点击更多响应
     *
     * @param pageNum  第几页
     * @param pageSize 每页显示新闻数目
     * @param newsType 新闻类型
     * @return string指向新闻列表视图
     */
    @RequestMapping("/front/findNewsPageByNewsType.do")
    public String findNewsPageByNewsType(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "10")
            int pageSize, @RequestParam(defaultValue = "1") int newsType, Model model) {
        JsonMessage jsonMessage = newsService.findNewsPageByNewsType(pageNum, pageSize, newsType);
        model.addAttribute("jsonMessage", jsonMessage);
        return "front/view/newNav";
    }




    /**
     * 跳转到后台添加新闻页面
     *
     */
    @RequestMapping("/toAddNewsPage.do")
    public String toAddNewsPage(Model model) {
        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
        model.addAttribute("newsTypesJson", newsTypesJson);
        return "admin/view/news/addNews";

    }

    /**
     * 跳到后台编辑新闻页面
     *
     * @param id    新闻id
     * @param model 存放数据
     */
    @RequestMapping("/toEditNewsPage.do")
    public String toEditNewsPage(int id, Model model) {
        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
        model.addAttribute("newsTypesJson", newsTypesJson);
        JsonMessage jsonMessage = newsService.findNewsById(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/news/editNews";

    }

    /**
     * 添加新闻
     *
     * @param news 新闻页面，新闻相关数据
     * @return string指向新闻列表视图
     */
    @RequestMapping("/addNews.do")
    public String addNews(News news, Model model, HttpServletRequest request) {
        System.out.println(news.getTitle());
        JsonMessage jsonMessage = newsService.addNews(news);
        model.addAttribute("jsonMessage", jsonMessage);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "添加新闻：" + news.getTitle());
            model.addAttribute("news", news);
            return "redirect:/news/newsList.do";
        } else {
            return "forward:/news/toAddNewsPage.do";
        }

    }


    /**
     * 查找所有新闻,并且分页
     *
     * @param pageNum  第几页
     * @param pageSize 每页显示新闻数目
     * @param model    类似request域，用于存放页面数据
     * @return string指向新闻列表视图
     */
    @RequestMapping("/findAllNewsPage.do")
    public String findAllNewsPage(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "10")
            int pageSize, Model model) {
        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
        model.addAttribute("newsTypesJson", newsTypesJson);
        JsonMessage jsonMessage = newsService.findAllNewsPage(pageNum, pageSize);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/news/newsList";
    }



    @RequestMapping("/findNewsById.do")
    public String adminFindNewsById(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage jsonMessage = newsService.findNewsById(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/news/newsDetail";
    }
    /**
     * 更新新闻前骤
     *
     */
    @RequestMapping("/updateNewsPre")
    public String updateNewsPre(int id, Model model) {

        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
        model.addAttribute("newsTypesJson", newsTypesJson);
        JsonMessage jsonMessage = newsService.findNewsById(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/modifyNews";
    }

    /**
     * 更新新闻
     *
     * @param news  新闻页面，新闻相关数据
     * @param model 类似request域，用于存放页面数据
     * @return string指向新闻列表视图
     */
    @RequestMapping("/updateNews.do")
    public String updateNews(News news, Model model, HttpServletRequest request) {
        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
        model.addAttribute("newsTypesJson", newsTypesJson);
        JsonMessage jsonMessage = newsService.updateNews(news);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "更改新闻：" + news.getTitle());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/news/newsList.do";
    }

    /**
     * 根据新闻id，删除新闻
     *
     * @param id 新闻id
     * @return string指向新闻列表视图
     */
    @RequestMapping("/deleteNews.do")
    public String deleteById(@RequestParam(defaultValue = "-1") int id, Model model, HttpServletRequest request,
         Integer newsType,String title) {
        V_news news = newsDao.findNewsById(id);
        JsonMessage jsonMessage1 = newsService.deleteNews(id);
        if (jsonMessage1.isSuccess()) {
            request.setAttribute("mess", "删除新闻：" + news.getTitle());
        }
        model.addAttribute("jsonMessage1", jsonMessage1);
        System.out.println("redirect:/news/newsList.do?title="+title+"&newsType="+newsType);
        return "redirect:/news/newsList.do?title="+title+"&newstype="+newsType;
    }

    /**
     * 批量删除新闻
     */
    @RequestMapping("/batchDeleteNews.do")
    public String batchDeleteNews(Model model, int[] newsId,
         HttpServletRequest request,Integer newstype,String title) {
        JsonMessage jsonMessage = newsService.batchDeleteNews(newsId);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "批量删除新闻...");
        }
        model.addAttribute("jsonMessage", jsonMessage);
        request.setAttribute("title",title);
        return "redirect:/news/newsList.do?title="+title+"&newstype="+newstype;
    }
    /**
     * 批量删除新闻
     */
    @RequestMapping("/batchDeleteNews2.do")
    public String batchDeleteNews2(Model model, int[] newsId,
                                  HttpServletRequest request,News news) {
        JsonMessage jsonMessage = newsService.batchDeleteNews(newsId);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "批量删除新闻...");
        }
        model.addAttribute("jsonMessage", jsonMessage);
        model.addAttribute(" news", news);
        return "forward:/news/newsList.do";
    }

    /**
     * 按条件查询新闻
     *
     * @param news
     * @param pageNum  第几页
     * @param pageSize 每页显示数目
     */
    @RequestMapping("/newsList.do")
    public String findNewsByCondition(V_news news, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8") int pageSize
            , Model model){
        System.out.println("000000000000000");
        System.out.println(news.getTitle()+"kkkkkkk"+news.getNewstype());
        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
        model.addAttribute("newsTypesJson", newsTypesJson);
        JsonMessage jsonMessage = newsService.findNewsSelective(news, pageNum, pageSize);
        model.addAttribute("news", news);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/news/newsList";
    }

    /**
     * 分页查询新闻类别
     *
     * @param pageNum  第几页
     * @param pageSize 每页显示记录数
     */
    @RequestMapping("/newsTypePage")
    public String findNewsTypelimit(Model model, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8") int pageSize) {
        JsonMessage newsTypesJson = newsTypeService.findNewsTypelimit(pageNum, pageSize);
        model.addAttribute("newsTypesJson", newsTypesJson);
        return "admin/view/news/newsType";
    }

    /**
     * 添加新闻类别
     *
     * @param newsType 新闻类型
     */
    @RequestMapping("/addNewstype")
    public String addNewsType(NewsType newsType, Model model, HttpServletRequest request) throws Exception {
        JsonMessage jsonMessage = newsTypeService.addNewsType(newsType);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "添加新闻类型：" + newsType.getTypename());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/news/newsType";
    }

    /**
     * 修改新闻类别
     */
    @RequestMapping("/editNewstype")
    public String editNewsType(NewsType newsType, Model model, HttpServletRequest request) throws Exception {
        JsonMessage jsonMessage = newsTypeService.updateNewsType(newsType);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "修改新闻类型：" + newsType.getTypename());
        }
        return "redirect:/news/newsTypePage.do";
    }

    /**
     * 删除新闻类别
     */
    @RequestMapping("/deleteNewstype")
    public String deleteNewsType(int id, Model model, HttpServletRequest request) throws Exception {
        NewsType newsType = newsTypeDao.findNewsTypeById(id);
        JsonMessage jsonMessage = newsTypeService.deleteNewsType(id);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess", "删除新闻类型：" + newsType.getTypename());
        }
        return "redirect:/news/newsTypePage.do";
    }

}
