/*
 * 当前使用数据库为mysql
 * 此文件由Hyberbin自动生成仅供参考
 * QQ：464863696
 */
package com.jplus.entity;

/*
 * v_user表POJO类
 * QQ：464863696
 * @author hyberbin
 */
public class V_user {
private Integer id;//
private String username;//用户名
private String password;//用户密码
private Integer rank;//级别
private String jsmc;//角色名称

/*
 * v_user不带参数的构造方法
 */
public V_user() {
}
/*
 * v_user带参数的构造方法
 */
public V_user(Integer id,String username,String password,Integer rank,String jsmc) {
    this.id=id;
    this.username=username;
    this.password=password;
    this.rank=rank;
    this.jsmc=jsmc;
}
public Integer getId() {
    return id;
}

public void setId(Integer id) {
    this.id = id;
}

public String getUsername() {
    return username;
}

public void setUsername(String username) {
    this.username = username;
}

public String getPassword() {
    return password;
}

public void setPassword(String password) {
    this.password = password;
}

public Integer getRank() {
    return rank;
}

public void setRank(Integer rank) {
    this.rank = rank;
}

public String getJsmc() {
    return jsmc;
}

public void setJsmc(String jsmc) {
    this.jsmc = jsmc;
}

    @Override
    public String toString() {
        return "V_user{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", rank=" + rank +
                ", jsmc='" + jsmc + '\'' +
                '}';
    }
}

