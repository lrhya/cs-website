<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台首页</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
    <style>
        #main {
            position: relative;
        }

        .tabular.menu .active.item {
            background-color: #00B5AD !important;
        }

        #m-tab {
            /*padding: 2px;*/
            height: 100%;
            /*overflow-y: scroll;*/
            overflow: hidden;
        }

        #m-tab .menu {
            position: static;
        }

        #m-tab .bottom {
            height: 100%;
        }

        #m-tab .item {
            cursor: pointer;
        }

        #m-tab .item > i {
            position: relative;
            left: 15px;
        }

        .operation {
            width: 150px;
            position: absolute;
            top: 12px;
            right: 20px;
            z-index: 50;
        }
    </style>
</head>
<body>
<!--顶部-->
<div id="top" class="ui top">
    <div class="ui items notice">
        <span>
            <i class="icon announcement big"></i><span>欢迎使用计科院网站后台系统 <span id="time"></span></span>
        </span>
        <span class="fr" id="top-right">
            登录身份：<span id="user-show">${userSession.jsmc}</span>
        </span>
    </div>
</div>
<!--头部-->
<div class="header clearFix" id="header">
    <div class="logo fl"><a href="${pageContext.request.contextPath}/toAdmin.do"><i class="icon home"></i><span>计算机科学与技术学院</span></a>
    </div>
    <%--<div class="fl" id="trigger-menu">--%>
        <%--<span class="item"><i class="icon sidebar"></i>菜单</span>--%>
    <%--</div>--%>
    <div class="ui horizontal fr" id="header-right">
        <div class="item">
            <div class="ui top pointing dropdown icon" id="userOperation">
                <img src="${pageContext.request.contextPath}/admin/img/face.jpg" alt=""
                     class="ui avatar image">
                <span class="content"> ${userSession.username}</span>
                <i class="icon dropdown"></i>
                <ul class="ui compact menu">
                    <li class="item updateRole"><i class="setting icon"></i>修改基本信息</li>
                    <li class="item theme"><i class="configure icon"></i>更多皮肤</li>
                    <li class="item">
                        <a href="${pageContext.request.contextPath}/user/logout.do">
                            <i class="sign out icon"></i>退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!--中间内容-->
