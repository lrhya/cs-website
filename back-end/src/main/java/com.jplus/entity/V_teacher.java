
package com.jplus.entity;
public class V_teacher {
    private String lxmc;
    private String name;//教师姓名
    private Integer Id; //
    private String jianjie;//教师简介
    private String zhicheng;//教师职称
    private Integer zhichenghao;//职称编号
    private int jslx;

    /*
     * v_teacher不带参数的构造方法
     */
    public V_teacher() {
    }

    /*
     * v_teacher带参数的构造方法
     */
    public V_teacher(String name, Integer Id, String jianjie, String zhicheng, Integer zhichenghao) {
        this.name = name;
        this.Id = Id;
        this.jianjie = jianjie;
        this.zhicheng = zhicheng;
        this.zhichenghao = zhichenghao;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public String getJianjie() {
        return jianjie;
    }

    public void setJianjie(String jianjie) {
        this.jianjie = jianjie;
    }

    public String getZhicheng() {
        return zhicheng;
    }

    public void setZhicheng(String zhicheng) {
        this.zhicheng = zhicheng;
    }

    public Integer getZhichenghao() {
        return zhichenghao;
    }

    public void setZhichenghao(Integer zhichenghao) {
        this.zhichenghao = zhichenghao;
    }

    public String getLxmc() {
        return lxmc;
    }

    public void setLxmc(String lxmc) {
        this.lxmc = lxmc;
    }

    public int getJslx() {
        return jslx;
    }

    public void setJslx(int jslx) {
        this.jslx = jslx;
    }

    @Override
    public String toString() {
        return "V_teacher{" +
                "lxmc='" + lxmc + '\'' +
                ", name='" + name + '\'' +
                ", Id=" + Id +
                ", jianjie='" + jianjie + '\'' +
                ", zhicheng='" + zhicheng + '\'' +
                ", zhichenghao=" + zhichenghao +
                ", jslx=" + jslx +
                '}';
    }
}

