package com.jplus.entity;

/**
 * Created by rf on 2017/9/25.
 */
public class Student {
    private int id;
    private String username;//学号
    private String name;
    private String resume;
    private String resumeName;
    private int cid;
    private String photo;
    private String photoName;
    private String sign;
    private String password;
    private int rank;
    private String htmlpath;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        if(resume.contains("\\")){
            resume =resume.replaceAll("\\\\","/");
        }
        this.resume = resume;
    }

    public String getResumeName() {
        if(resume !=null){
            resumeName=resume.substring(resume.lastIndexOf("_")+1);
        }else{
            resumeName=null;
        }
        return resumeName;
    }

    public void setResumeName(String resumeName) {
        this.resumeName = resumeName;
    }

    public String getPhotoName() {
        if(photo !=null){
            photoName=photo.substring(photo.lastIndexOf("_")+1);
        }else{
            photoName=null;
        }
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        if(photo.contains("\\")){
            photo =photo.replaceAll("\\\\","/");
        }
        this.photo = photo;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public String getHtmlpath() {
        return htmlpath;
    }

    public void setHtmlpath(String htmlpath) {
        this.htmlpath = htmlpath;
    }
}
