package com.jplus.service.impl;

import com.jplus.dao.LogDao;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Log;
import com.jplus.entity.Page;
import com.jplus.service.LogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("logService")
public class LogImpl implements LogService {
    @Resource
    private LogDao logDao;
    public JsonMessage addLog(Log log) {
        return null;
    }

    public JsonMessage deleteLog(int id) {
        if(logDao.deleteLog(id)){
            return new JsonMessage(true,"删除成功");
        }
        return new JsonMessage(false,"删除失败");
    }

    public JsonMessage findAllLog(int pageNum,int pageSize,Log log) {
        int count= 0;
        List<Log> logs=null;
        try {
            count = logDao.findLogSelectiveNum(log);
            Page<Log> logPage=new Page<Log>(pageSize,pageNum,count,null);
            int start=(logPage.getCurrentPage()-1)*pageSize;
            Map<String,Object> map=new HashMap<String,Object>();
            map.put("start",start);
            map.put("size",pageSize);
            map.put("log",log);
            logs=logDao.findLogSelective(map);
            logPage.setDataList(logs);
            return new JsonMessage(true,logPage);
        } catch (Exception e) {
            return  new JsonMessage(false,"查找记录失败");
        }

    }

    public JsonMessage batchDelete(int[] logId) {
        if(logDao.deleteBach(logId)){
            return new JsonMessage(true,"删除记录成功！");
        }
        return new JsonMessage(false, "删除记录失败，请选择要删除记录！");
    }

}
