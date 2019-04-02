
package com.jplus.controller;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.News;
import com.jplus.service.GraduateService;
import com.jplus.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by rf on 2017/9/17.
 */
@Controller
public class IndexController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private GraduateService graduateService;
    @RequestMapping("/toIndex.do")
    public String forwardIndexUI(Model model){

            //新闻通知，首页显示7条
            JsonMessage jsonNotice = newsService.findNewsLimitByNewsType(1,7);
            //学工动态，首页显示6条
            JsonMessage jsonXueGong = newsService.findNewsLimitByNewsType(11,6);
            //学院新闻，首页显示6条
            JsonMessage jsonNews = newsService.findNewsLimitByNewsType(2,6);
            model.addAttribute("jsonNotice",jsonNotice);
            model.addAttribute("jsonXueGong",jsonXueGong);
            model.addAttribute("jsonNews",jsonNews);

            //首页轮播图
          JsonMessage carouselPicMessage =  graduateService.indexPicList();
        model.addAttribute("carouselPicMessage",carouselPicMessage);
        return "index";
    }

    /**
     *跳到后台登录首页
     */
    @RequestMapping("/toAdmin.do")
    public String toAdminIndexPage() {
        return "admin/index";
    }
}
