package com.jplus.dao;

import com.jplus.entity.Log;
import com.jplus.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("logDao")
public interface LogDao {
   int addLog(Log log);

   Boolean deleteBach(int []logIds);
   Boolean deleteLog(int id);

    List<Log> findLogSelective(Map<String,Object> map);

     Log findById(int id);

    int findLogSelectiveNum(Log log);
}
