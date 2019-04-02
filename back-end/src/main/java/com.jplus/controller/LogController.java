package com.jplus.controller;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Log;
import com.jplus.service.LogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
@RequestMapping("/log")
public class LogController {
    @Resource
    private LogService logService;

    @RequestMapping("/findLog")
    public String findAllLog(Model model,Log log, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "8")
            int pageSize) {
        JsonMessage jsonMessage = logService.findAllLog(pageNum, pageSize, log);
        model.addAttribute("jsonMessage", jsonMessage);
        model.addAttribute("log", log);
        return "admin/view/log/logList";
    }

    @RequestMapping("/delete")
    public String delete(int id, Model model) {
        JsonMessage jsonMessage = logService.deleteLog(id);
        model.addAttribute("Message", jsonMessage);
        return "redirect:/log/findLog.do";
    }

    @RequestMapping("/batchDelete")
    public String batchDelete(Model model, int[] logId) {
        JsonMessage jsonMessage = logService.batchDelete(logId);
        model.addAttribute("Message", jsonMessage);
        return "redirect:/log/findLog.do";
    }

}
