/*
 * 当前使用数据库为mysql
 * 此文件由Hyberbin自动生成仅供参考
 * QQ：464863696
 */
package com.jplus.entity;

/*
 * roll表POJO类
 * QQ：464863696
 * @author hyberbin
 */
public class Role {
private Integer id;//角色ID
private String jsmc;//角色名称

/*
 * roll不带参数的构造方法
 */
public Role() {
}
/*
 * roll带参数的构造方法
 */
public Role(Integer id, String jsmc) {
    this.id=id;
    this.jsmc=jsmc;
}
public Integer getId() {
    return id;
}

public void setId(Integer id) {
    this.id = id;
}

public String getJsmc() {
    return jsmc;
}

public void setJsmc(String jsmc) {
    this.jsmc = jsmc;
}

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", jsmc='" + jsmc + '\'' +
                '}';
    }
}

