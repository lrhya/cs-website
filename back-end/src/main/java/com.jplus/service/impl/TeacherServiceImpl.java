
package com.jplus.service.impl;

import com.jplus.dao.TeacherDao;
import com.jplus.dao.TeacherTypeDao;
import com.jplus.entity.*;
import com.jplus.service.TeacherService;
import com.jplus.util.StringUtil;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/15.
 */
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {
    @Resource
    private TeacherDao teacherDao;
    @Resource
    private TeacherTypeDao teacherTypeDao;

    /**
     * 教师姓名做唯一校验
     * @param teacher
     * @return
     */
    public JsonMessage addTeacher(Teacher teacher) {

        if(teacher==null|| StringUtil.isBlank(teacher.getName())){
            return new JsonMessage(false,"教师姓名不能为空！");
        }
        if(teacher.getZhichenghao()==0){
            return new JsonMessage(false,"请选择教师职称！");
        }
//        if(teacher.getJslx()==null){
//            return new JsonMessage(false,"请选择教师类型！");
//        }
//        Teacher teacher1=teacherDao.findTeacherByName(teacher.getName());
//        if(teacher1!=null){
//            return new JsonMessage(false,"该教师姓名已经有人使用！");
//        }
        int result = teacherDao.addTeacher(teacher);
        if(result != 0){
            return new JsonMessage(true,"添加教师成功！");
        }else{
            return new JsonMessage(false,"添加教师失败！");
        }

    }

    public JsonMessage updateTeacher(Teacher teacher) {
        if(teacher==null|| StringUtil.isBlank(teacher.getName())){
            return new JsonMessage(false,"教师姓名不能为空！");
        }
        if(teacher.getZhichenghao()==0){
            return new JsonMessage(false,"请选择教师职称！");
        }
        if(teacher.getJslx()==0){
            return new JsonMessage(false,"请选择教师类型！");
        }
//        Teacher teacher1=teacherDao.findTeacherByName(teacher.getName());
//        if(teacher1!=null&&!teacher1.getName().equals(teacher.getName())){
//            return new JsonMessage(false,"该教师姓名已经有人使用！");
//        }
        int result = teacherDao.updateTeacher(teacher);
        if(result != 0){
            return new JsonMessage(true,"更新教师成功！");
        }else{
            return new JsonMessage(false,"更新教师失败！");
        }
    }


    public JsonMessage editTeacher( int id) {
        if(id==0){
            return new JsonMessage(false,"请选择要更新的教师！");
        }
        V_teacher teacher = teacherDao.findTeacherById(id);
        if(teacher==null){
            return new JsonMessage(false,"未查到任何老师");
        }else{
            return new JsonMessage(true,teacher);
        }
    }


    public JsonMessage findTeacherById( int id) {
        if(id==0){
            return new JsonMessage(false,"请选择要查找的教师！");
        }
        V_teacher teacher = teacherDao.findTeacherById(id);
        if(teacher==null){
            return new JsonMessage(false,"未查到任何老师");
        }else{
            return new JsonMessage(true,teacher);
        }

    }

    public JsonMessage findAllTeacher(int pageNum,int pageSize,V_teacher v_teacher) {
        List<V_teacher> teacherList=null;
        int teacherCount = 0;
        try {
            teacherCount = teacherDao.findAllTeacherNum(v_teacher);
            Page<V_teacher> teacherPage = new Page<V_teacher>(pageSize,pageNum,teacherCount,null);
            Map<String,Object> param =new HashMap<String, Object>();
            param.put("start",pageSize*(teacherPage.getCurrentPage()-1));
            param.put("size",pageSize);
            param.put("v_teacher",v_teacher);
            teacherList = teacherDao.findAllTeacher(param);
            teacherPage.setDataList(teacherList);
            return new JsonMessage(true,teacherPage);
        } catch (Exception e) {
            return new JsonMessage(false,"未查到任何教师！");
        }

    }

    public JsonMessage findTeacherSelective(Teacher user) {
        return null;
    }

    public JsonMessage deleteTeacher( int id) {
        if(id==0){
            return new JsonMessage(false,"请选择要删除的教师！");
        }
        int result=teacherDao.deleteTeacher(id);
        return new JsonMessage(true,"删除教师成功！");
    }


    public Map<String,List<V_teacher>> findTeacherByZc(int lx_id) {
       Map<String,List<V_teacher>> map=new HashMap <String, List<V_teacher>>();
       int i=teacherTypeDao.NumZc();
        for(int j=1;j<=i;j++){
           List<V_teacher> teacherList=teacherDao.findTeacherByZC(j,lx_id);
           if(teacherList==null||teacherList.isEmpty()){
               continue;
           }
            TeacherType teacherType=teacherTypeDao.findTeacherTypeById(j);
            map.put(teacherType.getZhicheng(),teacherList);
       }
       return map;
   }

    public TeacherType findTeacherTypeById(int id) {
        return null;
    }
}
