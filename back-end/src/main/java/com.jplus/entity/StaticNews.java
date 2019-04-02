/*
 * 当前使用数据库为mysql
 * 此文件由Hyberbin自动生成仅供参考
 * QQ：464863696
 */
package com.jplus.entity;

/*
 * staticnews表POJO类 QQ：464863696 @author hyberbin
 */
public class StaticNews {

    private Integer id;//静态新闻ID
    private String content;//内容
    private String composetime;//发布时间
    private Integer newstype;//新闻类别
    private String typename;//新闻类别

    /*
     * staticnews不带参数的构造方法
     */
    public StaticNews() {
    }
    /*
     * staticnews带参数的构造方法
     */

    public StaticNews(Integer id, String content, String composetime, Integer newstype) {
        this.id = id;
        this.content = content;
        this.composetime = composetime;
        this.newstype = newstype;
    }

    public Integer getId() {
        return id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getComposetime() {
        return composetime;
    }

    public void setComposetime(String composetime) {
        this.composetime = composetime;
    }

    public Integer getNewstype() {
        return newstype;
    }

    public void setNewstype(Integer newstype) {
        this.newstype = newstype;
    }
}
