package com.jplus.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 毕业班级管理
 */
public class Clazz {
    private int Id;
    private String name;
    private Date entrancetime;//入学时间
    private String proname;//专业名
    private String ttscheme;//培养方案
    private String entranceDate;//入学时间
    public int getId() {
        return Id;
    }
    private Integer boy;//男生人数
    private Integer girl;//女生人数
    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEntranceDate() {
        if(entrancetime!=null){
            SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-MM-dd");
            entranceDate =simpleDateFormat.format(entrancetime);
        }
        return entranceDate;
    }

    public void setEntranceDate(String entranceDate) {
        this.entranceDate = entranceDate;
    }

    public Date getEntrancetime() {
        return entrancetime;
    }

    public void setEntrancetime(Date entrancetime) {
        this.entrancetime = entrancetime;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname;
    }

    public String getTtscheme() {
        return ttscheme;
    }

    public void setTtscheme(String ttscheme) {
        this.ttscheme = ttscheme;
    }

    public Integer getBoy() {
        return boy;
    }

    public void setBoy(Integer boy) {
        this.boy = boy;
    }

    public Integer getGirl() {
        return girl;
    }

    public void setGirl(Integer girl) {
        this.girl = girl;
    }

    @Override
    public String toString() {
        return "Clazz{" +
                "Id=" + Id +
                ", name='" + name + '\'' +
                ", entrancetime=" + entrancetime +
                ", proname='" + proname + '\'' +
                ", ttscheme='" + ttscheme + '\'' +
                ", boy=" + boy +
                ", girl=" + girl +
                '}';
    }
}
