
package com.jplus.service.impl;

import com.jplus.dao.ClazzDao;
import com.jplus.dao.StudentDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Page;
import com.jplus.entity.Clazz;
import com.jplus.service.ClazzService;
import com.jplus.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/15.
 */
@Service("clazzService")
public class ClazzServiceImpl implements ClazzService {

    @Resource
    private ClazzDao clazzDao;
    @Resource
    private StudentDao studentDao;

    /**
     * 添加毕业班级(毕业班级名称做唯一校验)
     */
    public JsonMessage addClazz(Clazz clazz) {

        if(clazz==null|| StringUtil.isBlank(clazz.getName())){
            return new JsonMessage(false,"班级名称不能为空！");
        }
        if(clazz.getProname()==null){
            return new JsonMessage(false,"毕业班级专业名称不能为空！");
        }
        if(clazz.getEntrancetime()==null){
            return new JsonMessage(false,"请输入毕业班级入学时间！");
        }
        if(clazz.getBoy()== null){
            return new JsonMessage(false,"男生人数不能为空！");
        }
        if(clazz.getGirl()== null){
            return new JsonMessage(false,"女生人数不能为空！");
        }
        if(clazz.getProname()== null){
            return new JsonMessage(false,"请输入专业名称！");
        }
        Clazz Clazz1= clazzDao.findClazzByName(clazz.getName());
        if(Clazz1!=null){
            return new JsonMessage(false,"该班级名称已经存在！");
        }
        int result = clazzDao.addClazz(clazz);
        if(result != 0){
            return new JsonMessage(true,"添加毕业班级成功！");
        }else{
            return new JsonMessage(true,"添加毕业班级失败！");
        }

    }

    /**
     * 更新毕业班级
     */
    public JsonMessage updateClazz(Clazz clazz) {
        if(clazz==null|| StringUtil.isBlank(clazz.getName())){
            return new JsonMessage(false,"班级名称不能为空！");
        }
        if(StringUtil.isBlank(clazz.getProname())){
            return new JsonMessage(false,"专业名称不能为空！");
        }
//        if(StringUtil.isBlank(clazz.getEntranceDate())){
//            return new JsonMessage(false,"毕业班级入学时间不能为空！");
//        }
        if(clazz.getBoy()== null){
            return new JsonMessage(false,"班级男生人数不能为空！");
        }
        if(clazz.getBoy()== null){
            return new JsonMessage(false,"班级女生人数不能为空！");
        }
        Clazz clazz1= clazzDao.findClazzByName(clazz.getName());
        if(clazz1!=null&&clazz1.getId()!=clazz.getId()){
            return new JsonMessage(false,"该班级名称已经存在！");
        }
        int result = clazzDao.updateClazz(clazz);
        if(result != 0){
            return new JsonMessage(true,"更新毕业班级成功！");
        }else{
            return new JsonMessage(true,"更新毕业班级失败！");
        }
    }

    /**
     * 跳到更新的毕业班级页面
     */
    public JsonMessage editClazz( int id) {
        if(id==0){
            return new JsonMessage(false,"请选择要更新的毕业班级！");
        }
        Clazz Clazz = clazzDao.findClazzById(id);
        return new JsonMessage(true,Clazz);
    }

    /**
     * 查询毕业班级
     */
    public JsonMessage findAllClazz(int pageNum,int pageSize,Clazz clazz) {
        int userCount = clazzDao.getClazzCount(clazz);
        Page<Clazz> ClazzPage = new Page<Clazz>(pageSize,pageNum,userCount,null);
        Map<String,Object> param =new HashMap<String, Object>();
        param.put("start",pageSize*(ClazzPage.getCurrentPage()-1));
        param.put("size",pageSize);
        param.put("class",clazz);
        List<Clazz> ClazzList = clazzDao.findAllClazz(param);
        ClazzPage.setDataList(ClazzList);
        if(ClazzList ==null ||ClazzList.isEmpty()){
            return new JsonMessage(false,"未查到任何毕业班级！");
        }
        return new JsonMessage(true,ClazzPage);
    }

    public JsonMessage findAllClazz() {
       List<Clazz> clazzList = clazzDao.findAllClazz2();
       if(clazzList!=null && !clazzList.isEmpty()){
           return new JsonMessage(true,clazzList);
       }
        return new JsonMessage(false,"未查到任何毕业班级！");
    }

    public JsonMessage findClazzSelective(Map<String, Object> map) {
        return null;
    }

    /**
     * 根据id删除毕业班级
     */
    public JsonMessage deleteClazz( int id ) {
        if(id==0){
            return new JsonMessage(false,"请选择要删除的毕业班级！");
        }
        studentDao.deleteStuByClz(id);
        clazzDao.deleteClazz(id);
        return new JsonMessage(true,"删除毕业班级成功！");
    }

    public JsonMessage findClazzByName(String name) {
        Clazz clazz= clazzDao.findClazzByName(name);
        if(clazz!=null){
            return new JsonMessage(true,clazz);
        }
        return new JsonMessage(false,"查找班级失败！");
    }
}
