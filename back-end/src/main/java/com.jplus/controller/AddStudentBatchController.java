package com.jplus.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jplus.entity.Clazz;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Student;
import com.jplus.entity.V_student;
import com.jplus.service.ClazzService;
import com.jplus.service.StudentService;
import com.jplus.util.FileUploadUtil;
import com.jplus.util.ImportExcelUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/student")
public class AddStudentBatchController {

    @Resource
    private StudentService studentService;
    @Resource
    private ClazzService clazzService;

    /**
     * 描述：通过 jquery.form.js 插件提供的ajax方式上传文件
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "addStudentBatch.do", method = {RequestMethod.GET, RequestMethod.POST})
    public void ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String fileEct[] = {"xls", "xlsx"};
        String savePath = request.getServletContext().getRealPath("/upload");
        String filePath = null;
        PrintWriter out = null;
        response.setCharacterEncoding("utf-8");  //防止ajax接受到的中文信息乱码
        out = response.getWriter();
        //上传excel文件
        JsonMessage jsonMessage = FileUploadUtil.uploadFile(request, fileEct, savePath);
        if (jsonMessage.isSuccess()) {
            filePath = jsonMessage.getResult().toString();

        } else {
            // 上传excel文件出错
            out.print("上传excel文件出错！");
            return;
        }
        System.out.println(filePath);
        //读取excel文件中内容
        List<List<Object>> listob =ImportExcelUtil.getBankListByExcel(filePath);
        //读取excel文件中内容，删除文件
        FileUploadUtil.deleteFile(filePath);

        for (List<Object> lo : listob) {
            Student stu = new Student();
            stu.setUsername(String.valueOf(lo.get(0)));
            stu.setName(String.valueOf(lo.get(1)));
            JsonMessage jsonMessage1 = clazzService.findClazzByName(String.valueOf(lo.get(2)));
            //填入的班级名可能无效
            if (jsonMessage1.isSuccess()) {
                Clazz clazz = (Clazz) jsonMessage1.getResult();
                stu.setCid(clazz.getId());
                System.out.println(clazz.getId());
                studentService.addStudent(stu);
                System.out.println("打印信息-->学号:" + stu.getUsername() + "  姓名：" + stu.getName() + "   班级：" + stu.getCid());
            }else {
                out.print("excel文件解析出错！");
                return;
            }

        }
        out.print("文件导入成功！");
        out.flush();
        out.close();
    }

}
