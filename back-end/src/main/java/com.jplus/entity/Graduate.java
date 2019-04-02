/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jplus.entity;

/**
 * @author 刘政
 */
public class Graduate {

    private String id;//图片id
    private String imagename;//图片名称
    private String uptime;//上传时间
    private String imagepath;//图片路径
    private int status;//显示状态
    private String describes;//图片描述

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImagename() {
        return imagename;
    }

    public void setImagename(String imagename) {
        this.imagename = imagename;
    }

    public String getUptime() {
        return uptime;
    }

    public void setUptime(String uptime) {
        this.uptime = uptime;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    @Override
    public String toString() {
        return "Graduate{" +
                "id='" + id + '\'' +
                ", imagename='" + imagename + '\'' +
                ", uptime='" + uptime + '\'' +
                ", imagepath='" + imagepath + '\'' +
                ", status=" + status +
                ", describes='" + describes + '\'' +
                '}';
    }
}
