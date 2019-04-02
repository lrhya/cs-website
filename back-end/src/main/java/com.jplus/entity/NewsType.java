package com.jplus.entity;

/**
 * Created by rf on 2017/9/17.
 */
public class NewsType {
    private int id;
    private String typename;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "NewsType{" +
                "id=" + id +
                ", typename='" + typename + '\'' +
                '}';
    }
}
