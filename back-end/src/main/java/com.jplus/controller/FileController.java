package com.jplus.controller;

import com.jplus.entity.FileJson;
import com.jplus.entity.JsonMessage;
import com.jplus.util.FileUploadUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by rf on 2017/10/25.
 */
@Controller()
@RequestMapping("/file")
public class FileController {
   @RequestMapping("/uploadPicture.do")
    public @ResponseBody
    FileJson uploadPicture(HttpServletRequest request, HttpServletResponse response) throws IOException {
       String fileEct[] = {"jpg", "jpeg", "gif","png"};
       String imgPath = null;
       String savePath = request.getServletContext().getRealPath("/upload");
       JsonMessage jsonMessage = FileUploadUtil.uploadFile(request, fileEct, savePath);
       if (jsonMessage.isSuccess()) {
           String path = jsonMessage.getResult().toString();
           imgPath = path.substring(path.indexOf("upload"));
           imgPath = request.getContextPath() + "/" + imgPath;
//           System.out.println(imgPath);
           String data[] = {imgPath};
           return new FileJson(0,data);

       }
       return new FileJson(1,null);
   }

    @RequestMapping("/uploadFile.do")
    public @ResponseBody
    JsonMessage uploadFile(HttpServletRequest request) {
        String savePath = request.getServletContext().getRealPath("/upload/file");
        String fileEtc[] = {"doc","docx","xlsx","xls", "jpg", "jpeg","png" };
        JsonMessage jsonMessage = FileUploadUtil.uploadFile(request, fileEtc, savePath);
        if(jsonMessage.isSuccess()){
            String path = jsonMessage.getResult().toString();
            if (path.contains("\\")){
                path=path.replaceAll("\\\\","/");
            }
            jsonMessage=new JsonMessage(true,path);
        }
        return jsonMessage;
    }

    /**
     *
     * 上传简历
     */
    @RequestMapping("/uploadResume.do")
    public @ResponseBody
    JsonMessage uploadResume(HttpServletRequest request) {
        String savePath = request.getServletContext().getRealPath("/upload/resume");
        //简历只能是word文档
        String fileEtc[] = {"docx","doc"};
        JsonMessage jsonMessage = FileUploadUtil.uploadFile(request, fileEtc, savePath);
        if(jsonMessage.isSuccess()){
            String path = jsonMessage.getResult().toString();
            if (path.contains("\\")){
                path=path.replaceAll("\\\\","/");
            }
            jsonMessage=new JsonMessage(true,path);
        }
        return jsonMessage;
    }
    @RequestMapping("/uploadPhoto.do")
    public @ResponseBody
    JsonMessage uploadPhoto(HttpServletRequest request) {
        String savePath = request.getServletContext().getRealPath("/upload/photo");
        String fileEtc[] = { "jpg", "jpeg","png"};
        JsonMessage jsonMessage = FileUploadUtil.uploadFile(request, fileEtc, savePath);
        if(jsonMessage.isSuccess()){
            String path = jsonMessage.getResult().toString();
            if (path.contains("\\")){
                path=path.replaceAll("\\\\","/");
            }
            jsonMessage=new JsonMessage(true,path);
        }
        return jsonMessage;
    }

    @RequestMapping("/downLoadFile.do")
    public @ResponseBody Object downLoad(String filePath,HttpServletRequest request) throws IOException {
        if(filePath==null){
            return new JsonMessage(false,"下载文件路径filePath路径不能为空！");
        }
        //文件下载路径
        filePath = request.getServletContext().getRealPath("/upload")+filePath;

        System.out.println(filePath);
        File file = new File(filePath);
        if(!file.exists()){
            return new JsonMessage(false,"该文件不存在或者被删除！");
        }
        HttpHeaders headers = new HttpHeaders();
        String downFilName = filePath.substring(filePath.lastIndexOf("/") + 1);
        if (downFilName.contains("_")){
            downFilName=downFilName.substring(downFilName.indexOf("_")+1);
        }
        downFilName = new String(downFilName.getBytes("UTF-8"), "iso-8859-1");
        headers.setContentDispositionFormData("attachment", downFilName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        ResponseEntity<byte[]> responseEntity=new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers,
                HttpStatus.CREATED);
        return responseEntity;
    }


}
