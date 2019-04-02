<%--<<<<<<< HEAD--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!--左边导航-->--%>
<%--<aside id="left-nav">--%>
    <%--<div id="user" class="txt-center">--%>
        <%--<img src="${pageContext.request.contextPath}/admin/img/face.jpg" alt="登录用户图片"--%>
             <%--class="ui tiny middle aligned circular image">--%>
    <%--</div>--%>
    <%--<nav>--%>
        <%--<div class="ui accordion inverted">--%>
            <%--<div class="title"><i class="icon dropdown"></i> <span> 欢迎使用</span></div>--%>
            <%--<ul class="ui content">--%>
                <%--<li><a href="${pageContext.request.contextPath}/admin/index.jsp">系统首页</a></li>--%>
                <%--<li><a href="#">使用须知</a></li>--%>
            <%--</ul>--%>
            <%--<div class="title"><i class="icon dropdown"></i> <span>新闻管理</span></div>--%>
            <%--<ul class="ui content">--%>
                <%--<li><a href="${pageContext.request.contextPath}/news/newsList.do">动态新闻列表</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/news/toAddNewsPage.do">添加动态新闻</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/staticNews/findStaticNews.do">静态新闻</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/news/newsTypePage.do">新闻类别管理</a></li>--%>
            <%--</ul>--%>
            <%--<div class="title "><i class="icon dropdown"></i> <span> 毕业班级管理</span></div>--%>
            <%--<ul class="ui content">--%>
                <%--<li><a href="${pageContext.request.contextPath}/clazz/findClazzPage.do">班级列表</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/admin/view/class/addClass.jsp">添加班级</a></li>--%>
            <%--</ul>--%>
            <%--<div class="title">--%>
                <%--<i class="icon dropdown"></i>--%>
                <%--<span> 毕业生管理</span>--%>
            <%--</div>--%>
            <%--<ul class="ui content">--%>
                <%--<li><a href="${pageContext.request.contextPath}/student/findStudentPage.do">学生列表</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/student/toAddUi.do">添加学生</a></li>--%>
            <%--</ul>--%>

            <%--<div class="title">--%>
                <%--<i class="icon dropdown"></i>--%>
                <%--<span>资源管理</span>--%>
            <%--</div>--%>
            <%--<ul class="ui content">--%>
                <%--<li><a href="${pageContext.request.contextPath}/resource/findResourcePage.do">资源管理列表</a></li>--%>
                <%--<li><a href="#">首页图片管理</a></li>--%>
            <%--</ul>--%>
            <%--<div class="title"><i class="icon dropdown"></i> <span>用户管理</span></div>--%>
            <%--<ul class="ui content">--%>
                <%--<li><a href="${pageContext.request.contextPath}/users/findUsersPage.do">用户列表</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/users/toAddUi.do">添加用户</a></li>--%>
            <%--</ul>--%>
            <%--<div class="title"><i class="icon dropdown"></i> <span>师资队伍</span></div>--%>
            <%--<ul class="ui content">--%>
                <%--<li><a href="${pageContext.request.contextPath}/teacher/findTeacherPage.do">师资队伍</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/teacher/toAddUi.do">添加教师</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/teacher/findTeacherZC.do">教师职称列表管理</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/teacher/findJslxSelective.do">教师类别管理</a></li>--%>
            <%--</ul>--%>
            <%--<div class="title"><i class="icon dropdown"></i> <span>毕业生风采</span></div>--%>
            <%--<ul class="ui content">--%>
                <%--<li><a href="${pageContext.request.contextPath}/admin/view/fengCai.jsp">风采列表</a></li>--%>
            <%--</ul>--%>
            <%--<div class="title"><i class="icon dropdown"></i> <span>系统</span></div>--%>
            <%--<ul class="ui content">--%>
                <%--<li><a href="${pageContext.request.contextPath}/log/findLog.do">系统日志</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/toIndex.do">返回前台</a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</nav>--%>
<%--</aside>--%>
<%--=======--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--左边导航-->
<aside id="left-nav">
    <div id="user" class="txt-center">
        <img src="${pageContext.request.contextPath}/admin/img/face.jpg" alt="登录用户图片"
             class="ui tiny middle aligned circular image">
    </div>
    <nav>
        <div class="ui accordion inverted">
            <div class="title"><i class="icon dropdown"></i> <span> 欢迎使用</span></div>
            <ul class="ui content">
                <li><a href="${pageContext.request.contextPath}/admin/index.jsp">系统首页</a></li>
                <li><a href="#">使用须知</a></li>
            </ul>
            <div class="title"><i class="icon dropdown"></i> <span>新闻管理</span></div>
            <ul class="ui content">
                <li><a href="${pageContext.request.contextPath}/news/newsList.do">动态新闻列表</a></li>
                <li><a href="${pageContext.request.contextPath}/news/toAddNewsPage.do">添加动态新闻</a></li>
                <li><a href="${pageContext.request.contextPath}/staticNews/findStaticNews.do">静态新闻</a></li>
                <li><a href="${pageContext.request.contextPath}/news/newsTypePage.do">新闻类别管理</a></li>
            </ul>
            <div class="title "><i class="icon dropdown"></i> <span> 毕业班级管理</span></div>
            <ul class="ui content">
                <li><a href="${pageContext.request.contextPath}/clazz/findClazzPage.do">班级列表</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/view/class/addClass.jsp">添加班级</a></li>
            </ul>
            <div class="title">
                <i class="icon dropdown"></i>
                <span> 毕业生管理</span>
            </div>
            <ul class="ui content">
                <li><a href="${pageContext.request.contextPath}/student/findStudentPage.do">学生列表</a></li>
                <li><a href="${pageContext.request.contextPath}/student/toAddUi.do">添加学生</a></li>
            </ul>

            <div class="title">
                <i class="icon dropdown"></i>
                <span>资源管理</span>
            </div>
            <ul class="ui content">
                <li><a href="${pageContext.request.contextPath}/resource/findResourcePage.do">资源管理列表</a></li>
                <li><a href="#">首页图片管理</a></li>
            </ul>
            <div class="title"><i class="icon dropdown"></i> <span>用户管理</span></div>
            <ul class="ui content">
                <li><a href="${pageContext.request.contextPath}/user/findUsersPage.do">用户列表</a></li>
                <li><a href="${pageContext.request.contextPath}/user/toAddUi.do">添加用户</a></li>
            </ul>
            <div class="title"><i class="icon dropdown"></i> <span>师资队伍</span></div>
            <ul class="ui content">
                <li><a href="${pageContext.request.contextPath}/teacher/findTeacherPage.do">师资队伍</a></li>
                <li><a href="${pageContext.request.contextPath}/teacher/toAddUi.do">添加教师</a></li>
                <li><a href="${pageContext.request.contextPath}/teacher/findTeacherZC.do">教师职称列表管理</a></li>
                <li><a href="${pageContext.request.contextPath}/teacher/findJslxSelective.do">教师类别管理</a></li>
            </ul>
            <div class="title"><i class="icon dropdown"></i> <span>毕业生风采</span></div>
            <ul class="ui content">
                <li><a href="${pageContext.request.contextPath}/admin/view/fengCai.jsp">风采列表</a></li>
            </ul>
            <div class="title"><i class="icon dropdown"></i> <span>系统</span></div>
            <ul class="ui content">
                <li><a href="${pageContext.request.contextPath}/log/findLog.do">系统日志</a></li>
                <li><a href="${pageContext.request.contextPath}/toIndex.do">返回前台</a></li>
            </ul>
        </div>
    </nav>
</aside>

