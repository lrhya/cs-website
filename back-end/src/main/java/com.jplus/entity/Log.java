package com.jplus.entity;

/**
 * 日志
 */
public class Log {
    private int id;
    private String user;
    private String ip;
    private String actionTime;
    private String action;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getActionTime() {
        return actionTime;
    }

    public void setActionTime(String actionTime) {
        this.actionTime = actionTime;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        if (action != null) {
            int length = action.length();
            if (length >= 20) {
                action = action.substring(0,10)+action.substring(length - 10);
            }
        }
        this.action = action;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Log() {
    }

    public Log(int id, String user, String ip, String actionTime, String action) {
        this.id = id;
        this.user = user;
        this.ip = ip;
        this.actionTime = actionTime;
        this.action = action;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", ip='" + ip + '\'' +
                ", actionTime='" + actionTime + '\'' +
                ", action='" + action + '\'' +
                '}';
    }
}