<div id="middle" class="clearFix">
    <!--左边导航-->
    <aside id="left-nav">
        <div id="user" class="txt-center">
            <img src="${pageContext.request.contextPath}/admin/img/face.jpg" alt="登录用户图片"
                 class="ui tiny middle aligned circular image">
        </div>
        <nav>
            <div class="ui accordion inverted">
                <div class="active title "><i class="icon dropdown"></i> <span> 欢迎使用</span></div>
                <ul class="ui active content ">
                    <li class="item-active"><a href="javascript:void(0);"
                                               onclick="goIndexPage()">后台首页</a>
                    <li><a href="javascript:void(0);" onclick="addTab('使用须知','')">使用须知</a></li>
                </ul>
                <%--普通管理员不能访问--%>
                <c:if test="${userSession.rank != 1}">
                    <div class="title "><i class="icon dropdown"></i> <span> 毕业班级管理</span></div>
                    <ul class="ui content">
                        <li><a href="javascript:void(0);"
                               onclick="addTab('班级列表','${pageContext.request.contextPath}/clazz/findClazzPage.do')">班级列表</a>
                        </li>
                        <li><a href="javascript:void(0);"
                               onclick="addTab('添加班级','${pageContext.request.contextPath}/clazz/toAddClazz.do')">添加班级</a>
                        </li>
                    </ul>
                </c:if>
                <%--普通管理员不能访问--%>
                <c:if test="${userSession.rank != 1}">
                    <div class="title"><i class="icon dropdown"></i> <span> 毕业生管理</span></div>
                    <ul class="ui content">
                        <li><a href="javascript:void(0);"
                               onclick="addTab('学生列表','${pageContext.request.contextPath}/student/findStudentPage.do')">学生列表</a>
                        </li>
                        <li><a href="javascript:void(0);"
                               onclick="addTab('添加学生','${pageContext.request.contextPath}/student/toAddUi.do')">添加学生</a>
                        </li>
                    </ul>
                </c:if>

                <div class="title"><i class="icon dropdown"></i> <span>新闻管理</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);"
                           onclick="addTab('动态新闻列表','${pageContext.request.contextPath}/news/newsList.do')">动态新闻列表</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('添加动态新闻','${pageContext.request.contextPath}/news/toAddNewsPage.do')">添加动态新闻</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);"
                           onclick="addTab('静态新闻列表','${pageContext.request.contextPath}/staticNews/findStaticNews.do')">静态新闻列表</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('新闻类别管理','${pageContext.request.contextPath}/news/newsTypePage.do')">新闻类别管理</a>
                    </li>
                </ul>

                <div class="title"><i class="icon dropdown"></i> <span>资源管理</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);"
                           onclick="addTab('资源列表','${pageContext.request.contextPath}/resource/findResourcePage.do')">资源列表</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('添加资源','${pageContext.request.contextPath}/resource/toAddResourceUi.do')">添加资源</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('首页图片管理','${pageContext.request.contextPath}/graduate/indexPicList.do')">首页图片管理</a>
                    </li>
                </ul>

                <%--只有超级管理员、系统管理员能访问--%>
                <c:if test="${userSession.rank >2}">
                    <div class="title"><i class="icon dropdown"></i> <span>用户管理</span></div>
                    <ul class="ui content">
                        <li><a href="javascript:void(0);"
                               onclick="addTab('用户列表','${pageContext.request.contextPath}/user/findUsersPage.do')">用户列表</a>
                        </li>
                        <li><a href="javascript:void(0);"
                               onclick="addTab('添加用户','${pageContext.request.contextPath}/user/toAddUi.do')">添加用户</a>
                        </li>
                    </ul>
                </c:if>

                <%--普通管理员不能访问--%>
                <c:if test="${userSession.rank != 1}">
                    <div class="title"><i class="icon dropdown"></i> <span>师资队伍</span></div>
                    <ul class="ui content">
                        <li><a href="javascript:void(0);"
                               onclick="addTab('师资队伍','${pageContext.request.contextPath}/teacher/findTeacherPage.do')">师资队伍</a>
                        </li>
                        <li><a href="javascript:void(0);"
                               onclick="addTab('添加教师','${pageContext.request.contextPath}/teacher/toAddUi.do')">添加教师</a>
                        </li>
                        <li><a href="javascript:void(0);"
                               onclick="addTab('教师职称列表管理','${pageContext.request.contextPath}/teacher/findTeacherZC.do')">教师职称列表管理</a>
                        </li>
                        <li><a href="javascript:void(0);"
                               onclick="addTab('教师类别管理','${pageContext.request.contextPath}/teacher/findJslxSelective.do')">教师类别管理</a>
                        </li>
                    </ul>
                </c:if>
                <div class="title"><i class="icon dropdown"></i> <span>系统</span></div>
                <ul class="ui content">
                    <c:if test="${userSession.rank ==4}">
                        <li>
                            <a href="javascript:void(0);"
                               onclick="addTab('系统日志','${pageContext.request.contextPath}/log/findLog.do')">系统日志</a>
                        </li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/toIndex.do">返回前台</a></li>
                </ul>
            </div>
        </nav>
    </aside>
    <!--主体-->
    <div id="main">
        <div id="m-tab">
            <div class="ui top attached tabular menu">
                <a class="active item" data-tab="indexPage">后台首页</a>
            </div>
            <div class="ui bottom attached active tab segment" data-tab="indexPage">
                <jsp:include page="view/indexPage.jsp"/>
            </div>
        </div>
        <div class="operation">
            <div class="ui top pointing dropdown icon pageOperation">
                <span class="content"><i class="pointing right icon"></i>页面操作</span>
                <i class="icon dropdown"></i>
                <ul class="ui compact menu">
                    <li class="item"><a href="javascript:refreshPage()"><i class="icon refresh"></i>刷新当前</a></li>
                    <li class="item"><a href="javascript:closeOtherPage()"><i class="icon remove"></i>关闭其他</a></li>
                    <li class="item"><a href="javascript:closeAllPage()"><i class="icon remove"></i>关闭全部</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="ui small modal" id="update">
    <div class="header">修改个人信息 <span class="mess" style="color: red"></span></div>
    <form id="form1" method="post">
        <div class="content">
            <input type="hidden" name="id" value="${userSession.id}">
            <div class="ui form">
                <div class="inline field ">
                    <label> &nbsp;&nbsp;&nbsp;&nbsp;用户角色</label>
                    <input type="text"  name="jsmc" value="${userSession.jsmc}" disabled>
                </div>
                <div class="inline field">
                    <label> &nbsp;&nbsp;&nbsp;&nbsp;用户姓名</label>
                    <input type="text" placeholder="输入姓名" name="username" value="${userSession.username}">
                </div>
                <div class="inline field">
                    <label> &nbsp;&nbsp;&nbsp;&nbsp;用户密码</label>
                    <input type="password" placeholder="输入密码" name="password" >
                </div>
                <div class="inline field">
                    <label> &nbsp;&nbsp;&nbsp;&nbsp;确认密码</label>
                    <input type="password" placeholder="再次输入密码" name="rePassword">
                </div>
            </div>
        </div>
    </form>
    <div class="actions">
        <div class="ui negative button" id="btn">更改</div>
        <div class="ui positive button">取消</div>
    </div>

