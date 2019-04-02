package com.jplus.service.impl;

import com.jplus.dao.TeacherTypeDao;
import com.jplus.entity.*;
import com.jplus.service.TeacherTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/17.
 */
@Service("TeacherTypeService")
public class TeacherTypeServiceImpl implements TeacherTypeService {
    @Resource
    private TeacherTypeDao teacherTypeDao;

    public JsonMessage findTeacherTypeById(int id) {
        return null;
    }

    public JsonMessage findAllTeacherType(){
        List<TeacherType> teacherTypeList = null;
        try {
            teacherTypeList = teacherTypeDao.findAllTeacherType();
        } catch (Exception e) {
            return new JsonMessage(false,"查找教师类型失败！");
        }
        if(teacherTypeList!=null&&!teacherTypeList.isEmpty()){
            return new JsonMessage(true,teacherTypeList);
        }else{
            return new JsonMessage(false,"查找教师类型失败！");
        }
    }

    public int NumZc() throws Exception {
        return 0;
    }


    public List<V_teacher> findTeacherBylx(int lx_id) {
        return null;
    }

    public JsonMessage findTeacherZc(int pageNum, int pageSize, TeacherType teacherType) {
        List<TeacherType> teacherTypes=null;
        Map<String,Object> map=new HashMap<String,Object>();
        try {
            int count =teacherTypeDao.findTeacherZCNum(teacherType);
            Page<TeacherType> teacherTypePage=new Page<TeacherType>(pageSize,pageNum,count,null);
            map.put("start",(teacherTypePage.getCurrentPage()-1)*pageSize);
            map.put("size",pageSize);
            map.put("teacherType",teacherType);
            teacherTypes=teacherTypeDao.findTeacherZC(map);
            teacherTypePage.setDataList(teacherTypes);
            return new JsonMessage(true,teacherTypePage);
        } catch (Exception e) {
            return new JsonMessage(false,"查找教师类型失败");
        }
    }

    public JsonMessage addTeacherZc(TeacherType teacherType) {
        if(teacherTypeDao.addTeacherZc(teacherType)){
            return new JsonMessage(true,"添加成功");
        }
        return new JsonMessage(false,"添加失败");
    }

    public JsonMessage updateTeacherZc(TeacherType teacherType) {
        if(teacherTypeDao.updateTeacherZc(teacherType)){
            return new JsonMessage(true,"修改成功");
        }
        return new JsonMessage(true,"修改失败");
    }

    public JsonMessage delTeacherZc(int id) {
        if(teacherTypeDao.delTeacherZc(id)){
            return new JsonMessage(true,"删除成功");
        }
        return new JsonMessage(true,"删除失败");
    }
}

