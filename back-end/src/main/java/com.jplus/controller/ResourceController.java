
package com.jplus.controller;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Resource;
import com.jplus.service.NewsTypeService;
import com.jplus.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by rf on 2017/9/16.
 */
@Controller
@RequestMapping("/resource")
public class ResourceController {
    @Autowired
    private ResourceService resourceService;
    @Autowired
    private NewsTypeService newsTypeService;

    /**
     * 前台资源下载列表
     * @param pageNum 第几页
     * @param pageSize 每页显示数目
     * @param resource 资源
     */
    @RequestMapping("/front/resourceNav.do")
    public String findResourcePage2(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8") int pageSize,Resource resource, Model model) {
//        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
//        model.addAttribute("newsTypesJson", newsTypesJson);
        resource.setIspost(1);
        JsonMessage jsonMessage = resourceService.findAllResource(pageNum, pageSize,resource);
        model.addAttribute("jsonMessage", jsonMessage);
        return "front/view/resourceList";
    }

    /**
     * 跳转到后台添加资源页面
     */
    @RequestMapping("/toAddResourceUi.do")
    public String toAddResourceUi(Model model) {
        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
        model.addAttribute("newsTypesJson", newsTypesJson);
        return "admin/view/resource/addResource";
    }

    /**
     * 跳转到后台编辑资源页面
     */
    @RequestMapping("/toEditResourceUi.do")
    public String toEditResourceUi(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
        model.addAttribute("newsTypesJson", newsTypesJson);
        JsonMessage jsonMessage = resourceService.findResourceById(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/resource/editResource";
    }

    /**
     * 添加普通资源文件
     *
     */
    @RequestMapping("/addCommonResource.do")
    public String addCommonResource(Resource resource, HttpServletRequest request, Model model) {
        JsonMessage jsonMessage = resourceService.addResource(resource);
        model.addAttribute("jsonMessage", jsonMessage);
        if (jsonMessage.isSuccess()) {
            String fileName = resource.getFilename().substring(resource.getFilename().lastIndexOf("/")+1);
            request.setAttribute("mess","添加资源："+fileName);
            return "redirect:/resource/findResourcePage.do";
        } else {
            //错误时信息回现
            model.addAttribute("jsonMessage", jsonMessage);
            return "forward:/resource/toAddResourceUi.do";
        }
    }

//    /**
//     * 添加首页轮播图片
//     * 要求post提交，上传文件格式
//     *
//     * @param resource 资源
//     */
//    @RequestMapping("/addIndexPicture.do")
//    public String addIndexPicture(Resource resource, HttpServletRequest request, Model model) {
//        JsonMessage jsonMessage = resourceService.addResource(resource);
//        model.addAttribute("jsonMessage", jsonMessage);
//        if (jsonMessage.isSuccess()) {
//            request.setAttribute("mess","添加首页图片："+resource.getFilename());
//            return "test/message";
//        } else {
//            //错误时信息回现
//            model.addAttribute("jsonMessage", jsonMessage);
//            return "test/add";
//        }
//    }

    /**
     * 查找资源文件
     *
     * @param pageNum 第几页
     * @param pageSize 每页显示数目
     */
    @RequestMapping("/findResourcePage.do")
    public String findResourcePage(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8") int pageSize,Resource resource, Model model) {
        JsonMessage newsTypesJson = newsTypeService.findAllNewsType();
        model.addAttribute("newsTypesJson", newsTypesJson);
        JsonMessage jsonMessage = resourceService.findAllResource(pageNum, pageSize,resource);
        model.addAttribute("jsonMessage", jsonMessage);
        model.addAttribute("resource",resource);
        return "admin/view/resource/resourceList";
    }

    @RequestMapping("/updateResource.do")
    public String updateResource(Resource resource, Model model,HttpServletRequest request) {
        String basePath=request.getServletContext().getRealPath("/upload")+"/file";
        JsonMessage jsonMessage = resourceService.updateResource(resource,basePath);
        model.addAttribute("jsonMessage", jsonMessage);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess","更新资源："+resource.getFilename());
            return "redirect:/resource/findResourcePage.do";
        } else {
            model.addAttribute("resource", resource);
            return "forward:/resource/toEditResourceUi.do";

        }
    }

    /**
     *资源文件是否展示
     */
    @RequestMapping("/isShow.do")
    public String show(@RequestParam(defaultValue = "1") int isShow,@RequestParam(defaultValue = "0") int id,Resource Resource,Model model) {
        Resource resource=new Resource();
        resource.setId(id);
        resource.setIspost(isShow);
       JsonMessage jsonMessage = resourceService.isShow(resource);
       if(jsonMessage.isSuccess()){
           model.addAttribute("mess","更改资源："+resource.getFilename());
       }
       model.addAttribute("jsonMessage",jsonMessage);
        return "forward:/resource/findResourcePage.do?resource"+resource;
    }

    /**
     * 删除资源文件
     * @param id 资源id
     *
     */
    @RequestMapping("/deleteById.do")
    public String deleteById(@RequestParam(defaultValue = "0") int id, Model model,HttpServletRequest request) {
        String basePath = request.getServletContext().getRealPath("/upload");

        JsonMessage jsonMessage = resourceService.deleteResource(id,basePath);
        if(jsonMessage.isSuccess()){
          Resource resource = (Resource) jsonMessage.getResult();
            request.setAttribute("mess","删除资源："+resource.getFilename());
        }
        model.addAttribute("jsonMessage", jsonMessage);
        return "redirect:/resource/findResourcePage.do";
    }
}
