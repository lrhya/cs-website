package com.jplus.service.impl;

import com.jplus.dao.JslxDao;
import com.jplus.entity.Jslx;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Page;
import com.jplus.entity.V_teacher;
import com.jplus.service.JslxService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2017/9/17.
 */
@Service("jslxService")
public class JslxServiceImpl implements JslxService {
    @Resource
    private JslxDao jslxDao;

    public JsonMessage findJslxById(int id) {
        return null;
    }

    public JsonMessage findAllJslx(){
        List<Jslx> jslxList = null;
        try {
            jslxList = jslxDao.findAllJslx();
        } catch (Exception e) {
            return new JsonMessage(false,"查找教师类型失败！");
        }
        if(jslxList!=null&&!jslxList.isEmpty()){
            return new JsonMessage(true,jslxList);
        }else{
            return new JsonMessage(false,"查找教师类型失败！");
        }
    }

    public JsonMessage findJslxSelective( int pageNum,int size,Jslx jslx) {
        try {
            int count=jslxDao.findJslxSelectiveNum(jslx);
            Page<Jslx> jslxPage=new Page<Jslx>(size,pageNum,count,null);
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("start",size*(jslxPage.getCurrentPage()-1));
            map.put("size",size);
            map.put("jslx",jslx);
            List<Jslx> jslxes=jslxDao.findJslxSelective(map);
            jslxPage.setDataList(jslxes);
            return new JsonMessage(true,jslxPage);
        } catch (Exception e) {
            return new JsonMessage(false,"查找出错");
        }
    }

    public JsonMessage delJslx(int id) {
       if(jslxDao.delJslx(id)){
           return new JsonMessage(true,"删除成功");
       }
       return  new JsonMessage(false,"删除失败");
    }

    public JsonMessage editJslx(Jslx jslx) {
        if(jslxDao.editJslx(jslx)){
            return new JsonMessage(true,"修改成功");
        }
        return new JsonMessage(true,"修改失败");
    }

    public JsonMessage addJslx(Jslx jslx) {
        if(jslxDao.addJslx(jslx)){
            return new JsonMessage(true,"添加成功");
        }
        return new JsonMessage(true,"添加失败");
    }


    public JsonMessage findTeacherBylx(int lx_id) {
        Jslx jslx=jslxDao.findJslxById(lx_id);
        if(jslx!=null){
            return new JsonMessage(true,jslx);
        }else{
            return new JsonMessage(false,"查找教师类型失败！");
        }
    }
}

