package com.jplus.entity;

/**
 * Created by rf on 2017/9/21.
 */
public class V_news {
    private Integer id;//新闻ID
    private String title;//标题
    private String content;//内容
    private String composetime;//发布时间
    private Integer newstype;//新闻类别
    private Integer clicktimes;//点击量
    private String typename;//类别名称
    private int typeId;//类别名称


    /*
     * V_news不带参数的构造方法
     */
    public V_news() {
    }
    /*
     * V_news带参数的构造方法
     */
    public V_news(Integer id,String title,String content,String composetime,Integer newstype,Integer clicktimes,String typename) {
        this.id=id;
        this.title=title;
        this.content=content;
        this.composetime=composetime;
        this.newstype=newstype;
        this.clicktimes=clicktimes;
        this.typename=typename;
    }
    public Integer getId() {
        return id;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
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
        if(composetime.contains(":")){
            composetime=composetime.substring(0,10);
        }
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

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "V_news{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", composetime='" + composetime + '\'' +
                ", newstype=" + newstype +
                ", clicktimes=" + clicktimes +
                ", typename='" + typename + '\'' +
                '}';
    }
}
