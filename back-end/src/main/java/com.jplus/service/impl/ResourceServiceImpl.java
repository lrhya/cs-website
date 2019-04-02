
package com.jplus.service.impl;

import com.jplus.dao.ResourceDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Resource;
import com.jplus.entity.Page;
import com.jplus.entity.V_resource;
import com.jplus.service.ResourceService;
import com.jplus.util.DateUtil;
import com.jplus.util.FileUploadUtil;
import com.jplus.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/16.
 */
@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {
    @Autowired
    private ResourceDao resourceDao;

    /**
     * @param resource id,主键，自动添加，不需要添加
     * @return
     */
    public JsonMessage addResource(Resource resource) {
        int result = 0;
        resource.setCompostime(DateUtil.getFormatDate());
        //默认添加资源展示
        resource.setIspost(1);
        if (StringUtil.isBlank(resource.getFilename())) {
            return new JsonMessage(false, "请选择要上传的文件！！");
        }
        if (resource.getLb() == null || resource.getLb() == 0) {
            return new JsonMessage(false, "请选择资源所在新闻类别！！");
        }
        try {
            result = resourceDao.addResource(resource);
        } catch (Exception e) {
            return new JsonMessage(false, "添加资源失败，出现未知错误！！");
        }
        if (result != 0) {
            return new JsonMessage(true, "添加资源成功！");
        } else {
            return new JsonMessage(false, "添加资源失败，请填写完资源基本信息！！");
        }
    }

    /**
     * 更新资源
     * @param resource Resource id,必须传入，指定要更新资源id
     */
    public JsonMessage updateResource(Resource resource,String basePath) {
        if (resource.getId() == null) {
            return new JsonMessage(false, "请选择要更新的资源！");
        }
        int result = 0;
        //查找以前资源文件路径，根据路径删除文件
       Resource resource1 = resourceDao.findResourceById(resource.getId());
       if(!StringUtil.isBlank(resource.getFilePath())){
           String resourcePath=basePath+resource1.getFilePath();
           FileUploadUtil.deleteFile(resourcePath);
       }
        try {
            result = resourceDao.updateResource(resource);
        } catch (Exception e) {
            return new JsonMessage(false, "更新资源文件失败！");
        }
        if (result != 0) {
            return new JsonMessage(true, "更新资源文件成功！");
        } else {
            return new JsonMessage(false, "更新资源文件失败！");
        }
    }

    /**
     * 查找资源文件
     * @param id 资源id
     */
    public JsonMessage findResourceById(int id) {
        Resource resource = resourceDao.findResourceById(id);
        if (resource != null) {
            return new JsonMessage(true, resource);
        } else {
            return new JsonMessage(false, "查找资源文件失败！");
        }
    }

    /**
     * @param pageNum  第几页
     * @param pageSize 每页显示记录数
     * @
     * @
     */
    public JsonMessage findAllResource(int pageNum, int pageSize, Resource resource) {
        int totalRecord = 0;
        try {
            totalRecord = resourceDao.getResourceCount(resource);
        } catch (Exception e) {
            return new JsonMessage(false, "发生未知错误，请联系管理员！！");
        }
        Map<String, Object> param = new HashMap<String, Object>();
        Page<V_resource> resourcePage = new Page<V_resource>(pageSize, pageNum, totalRecord, null);
        if (pageNum > resourcePage.getTotalPage()) {
            pageNum = resourcePage.getTotalPage();
        }
        if (pageNum < 1) {
            pageNum = 0;
        }
        resourcePage.setCurrentPage(pageNum);
        int start = (pageNum - 1) * pageSize;
        param.put("start", start);
        param.put("size", pageSize);
        param.put("resource", resource);
        List<V_resource> resourceList = null;
        try {
            resourceList = resourceDao.findAllResource(param);
        } catch (Exception e) {
            return new JsonMessage(false, "发生未知错误，请联系管理员！！");
        }
        if (resourceList == null || resourceList.isEmpty()) {
            return new JsonMessage(false, "查找资源文件失败！");
        }
        resourcePage.setDataList(resourceList);
        return new JsonMessage(true, resourcePage);
    }

    public JsonMessage isShow(Resource resource) {
        if (resource.getId() == null) {
            return new JsonMessage(false, "请选择要更改的资源！");
        }
        resourceDao.isShow(resource);
        return new JsonMessage(true, "更新资源文件成功！");
    }

    public JsonMessage findResourceSelective(Resource Resource) {
        return null;
    }

    public JsonMessage deleteResource(int id,String basePath) {
        int result = 0;
        Resource resource;
        try {
            resource = resourceDao.findResourceById(id);
            String path =resource.getFilePath();
            if(!path.startsWith("/")){
                path="/"+path;
            }
            String filePath = basePath+path;
          FileUploadUtil.deleteFile(filePath);
               result = resourceDao.deleteResource(id);
        } catch (Exception e) {
            return new JsonMessage(false, "发生未知错误，请联系管理员！！"+e.getMessage());
        }
        if (result != 0) {
            return new JsonMessage(true, resource);
        } else {
            return new JsonMessage(false, "删除资源文件失败！");
        }
    }
}
