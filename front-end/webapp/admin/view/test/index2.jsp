<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台首页</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon3.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
    <style>
        #m-tab {
            padding: 2px;
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
    <div class="fl" id="trigger-menu">
        <span class="item"><i class="icon sidebar"></i>菜单</span>
    </div>
    <div class="ui horizontal  fr" id="header-right">
        <div class="item">
            <div class="ui top pointing dropdown icon">
                <img src="${pageContext.request.contextPath}/admin/img/face.jpg" alt=""
                     class="ui avatar image">
                <span class="content"> ${userSession.username}</span>
                <i class="icon dropdown"></i>
                <ul class="ui compact menu">
                    <li class="item"><i class="write icon"></i>个人资料</li>
                    <li class="item"><i class="setting icon"></i>修改基本信息</li>
                    <li class="item"><i class="configure icon"></i>更多皮肤</li>
                    <li class="item"><a href="${pageContext.request.contextPath}/user/logout.do"></a><i
                            class="sign out icon"></i>退出
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
                    <li><a href="javascript:addTab('后台首页','${pageContext.request.contextPath}/admin/adminIndex.jsp')">后台首页</a>
                    </li>
                    <li><a href="javascript:void(0);" onclick="addTab('使用须知','')">使用须知</a></li>
                </ul>
                <div class="title "><i class="icon dropdown"></i> <span> 毕业班级管理</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);"
                           onclick="addTab('班级列表','${pageContext.request.contextPath}/clazz/findClazzPage.do')">班级列表</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('添加班级','${pageContext.request.contextPath}/clazz/toAddClazz.do')">添加班级</a>
                    </li>
                </ul>
                <div class="title"><i class="icon dropdown"></i> <span> 毕业生管理</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);"
                           onclick="addTab('学生列表','${pageContext.request.contextPath}/student/findStudentPage.do')">学生列表</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('添加学生','${pageContext.request.contextPath}/student/toAddUi.do')">添加学生</a>
                    </li>
                </ul>
                <div class="title"><i class="icon dropdown"></i> <span>新闻管理</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);"
                           onclick="addTab('静态新闻列表','${pageContext.request.contextPath}/staticNews/findStaticNews.do')">静态新闻列表</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('动态新闻列表','${pageContext.request.contextPath}/news/newsList.do')">动态新闻列表</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('新闻类别管理','${pageContext.request.contextPath}/news/newsTypePage.do')">新闻类别管理</a>
                    </li>
                </ul>
                <div class="title"><i class="icon dropdown"></i> <span>资源上传</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);"
                           onclick="addTab('资源管理列表','${pageContext.request.contextPath}/resource/findResourcePage.do')">资源管理列表</a>
                    </li>
                    <li><a href="javascript:void(0);" onclick="addTab('首页图片管理','')">首页图片管理</a></li>
                </ul>
                <div class="title"><i class="icon dropdown"></i> <span>用户管理</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);"
                           onclick="addTab('用户列表','${pageContext.request.contextPath}/user/findUsersPage.do')">用户列表</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('添加用户','${pageContext.request.contextPath}/user/toAddUi.do')">添加用户</a></li>
                </ul>
                <div class="title"><i class="icon dropdown"></i> <span>师资队伍</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);"
                           onclick="addTab('师资队伍','${pageContext.request.contextPath}/teacher/findTeacherPage.do')">师资队伍</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('教师职称列表管理','${pageContext.request.contextPath}/teacher/findTeacherZC.do')">教师职称列表管理</a>
                    </li>
                    <li><a href="javascript:void(0);"
                           onclick="addTab('教师类别管理','${pageContext.request.contextPath}/teacher/findJslxSelective.do')">教师类别管理</a>
                    </li>
                </ul>
                <div class="title"><i class="icon dropdown"></i> <span>毕业生风采</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);" onclick="addTab('风采列表','')">风采列表</a></li>
                </ul>
                <div class="title"><i class="icon dropdown"></i> <span>系统</span></div>
                <ul class="ui content">
                    <li><a href="javascript:void(0);"
                           onclick="addTab('系统日志','${pageContext.request.contextPath}/log/findLog.do')">系统日志</a></li>
                    <li><a href="${pageContext.request.contextPath}/toIndex.do">返回前台</a></li>
                </ul>
            </div>
        </nav>
    </aside>
    <!--主体-->
    <div id="main">
        <div id="m-tab">
            <div class="ui top attached tabular menu">
            </div>
        </div>
    </div>
</div>

<div id="footer">
    <p>&copy;2017 湖北师范大学计算机科学与技术学院 All rights reserved</p>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/tab.js"></script>
</body>
</html>