/*
 * 当前使用数据库为mysql
 * 此文件由Hyberbin自动生成仅供参考
 * QQ：464863696
 */
package com.jplus.entity;

/*
 * news表POJO类
 * QQ：464863696
 * @author hyberbin
 */
public class News {
private Integer id;//新闻ID
private String title;//标题
private String content;//内容
private String composetime;//发布时间
private Integer newstype;//新闻类别
private Integer clicktimes;//点击量

/*
 * news不带参数的构造方法
 */
public News() {
}
/*
 * news带参数的构造方法
 */
public News(Integer id, String title, String content, String composetime, Integer newstype, Integer clicktimes) {
    this.id=id;
    this.title=title;
    this.content=content;
    this.composetime=composetime;
    this.newstype=newstype;
    this.clicktimes=clicktimes;
}
public Integer getId() {
    return id;
}

public void setId(Integer id) {
    this.id = id;
}

public String getTitle() {
    return title;
}

public void setTitle(String title) {
    this.title = title;
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

public Integer getClicktimes() {
    return clicktimes;
}

public void setClicktimes(Integer clicktimes) {
    this.clicktimes = clicktimes;
}


}

