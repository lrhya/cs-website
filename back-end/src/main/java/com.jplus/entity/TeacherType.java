/*
 * 当前使用数据库为mysql
 * 此文件由Hyberbin自动生成仅供参考
 * QQ：464863696
 */
package com.jplus.entity;

import java.util.List;

/*
 * teacherlb表POJO类
 * QQ：464863696
 * @author hyberbin
 */
public class  TeacherType {
private Integer id;//
private String zhicheng;//教师职称

    private List<Teacher> teachers;

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }
/*
 * teacherlb不带参数的构造方法
 */


    /*
     * teacherlb带参数的构造方法
     */

public Integer getId() {
    return id;
}

public void setId(Integer id) {
    this.id = id;
}

public String getZhicheng() {
    return zhicheng;
}

public void setZhicheng(String zhicheng) {
    this.zhicheng = zhicheng;
}


}

