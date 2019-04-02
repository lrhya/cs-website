
package com.jplus.service;

import com.jplus.entity.JsonMessage;
import com.jplus.entity.Resource;
import com.jplus.entity.Page;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 资源管理
 * 后端不做数据校验，由前端负责数据校验
 */
public interface ResourceService {

    /**
     * 添加资源
     * @param resource id,主键，自动添加，不需要添加
     *  @return 0,操作失败，>0 操作成功
     */
    JsonMessage addResource(Resource resource) ;

    /**
     *更新资源
     * @param resource Resource id,必须传入，指定要更新新闻id
     * @return
     * @
     */
    JsonMessage updateResource(Resource resource,String basePath) ;

    /**
     *通过id查找资源
     * @param id
     * @return
     * @
     */
    JsonMessage findResourceById(int id) ;

    /**
     * 查找资源，并且分页
     * @param pageNum 第几页
     * @param pageSize 每页显示记录数
     * @return
     */
    JsonMessage findAllResource(int pageNum, int pageSize,Resource resource) ;

    /**
     *根据条件，查找资源
     * @param resource
     * @return
     * @
     */
    JsonMessage isShow(Resource resource);

    JsonMessage findResourceSelective(Resource resource) ;

    /**
     * 删除资源
     * @param id id,主键
     */
    JsonMessage deleteResource(int id,String basePath) ;

}
