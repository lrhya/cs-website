
package com.jplus.entity;

public class JsonMessage {

    private boolean success;//true 执行业务成功 false执行业务失败

    private Object result;//返回结果或者提示信息

    public JsonMessage(boolean success, Object result) {
        this.success = success;
        this.result = result;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
