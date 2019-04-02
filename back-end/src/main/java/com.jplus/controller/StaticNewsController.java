
package com.jplus.controller;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.StaticNews;
import com.jplus.service.StaticNewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * Created by rf on 2017/9/15.
 */
@Controller
@RequestMapping("/staticNews")
public class StaticNewsController {
    @Resource
    private StaticNewsService staticNewsService;

    /**
     * 添加静态新闻
     * @param StaticNews 传入
     */
    @RequestMapping("addStaticNews.do")
    public String addStaticNews(StaticNews StaticNews, Model model) {
        JsonMessage jsonMessage = staticNewsService.addStaticNews(StaticNews);
        model.addAttribute("jsonMessage", jsonMessage);
        if (jsonMessage.isSuccess()) {
            return "";
        } else {
            model.addAttribute("StaticNews", StaticNews);
            return "";
        }

    }

    /**
     *删除静态新闻
     * @param id 新闻id
     */
    @RequestMapping("deleteNews.do")
    public String deleteNews(int id, Model model) {
        JsonMessage jsonMessage = staticNewsService.deleteStaticNews(id);
        if(jsonMessage.isSuccess()){
           StaticNews staticNews = (StaticNews) jsonMessage.getResult();
            model.addAttribute("mess","删除静态新闻"+staticNews.getTypename());
        }
        model.addAttribute("Message", jsonMessage);
        return "redirect:/staticNews/findStaticNews.do";
    }

    /**
     *编辑静态新闻
     */
    @RequestMapping("/toEditUi.do")
    public String toEditUi(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage jsonMessage = staticNewsService.editStaticNews(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/staticNews/editStaticNews";
    }
    @RequestMapping("/findById.do")
    public String findStaticNewsById(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage jsonMessage = staticNewsService.findById(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "front/view/news";
    }
    /**
     * 通过新闻类型，查找静态新闻
     */
    @RequestMapping("/front/findStaticNewsByNewsType.do")
    public String findStaticNewsByNewsType(@RequestParam(defaultValue = "1") int newsType, Model model) {
        JsonMessage jsonMessage = staticNewsService.findStaticNewsByNewsType(newsType);
        model.addAttribute("jsonMessage", jsonMessage);
        return "front/view/staticNews";
    }

    /**
     *更改静态新闻
     */
    @RequestMapping("/updateStaticNews.do")
    public String updateStaticNews(StaticNews staticNews,Model model) {
        JsonMessage jsonMessage = staticNewsService.updateStaticNews(staticNews);
        if(jsonMessage.isSuccess()){
            model.addAttribute("mess","删除静态新闻"+staticNews.getTypename());
        }
        model.addAttribute("Message", jsonMessage);
        return "redirect:/staticNews/findStaticNews.do";
    }

    /**
     *查找静态新闻
     */
    @RequestMapping("/findStaticNewsPage.do")
    public String findStaticNewsPage(Model model) {
        JsonMessage jsonMessage = staticNewsService.findAllStaticNews();
        model.addAttribute("jsonMessage", jsonMessage);
        return "";
    }
    /**
     *查找静态新闻
     */
    @RequestMapping("/findStaticNews")
    public String findStaticNews(Model model,@RequestParam(defaultValue = "1") int pageNum,@RequestParam(defaultValue = "8") int pageSize,String typename) {
        JsonMessage jsonMessage=staticNewsService.findStaticNews(pageNum,pageSize,typename);
        model.addAttribute("typename",typename);
        model.addAttribute("jsonMessage",jsonMessage);
        return "admin/view/staticNews/staticNewsList";
    }

}
