
package com.jplus.service;

import com.jplus.entity.Graduate;
import com.jplus.entity.JsonMessage;
import com.jplus.entity.Page;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 毕业风采展示
 * 后端不做数据校验，由前端负责数据校验
 */
public interface GraduateService {
    JsonMessage changIndexPic(Graduate graduate,String basePath);

    /**
     * 添加毕业风采展示
     * @param graduate id,主键，自动添加，不需要添加
     *  @return 0,操作失败，>0 操作成功
     */
    JsonMessage addGraduate(Graduate graduate, HttpServletRequest request);

    /**
     *更新毕业风采展示
     * @param graduate Graduate id,必须传入，指定要更新新闻id
     * @return JsonMessage
     * @throws Exception
     */
    JsonMessage updateGraduate(Graduate graduate);

    /**
     *通过id查找毕业风采展示
     * @param id
     * @return
     * @throws Exception
     */
    JsonMessage findGraduateById(String id);

    /**
     * 查找毕业风采展示，并且分页
     * @param pageNum 第几页
     * @param pageSize 每页显示记录数
     * @return JsonMessage
     */
    JsonMessage findAllGraduate(int pageNum, int pageSize);

    /**
     *根据条件查找毕业风采展示
     * @param graduate
     * @return JsonMessage
     * @throws Exception
     */
    JsonMessage findGraduateSelective(Graduate graduate);

    /**
     * 删除毕业风采展示
     * @param id id,主键
     *  @return JsonMessage
     */
    JsonMessage deleteGraduate(String id,String basePath);

    /**
     * 展示首页图片
     * @return
     */
    JsonMessage indexPicList ();

    JsonMessage addIndexPic(Graduate graduate);

    int indexNum();
}
