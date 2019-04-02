
package com.jplus.entity;

public class Teacher {
    private Integer id;//
    private String name;//教师姓名
    private String jianjie;//教师简介
    private Integer zhichenghao;//职称编号
    private Integer jslx;

    /*
     * teacher不带参数的构造方法
     */
    public Teacher() {
    }
    /*
     * teacher带参数的构造方法
     */
    public Teacher(Integer id,String name,String jianjie,Integer zhichenghao) {
        this.id=id;
        this.name=name;
        this.jianjie=jianjie;
        this.zhichenghao=zhichenghao;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJianjie() {
        return jianjie;
    }

    public void setJianjie(String jianjie) {
        this.jianjie = jianjie;
    }

    public Integer getZhichenghao() {
        return zhichenghao;
    }

    public void setZhichenghao(Integer zhichenghao) {
        this.zhichenghao = zhichenghao;
    }

    public Integer getJslx() {
        return jslx;
    }

    public void setJslx(Integer jslx) {
        this.jslx = jslx;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", jianjie='" + jianjie + '\'' +
                ", zhichenghao=" + zhichenghao +
                ", jslx=" + jslx +
                '}';
    }
}
