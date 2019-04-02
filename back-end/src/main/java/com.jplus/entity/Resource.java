
package com.jplus.entity;

public class Resource {
    private Integer id;//
    private String filename;//资源文件名
    private String filePath;
    private String compostime;//提交时间
    private Integer ispost;//是否显示
    private Integer lb;//所属类别

    /*
     * resource不带参数的构造方法
     */
    public Resource() {
    }

    /*
     * resource带参数的构造方法
     */
    public Resource(Integer id, String filename, String compostime, Integer ispost, Integer lb) {
        this.id = id;
        this.filename = filename;
        this.compostime = compostime;
        this.ispost = ispost;
        this.lb = lb;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        if (filePath != null) {
            if (filePath.contains("_")) {
                filename = filePath.substring(filePath.indexOf("_") + 1);
            } else {
                filename = filePath;
            }
        }

        return filename;
    }

    public void setFilename(String filename) {
        if(filename.contains("\\")){
            filename= filename.replaceAll("\\\\","/");
        }
        this.filename = filename;
    }

    public String getCompostime() {
        return compostime;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public void setCompostime(String compostime) {
        this.compostime = compostime;
    }

    public Integer getIspost() {
        return ispost;
    }

    public void setIspost(Integer ispost) {
        this.ispost = ispost;
    }

    public Integer getLb() {
        return lb;
    }

    public void setLb(Integer lb) {
        this.lb = lb;
    }


}

