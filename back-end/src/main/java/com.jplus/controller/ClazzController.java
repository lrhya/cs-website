//<<<<<<< HEAD
//
//package com.jplus.controller;
//import com.jplus.dao.ClazzDao;
//import com.jplus.entity.JsonMessage;
//import com.jplus.entity.Clazz;
//import com.jplus.service.ClazzService;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//
///**
// * Created by rf on 2017/9/15.
// */
//@Controller
//@RequestMapping("/clazz")
//public class ClazzController {
//    @Resource
//    private ClazzService clazzService;
//    @Resource
//    private ClazzDao clazzDao;
//    /**
//     * 添加毕业班级
//     * @param clazz 传入班级
//     * @return
//     */
//    @RequestMapping("/addClazz.do")
//    public String addClazz(Clazz clazz, Model model, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
//            int pageSize, HttpServletRequest request) {
//        JsonMessage jsonMessage = clazzService.addClazz(clazz);
//        model.addAttribute("jsonMessage", jsonMessage);
//        JsonMessage jsonClassList = clazzService.findAllClazz(pageNum,pageSize,null);
//        model.addAttribute("jsonClassList", jsonClassList);
//        if (jsonMessage.isSuccess()) {
//            request.setAttribute("mess","添加班级："+clazz.getName());
//            return "admin/view/class/classList";
//        } else {
//            model.addAttribute("Clazz", clazz);
//            return "admin/view/news/addNews";
//        }
//
//    }
//
//    /**
//     * 根据id删除毕业班级
//     * @param id
//     * @param model
//     * @return
//     */
//    @RequestMapping("deleteClazz.do")
//    public String deleteUser(int id, Model model,@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
//            int pageSize,HttpServletRequest request) {
//        Clazz clazz=clazzDao.findClazzById(id);
//        JsonMessage jsonMessage = clazzService.deleteClazz(id);
//        if(jsonMessage.isSuccess()){
//            request.setAttribute("mess","删除班级："+clazz.getName());
//        }
//        model.addAttribute("jsonMessage", jsonMessage);
//        JsonMessage jsonClassList = clazzService.findAllClazz(pageNum,pageSize,null);
//        model.addAttribute("jsonClassList", jsonClassList);
//        return "admin/view/class/classList";
//    }
//
//    /**
//     * 跳到更新毕业班级页面
//     * @param id
//     * @param model
//     * @return
//     */
//    @RequestMapping("/toEditUi.do")
//    public String toEditUi(@RequestParam(defaultValue = "0") int id, Model model) {
//        JsonMessage jsonMessage = clazzService.editClazz(id);
//        model.addAttribute("jsonMessage", jsonMessage);
//        return "admin/view/class/editClass";
//    }
//
//    /**
//     * 更新毕业班级
//     * @param clazz
//     * @param model
//     * @return
//     */
//    @RequestMapping("/updateClazz.do")
//    public String updateClazz(Clazz clazz,Model model,@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
//            int pageSize,HttpServletRequest request) {
//        JsonMessage jsonMessage = clazzService.updateClazz(clazz);
//
//        JsonMessage jsonClassList = clazzService.findAllClazz(pageNum,pageSize,null);
//        model.addAttribute("jsonMessage", jsonMessage);
//        model.addAttribute("jsonClassList", jsonClassList);
//        return "admin/view/class/classList";
//    }if(jsonMessage.isSuccess()){
//            request.setAttribute("mess","更改班级："+clazz.getName());
//        }
//
//    /**
//     * 查找毕业班级并且分页
//     * @param pageNum
//     * @param pageSize
//     * @param model
//     * @return
//     */
//    @RequestMapping("/findClazzPage.do")
//    public String findClazzPage(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
//            int pageSize,Model model,String name) {
//        JsonMessage jsonClassList = clazzService.findAllClazz(pageNum,pageSize,name);
//        model.addAttribute("jsonClassList", jsonClassList);
//        return "admin/view/class/classList";
//    }
//
//    @RequestMapping("/findClazzByName.do")
//    public String findClazzByName(Model model,String name){
//        JsonMessage jsonClassList = clazzService.findClazzByName(name);
//        model.addAttribute("jsonClassList", jsonClassList);
//        return "admin/view/class/classList";
//    }
//}
//=======

package com.jplus.controller;
import com.jplus.dao.ClazzDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Clazz;
import com.jplus.service.ClazzService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by rf on 2017/9/15.
 */
@Controller
@RequestMapping("/clazz")
public class ClazzController {
    @Resource
    private ClazzService clazzService;
    @Resource
    private ClazzDao clazzDao;
    /**
     * 添加毕业班级
     * @param clazz 传入班级
     */
    @RequestMapping("/addClazz.do")
    public String addClazz(Clazz clazz, Model model,HttpServletRequest request) {
        //设置默认值
        clazz.setEntrancetime(new Date());
        JsonMessage jsonMessage = clazzService.addClazz(clazz);
        model.addAttribute("jsonMessage", jsonMessage);
        if (jsonMessage.isSuccess()) {
            request.setAttribute("mess","添加班级："+clazz.getName());
            return "redirect:/clazz/findClazzPage.do";
        } else {
            model.addAttribute("clazz", clazz);
            return "forward:/clazz/toAddClazz.do";
        }

    }
@RequestMapping("/toAddClazz")
    public String toAddClass(){
        return "admin/view/class/addClass";
    }

    /**
     * 根据id删除毕业班级
     * @param id
     */
    @RequestMapping("deleteClazz.do")
    public String deleteUser(int id, Model model,HttpServletRequest request,@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
            int pageSize) {
        Clazz clazz = clazzDao.findClazzById(id);
        JsonMessage jsonMessage = clazzService.deleteClazz(id);
        model.addAttribute("jsonMessage", jsonMessage);
        JsonMessage jsonClassList = clazzService.findAllClazz(pageNum,pageSize,null);
        if(jsonMessage.isSuccess()){
            request.setAttribute("mess","删除班级："+clazz.getName());
        }
        model.addAttribute("jsonClassList", jsonClassList);
        return "redirect:/clazz/findClazzPage.do";
    }

    /**
     * 跳到更新毕业班级页面
     * @param id
     */
    @RequestMapping("/toEditUi.do")
    public String toEditUi(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage jsonMessage = clazzService.editClazz(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "admin/view/class/editClass";
    }

    /**
     * 更新毕业班级
     */
    @RequestMapping("/updateClazz.do")
    public String updateClazz(Clazz clazz,Model model,HttpServletRequest request)  {
        System.out.println(clazz);
        JsonMessage jsonMessage = clazzService.updateClazz(clazz);
        model.addAttribute("jsonMessage2", jsonMessage);
        if(jsonMessage.isSuccess()){
            request.setAttribute("mess","更改班级："+clazz.getName());
            return "redirect:/clazz/findClazzPage.do";
        }
        return "forward:/clazz/toEditUi.do";
    }

    /**
     * 查找毕业班级并且分页
     */
    @RequestMapping("/findClazzPage.do")
    public String findClazzPage(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
            int pageSize,Model model,Clazz clazz) {
        JsonMessage jsonClassList = clazzService.findAllClazz(pageNum,pageSize,clazz);
        model.addAttribute("jsonClassList", jsonClassList);
        model.addAttribute("className",clazz.getName());
        return "admin/view/class/classList";
    }
    @RequestMapping("/findClazzByName.do")
    public String findClazzByName(Model model,String name){
        JsonMessage jsonClassList = clazzService.findClazzByName(name);
        model.addAttribute("jsonClassList", jsonClassList);
        return "admin/view/class/classList";
    }

}

