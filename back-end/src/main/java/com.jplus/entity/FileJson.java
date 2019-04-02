package com.jplus.entity;

/**
 * Created by rf on 2017/10/25.
 */
public class FileJson {
    private int errno;
    private String[] data;

    public int getErrno() {
        return errno;
    }

    public void setErrno(int errno) {
        this.errno = errno;
    }

    public String[] getData() {
        return data;
    }

    public void setData(String data[]) {
        for(String s:data){
            if(s.contains("\\")){
                s = s.replaceAll("\\\\","/");
            }
        }
        this.data = data;
    }

    public FileJson() {
    }

    public FileJson(int errno, String[] data) {
        this.errno = errno;
        this.data = data;
    }
}
