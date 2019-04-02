
package com.jplus.entity;

/**
 * Created by rf on 2017/9/15.
 */
public class Users {
    private Integer Id;//
    private String username;//用户名
    private String password;//用户密码
    private Integer rank;//级别

    /*
     * users不带参数的构造方法
     */
    public Users() {
    }
    /*
     * users带参数的构造方法
     */
    public Users(Integer Id,String username,String password,Integer rank) {
        this.Id=Id;
        this.username=username;
        this.password=password;
        this.rank=rank;
    }
    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
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


}