</div>
<div id="footer">
    <p>&copy;2017 湖北师范大学计算机科学与技术学院 All rights reserved</p>
</div>
<%--更换颜色--%>
<div class="ui small modal" id="themeModal">
    <div class="header"><i class="warning sign icon red"></i>更换皮肤</div>
    <div class="content setColor">
        <input type="radio" name="color" title="blue" value="blue" class="ui radio"/>默认
        <input type="radio" name="color" checked title="green" value="green" class="ui radio"/>绿色
        <input type="radio" name="color" title="orange" value="orange" class="ui radio"/>橙色
        <input type="radio" name="color" title="red" value="red" class="ui radio"/>红色
    </div>
    <div class="actions">
        <div class="ui negative button setTheme">确定更换</div>
        <div class="ui positive button">我再想想</div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/jquery.form/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/tab.js"></script>
<script>
    $(".pageOperation").dropdown({
        on: "hover"
    });
    $('.updateRole').click(function () {
            $("#update").modal('show');
                $('#btn').click(function(){
                        $('#form1').ajaxSubmit({
                            url:'${pageContext.request.contextPath}/user/updateUsers1.do',
                            dataType: 'text',
                            success: resutlMsg,
                            error: errorMsg
                        });
                        function resutlMsg(msg){
                            if(msg==="信息修改成功！"){
                                alert("信息修改成功！");
                                window.location.reload();
                                return;
                            }
                            $('.mess').text(msg);
                            $("#update").modal('show');                        }
                        function errorMsg(msg){
                            $("#update").modal('show');
                            /*alert(msg);*/
                        }
                })
    });
    function changeColor() {
        var color = localStorage.getItem("color");
        if(!color){
            $("#header").css("background-color",red);
            $("#left-nav").css("background-color!important",color);
        }
    }
    changeColor();
    $(".theme").click(function () {
        $("#themeModal").modal("show");
        $(".setTheme").click(function () {
            var color = $(".setColor").find(":checked").val();
            alert(color);
            localStorage.setItem("color", color);
            changeColor();
        })
    })
</script>
</body>
</html>