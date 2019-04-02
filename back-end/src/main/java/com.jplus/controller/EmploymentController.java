package com.jplus.controller;
import com.jplus.entity.Clazz;
import com.jplus.entity.JsonMessage;
import com.jplus.service.ClazzService;
import com.jplus.service.NewsService;
import com.jplus.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/employment")
public class EmploymentController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private ClazzService clazzService;
    private StudentService studentService;
    @RequestMapping("/front/toEmployeIndexPage.do")
    public String forwardIndexUI(Model model){

        //招聘信息，首页显示7条
        JsonMessage jsonEmploy = newsService.findNewsLimitByNewsType(21,7);
//            System.out.println(jsonNotice.getResult().toString());
//            System.out.println(jsonNotice.isSuccess());
        //通知公告，首页显示6条
        JsonMessage jsonNotice = newsService.findNewsLimitByNewsType(20,6);
        //就业指导，首页显示6条
        JsonMessage jsonWork = newsService.findNewsLimitByNewsType(22,6);
        //考研指导，首页显示6条
        JsonMessage jsonTest = newsService.findNewsLimitByNewsType(24,6);
        model.addAttribute("jsonEmploy",jsonEmploy);
        model.addAttribute("jsonNotice",jsonNotice);
        model.addAttribute("jsonWork",jsonWork);
        model.addAttribute("jsonTest",jsonTest);
        return "front/employment/employeIndex";
    }

    /**
     * 招聘模块新闻导航
     * @param pageNum
     * @param pageSize
     * @param newsType
     * @param model
     * @return
     */
    @RequestMapping("/front/employeNewTitleNav.do")
    public String findNewsPageByNewsType2(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "10")
            int pageSize, @RequestParam(defaultValue = "1") int newsType, Model model) {
        JsonMessage jsonMessage = newsService.findNewsPageByNewsType(pageNum, pageSize, newsType);
        model.addAttribute("jsonMessage", jsonMessage);
        return "front/employment/employeNewsList";
    }

    /**
     * 招聘模块根据id查找招聘新闻
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/front/findEmploymentNewsById.do")
    public String findNewsById2(@RequestParam(defaultValue = "0") int id, Model model) {
        JsonMessage jsonMessage = newsService.findNewsById(id);
        model.addAttribute("jsonMessage", jsonMessage);
        return "front/employment/employeNews";
    }

@RequestMapping("/front/toResumePage.do")
    public String toResumePage(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "15")int pageSize, Model model){
//        JsonMessage jsonClazz=clazzService.findAllClazz(pageNum,pageSize);
//    model.addAttribute(jsonClazz);
//    JsonMessage jsonMessage=studentService.findAllStudentPage(pageNum,pageSize);
//
//        if(jsonClazz.isSuccess()){
//            model.addAttribute(jsonClazz);
//        }
        return "front/employment/resume";
    }

}
