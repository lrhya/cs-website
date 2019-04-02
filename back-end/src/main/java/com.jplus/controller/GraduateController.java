package com.jplus.controller;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Page;
import com.jplus.entity.Graduate;
import com.jplus.service.GraduateService;
import com.jplus.util.DateUtil;
import com.jplus.util.FileUploadUtil;
import com.jplus.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 毕业风采照未开发,用于存放首页图片轮播
 */
@Controller
@RequestMapping("/graduate")
public class GraduateController {
    @Autowired
    private GraduateService graduateService;
    /**
     * 添加毕业风采展示图片
     *
     * @param graduate
     * @return
     */
    @RequestMapping("/addGraduate.do")
    public String addGraduate(Graduate graduate, HttpServletRequest request, Model model) {
        JsonMessage jsonMessage = graduateService.addGraduate(graduate, request);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("result", jsonMessage);
            return "admin";
        } else {
            model.addAttribute("result", jsonMessage);
            return "test/add";
        }


    }




    /**
     * 查找毕业风采展示图片
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/findGraduatePage.do")
    public String findGraduatePage(int pageNum, int pageSize, Model model) {
        graduateService.findAllGraduate(pageNum, pageSize);
        return "";
    }


    @RequestMapping("/updateGraduate.do")
    public String updateGraduate(Graduate graduate, Model model) {
        JsonMessage jsonMessage = graduateService.updateGraduate(graduate);
        model.addAttribute("result", jsonMessage);
        return "";
    }


}

