
package com.jplus.util;

import com.jplus.entity.JsonMessage;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Created by rf on 2017/8/17.
 */
public class FileDownUtil {
    public static JsonMessage downFile(String filePath, HttpServletResponse response, boolean isOnline) {
        System.out.println(filePath);
        //兼容ie浏览器
        if (filePath.contains("/")) {
            filePath = filePath.replace("/", "\\");
            System.out.println(filePath);
        }
        File file = new File(filePath);
        if (!file.exists()) {
            return new JsonMessage(false, "下载失败：文件不存在");
        }
        String fileName = null;
        if (filePath.contains("_")) {
            fileName = filePath.substring(filePath.lastIndexOf("_") + 1);
            System.out.println(fileName);
            try {
                fileName = new String(fileName.getBytes("utf-8"), "iso8859-1");
            } catch (UnsupportedEncodingException e) {
                return new JsonMessage(false, "下载失败：" + e.getMessage());
            }
        } else if (filePath.contains("\\")) {
            fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
            System.out.println(fileName);
            try {
                fileName = new String(fileName.getBytes("utf-8"), "iso8859-1");
            } catch (UnsupportedEncodingException e) {
                return new JsonMessage(false, "下载失败：" + e.getMessage());
            }
        }
        try {
            InputStream in = new BufferedInputStream(new FileInputStream(file));
            byte[] buf = new byte[1024];
            response.reset();
            response.addHeader("Content-Length", "" + file.length());
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            System.out.println("下载");
            OutputStream out = response.getOutputStream();
            int len = 0;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            in.close();
            out.close();

        } catch (Exception e) {
            return new JsonMessage(false, "下载失败：" + e.getMessage());
        }
        return new JsonMessage(true, "下载成功！");
    }
}
