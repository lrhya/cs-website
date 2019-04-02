
package com.jplus.service.impl;

import com.jplus.dao.GraduateDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Page;
import com.jplus.entity.Graduate;
import com.jplus.service.GraduateService;
import com.jplus.util.FileUploadUtil;
import com.jplus.util.StringUtil;
import com.jplus.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 毕业风采展
 */
@Service("graduateService")
public class GraduateServiceImpl implements GraduateService {
    @Autowired
    private GraduateDao graduateDao;

    public JsonMessage changIndexPic(Graduate graduate,String basePath) {
        if(StringUtil.isBlank(graduate.getId())){
            return new JsonMessage(false,"更新图片不能为空！");
        }
        if(StringUtil.isBlank(graduate.getImagepath())){
            return new JsonMessage(false,"图片路径不能为空！");
        }
        //查找原来图片路径，根据路径删除图片
        Graduate graduate1 = graduateDao.findGraduateById(graduate.getId());
        if(!StringUtil.isBlank(graduate.getImagepath())){
            String photoPath=basePath+graduate1.getImagepath();
            FileUploadUtil.deleteFile(photoPath);
        }
        graduateDao.updateIndexPic(graduate);
        return new JsonMessage(true,graduate1.getImagename());
    }

    /**添加毕业风采展
     * @param graduate id,主键，自动添加，不需要添加
     * @return
     * @
     */
    public JsonMessage addGraduate(Graduate graduate, HttpServletRequest request)  {
        int result = 0;
        try {
            String fileEct[]={"jpg，jpeg"};
            String savePath=request.getSession().getServletContext().getRealPath("/graduate");
            JsonMessage jsonMessage = FileUploadUtil.uploadFile(request,fileEct,savePath);
            if(jsonMessage.isSuccess()){
                String img = (String) jsonMessage.getResult();
                graduate.setImagepath(img.substring(0,img.lastIndexOf("//")));
                graduate.setImagename(img.substring(img.lastIndexOf("//")+1));
                //
                graduate.setStatus(1);
                graduate.setImagepath((String) jsonMessage.getResult());
            }else {
                return new JsonMessage(false,jsonMessage.getResult());
            }
        } catch (Exception e) {
            return new JsonMessage(false,"发生未知错误，请联系管理员！！");
        }
        if(result !=0){
            return new JsonMessage(true,"添加毕业风采展成功");
        }else {
            return new JsonMessage(false,"添加毕业风采展失败！");
        }
    }

    /**
     * 更新毕业风采展
     *
     * @param graduate Graduate id,必须传入，指定要更新新闻id
     * @return
     * @
     */
    public JsonMessage updateGraduate(Graduate graduate)  {
        int result;
        String id = UUIDUtil.getUUID();
        graduate.setId(id);
        try {
           result = graduateDao.updateGraduate(graduate);
        } catch (Exception e) {
            return new JsonMessage(false,"发生未知错误，请联系管理员！！");
        }
        if(result !=0){
            return new JsonMessage(true,"更新毕业风采展成功");
        }else {
            return new JsonMessage(false,"更新毕业风采展失败！");
        }

    }

    /**
     * 根据id查找毕业风采展
     *
     * @return
     * @
     */
    public JsonMessage findGraduateById(String id)  {
       Graduate graduate = graduateDao.findGraduateById(id);
       if(graduate!=null){
           return new JsonMessage(true,graduate);
       }else {
           return new JsonMessage(false,"未查到任何毕业风采照！");
       }
    }

    /**
     * @param pageNum  第几页
     * @param pageSize 每页显示记录数
     * @return
     * @
     */
    public JsonMessage findAllGraduate(int pageNum, int pageSize)  {
        int totalRecord = 0;
        try {
            totalRecord = graduateDao.getGraduateCount();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, Integer> param = new HashMap<String, Integer>();
        Page<Graduate> graduatePage = new Page<Graduate>(pageSize, pageNum, totalRecord, null);
        if (pageNum > graduatePage.getTotalPage()) {
            pageNum = graduatePage.getTotalPage();
        }
        int start = (pageNum - 1) * pageSize;
        param.put("start", start);
        param.put("size", pageSize);
        List<Graduate> graduateList = null;
        try {
            graduateList = graduateDao.findAllGraduate(param);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (graduateList == null || graduateList.isEmpty()) {
            return new JsonMessage(false,"查找毕业风采展失败！");
        }
        graduatePage.setDataList(graduateList);
            return new JsonMessage(false,graduatePage);
    }

    public JsonMessage findGraduateSelective(Graduate Graduate)  {

        return new JsonMessage(false,"");
    }

    /**
     * 删除毕业风采展
     * @param id id,主键
     * @return
     */
    public JsonMessage deleteGraduate(String id,String basePath)  {
        int result;
        Graduate graduate = graduateDao.findGraduateById(id);
        try {
            FileUploadUtil.deleteFile( basePath+graduate.getImagepath());
            result = graduateDao.deleteGraduate(id);
        } catch (Exception e) {
            return new JsonMessage(false,"发生未知错误，请联系管理员！！");
        }
        if(result !=0){
            return new JsonMessage(true,graduate);
        }else {
            return new JsonMessage(false,"删除毕业风采展失败！");
        }
    }

    public JsonMessage indexPicList() {
        List<Graduate> listPic=null;
        try {
            listPic=graduateDao.indexPic();
        } catch (Exception e) {
            return  new JsonMessage(false,"查找首页图片失败");
        }
        return new JsonMessage(true,listPic);
    }

    public JsonMessage addIndexPic(Graduate graduate) {
        if(graduateDao.addIndexPic(graduate)){
            return new JsonMessage(true,"添加成功");
        }
        return new JsonMessage(false,"添加失败");
    }

    public int indexNum() {
        return graduateDao.indexNum();
    }
}
