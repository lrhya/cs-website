<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--顶部-->
<div id="top" class="ui top">
    <div class="ui items notice">
        <span>
                <i class="icon announcement big"></i>
                <span>欢迎使用计科院网站后台系统
                    <span id="time"></span>
                </span>
        </span>
        <span class="fr" id="top-right">
            登录身份：<span id="user-show">${userSession.jsmc}</span>
        </span>
    </div>
</div>
<!--头部-->
<div class="header clearFix" id="header">
    <div class="logo fl">
        <a href="${pageContext.request.contextPath}/admin/index.jsp">
            <i class="icon home"></i><span>计算机科学与技术学院</span>
        </a>
    </div>
    <div class="fl" id="trigger-menu">
        <span class="item"><i class="icon sidebar"></i>菜单</span>
    </div>
    <div class="ui horizontal  fr" id="header-right">
        <div class="item">
            <div class="ui top middle pointing dropdown icon">
                <img src="${pageContext.request.contextPath}/admin/img/face.jpg" alt=""
                     class="ui avatar image">
                <span class="content"> ${userSession.username}</span>
                <i class="icon dropdown"></i>
                <ul class="ui compact menu">
                    <li class="item" onclick=""><i class="write icon"></i>个人资料</li>
                    <li class="item" onclick="editPassword()"><i class="setting icon"></i>修改密码</li>
                    <li class="item" onclick="setTheme()"><i class="configure icon"></i>更多皮肤</li>
                    <li class="item"><a href="${pageContext.request.contextPath}/user/logout.do"><i class="sign out icon"></i>退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="ui small modal" id="setTheme">
    <div class="header">设置网站皮肤</div>
    <div class="content">
        <span ><input type="radio" checked class="ui radio" name="theme">默认</span>
        <span ><input type="radio" class="ui radio" name="theme">蓝色</span>
        <span ><input type="radio" class="ui radio" name="theme">绿色</span>
    </div>
    <div class="actions">
        <div class="ui negative button">确定更换</div>
        <div class="ui positive button">我再想想</div>
    </div>
</div>
<div class="ui small modal" id="editPassword">
<div class="header"><i class="warning sign icon red"></i>修改密码</div>
<div class="content">
    <form action="" class="ui form">
        <div class="field inline    ">
            <label for="oldPassword">原来密码</label>
            <input type="text" placeholder="输入原来密码" id="oldPassword">
        </div>
        <div class="field inline">
            <label for="newPassword">新密码</label>
            <input type="text" placeholder="输入新密码" id="newPassword">
        </div>
        <div class="field inline">
            <label for="rePassword">确认新密码</label>
            <input type="text" placeholder="确认新密码" id="rePassword">
        </div>
    </form>
</div>
<div class="actions">
    <div class="ui negative button">确定</div>
    <div class="ui positive button">取消</div>
</div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script>
    function setTheme() {
        $("#setTheme").modal("show")
    }
    function editPassword() {
        $("#editPassword").modal("show")
    }
</script>
