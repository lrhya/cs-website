
package com.jplus.util;

import com.jplus.entity.JsonMessage;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by rf on 2017/8/16.
 */
public class FileUploadUtil {
    private static File getFileDir(File filePath) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMM");
        String fileName = simpleDateFormat.format(new Date());
        File fileDir = new File(filePath, fileName);
        if (!fileDir.exists()&&!fileDir.isDirectory()) {
            fileDir.mkdirs();
        }
        return fileDir;
    }

    public static JsonMessage uploadFile(HttpServletRequest request, String fileEct[], String savePath) {
        File saveDir = new File(savePath);
        if (!saveDir.exists()||!saveDir.isDirectory()) {
            saveDir.mkdirs();
        }
        String fileName = null;
        File saveFile = null;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        upload.setFileSizeMax(1024 * 1024 * 5);
        if (!ServletFileUpload.isMultipartContent(request)) {
            return new JsonMessage(false, "文件上传格式必须是enctype=multipart/form-data！");
        }
        List<FileItem> fileItems = null;
        try {
            fileItems = upload.parseRequest(request);
        } catch (FileUploadException e) {
            return new JsonMessage(false, "文件上传错误:" + e.getMessage());
        }
        for (FileItem item : fileItems) {
            if (item.isFormField()) {
                return null;
            } else {
                fileName = item.getName();
                if (fileName == null || fileName.trim().equals("")) {
                    return new JsonMessage(false, "没有选择要上传的文件！");
                }
                //兼容ie浏览器
                if (fileName.contains("\\"))
                    fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
                String fileEct2 = fileName.substring(fileName.lastIndexOf(".") + 1);
                int i = 0;
                for (i = 0; i < fileEct.length; i++) {
                    if (fileEct[i].equalsIgnoreCase(fileEct2)) {
                        break;
                    }
                }
                if (i == fileEct.length) {
                    return new JsonMessage(false, "上传文件格式错误");
                }
                fileName = UUIDUtil.getUUID().replace("-", "").substring(24) + "_" + fileName;
                File saveDir2 =getFileDir(saveDir);

                saveFile = new File(saveDir2, fileName);
//                String filePath="/"+saveDir2+"/"+saveFile;
//                System.out.println(filePath);
                try {
                    item.write(saveFile);
                    item.delete();
                } catch (Exception e) {
                    return new JsonMessage(false, "上传文件失败：" + e.getMessage());
                }
            }
        }
        System.out.println(saveFile);
        if (saveFile != null) {
            return new JsonMessage(true,saveFile.getAbsoluteFile());
        }

        return new JsonMessage(false, "上传文件失败：" );
    }

    public static boolean deleteFile(String filePath){
        if(filePath==null){
            return false;
        }
        File file = new File(filePath);
        if(file.exists()&&file.isFile()){
            return file.delete();
        }
        return false;
    }
}