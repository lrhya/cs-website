package com.jplus.controller;
import com.jplus.entity.Graduate;
import com.jplus.entity.JsonMessage;
import com.jplus.service.GraduateService;
import com.jplus.util.DateUtil;
import com.jplus.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 首页图片轮播（图片存放在graduate表中）
 */
@Controller
@RequestMapping("/graduate")
public class IndexPicController {
    @Autowired
    private GraduateService graduateService;
    /**
     * 更换首页图片轮播
     */
    @RequestMapping("/changeIndexPic.do")
    public String changeIndexPic2(Graduate graduate, Model model, HttpServletRequest request) {
        String basePath = request.getServletContext().getRealPath("/upload")+"/photo";
        JsonMessage jsonMessage2 = graduateService.changIndexPic(graduate,basePath);
        if(jsonMessage2.isSuccess()){
           String imageName = (String) jsonMessage2.getResult();
            request.setAttribute("mess","更换首页轮播图："+imageName);
        }
        model.addAttribute("result", jsonMessage2);
        return "forward:/graduate/indexPicList.do";
    }

    /**
     * 上传首页轮播图
     *
     */
    @RequestMapping("/addIndexPic.do")
    public String uploadIndexPic(Model model, String imagepath, HttpServletRequest request) {
        Graduate graduate = new Graduate();
        graduate.setId(UUIDUtil.getUUID().substring(20));
        graduate.setImagepath(imagepath);
        int start = imagepath.indexOf("_");
        int end = imagepath.lastIndexOf(".");
        graduate.setImagename(imagepath.substring(start + 1, end));
//        status=4,表示该表中数据用于首页图片轮播
        graduate.setStatus(4);
        graduate.setUptime(DateUtil.getFormatDate());
        JsonMessage addMessage = graduateService.addIndexPic(graduate);
        if (addMessage.isSuccess()) {
            request.setAttribute("mess", "添加首页轮播图片：" + graduate.getImagename());
        }
        model.addAttribute("jsonMessage", addMessage);
        return "forward:/graduate/indexPicList.do";
    }

    /**
     * 删除首页轮播图
     *
     * @param id 图片id
     */
    @RequestMapping("/deleteById.do")
    public String deleteById(String id, Model model, HttpServletRequest request) {
        String basePath = request.getServletContext().getRealPath("/upload");
        JsonMessage jsonMessage = graduateService.deleteGraduate(id, basePath);
        if (jsonMessage.isSuccess()) {
            Graduate graduate = (Graduate) jsonMessage.getResult();
            request.setAttribute("mess", "删除首页轮播图：" + graduate.getImagename());
        }
        model.addAttribute("result", jsonMessage);
        return "forward:/graduate/indexPicList.do";

    }

    /**
     * 展示首页图片轮播
     */
    @RequestMapping("/indexPicList.do")
    public String indexPicList(Model model) throws Exception {
        JsonMessage jsonMessage = graduateService.indexPicList();
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/resource/indexPicList";
    }

}
