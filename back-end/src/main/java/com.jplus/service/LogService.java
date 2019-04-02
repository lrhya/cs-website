package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Log;

import java.util.Map;
public interface LogService {
    //添加日志
    JsonMessage addLog(Log log);
    //删除日志
    JsonMessage deleteLog(int id);
    //查找日志
    JsonMessage findAllLog(int pageNum,int pageSize,Log log);

    JsonMessage batchDelete(int[] logId);
}
