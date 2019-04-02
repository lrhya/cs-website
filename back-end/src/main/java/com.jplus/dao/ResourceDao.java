
package com.jplus.dao;

import com.jplus.entity.Resource;
import com.jplus.entity.V_resource;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("resourceDao")
public interface ResourceDao {
    /**
     * @return 返回新闻总记录数
     * @throws Exception
     */
    int getResourceCount(Resource resource) throws Exception;

    /**
     * @param resource id,主键，自动添加，不需要添加
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int addResource(Resource resource) throws Exception;

    /**
     *
     * @param resource
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int updateResource(Resource resource) throws Exception;

    /**
     *
     * @param id
     * @return 新闻对象
     */
    Resource findResourceById(int id);

    /**
     *
     * @param param 分页参数
     * @return
     * @throws Exception
     */
    List<V_resource> findAllResource(Map<String, Object> param) throws Exception;

    /**
     *
     * @param resource 资源查询条件
     * @return
     * @throws Exception
     */
    List<Resource> findResourceSelective(Resource resource) throws Exception;

    /**
     * 控制资源是否展示
     * @param resource
     * @return
     */
    int isShow(Resource resource);
    /**
     *
     * @param id
     * @return 0 操作失败，>0,操作成功
     * @throws Exception
     */
    int deleteResource(int id) throws Exception;

}
