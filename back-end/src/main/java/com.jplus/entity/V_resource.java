
package com.jplus.entity;

public class V_resource {
    private String typename;//类别名称
    private Integer id;//
    private String filename;//资源文件名
    private String filePath;
    private String compostime;//提交时间
    private String ispost;//
    private int isShow;

    /*
     * v_resource不带参数的构造方法
     */
    public V_resource() {
    }

    /*
     * v_resource带参数的构造方法
     */
    public V_resource(String typename, Integer id, String filename, String compostime, String ispost) {
        this.typename = typename;
        this.id = id;
        this.filename = filename;
        this.compostime = compostime;
        this.ispost = ispost;
    }


    public int getIsShow() {
        return isShow;
    }

    public void setIsShow(int isShow) {
        this.isShow = isShow;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
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

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        //文件包含\替换/
        if (filePath.contains("\\")) {
            filePath = filePath.replaceAll("\\\\", "/");
        }
        this.filePath = filePath;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getCompostime() {
        return compostime;
    }

    public void setCompostime(String compostime) {
        this.compostime = compostime;
    }

    public String getIspost() {
        return ispost;
    }

    public void setIspost(String ispost) {
        this.ispost = ispost;
    }


}

