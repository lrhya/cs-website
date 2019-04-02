package com.jplus.entity;

/**
 * Created by rf on 2017/9/25.
 */
public class V_student {
    private int id;
    private String username;
    private String name;
    private String resume;
    private int cid;
    private String photo;
    private String photoName;
    private String sign;//学生签名
    private String password;
    private int rank;
    private String resumeName;
    private String cname;//学生所在班级名称

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

    public void setName(String name) {
        this.name = name;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
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

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public String toString() {
        return "V_student{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", resume='" + resume + '\'' +
                ", cid=" + cid +
                ", photo='" + photo + '\'' +
                ", sign='" + sign + '\'' +
                ", password='" + password + '\'' +
                ", rank=" + rank +
                ", cname='" + cname + '\'' +
                '}';
    }
}
