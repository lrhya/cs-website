<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>教师职称列表</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
    <link href="${pageContext.request.contextPath}/front/css/main.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/sideNav.jsp"/>
<div class="main">
    <div id="content">
        <jsp:include page="../include/nav_picture.jsp"/>
        <div class="cont-content">
            <div class="path">
                当前位置 :
                <a href="${pageContext.request.contextPath}/toIndex.do">首页</a>>>
                <%--<span >人才培养</span>>>--%>
                <a href="${pageContext.request.contextPath}/teacher/front/findZcTeacher.do?lx_id=1">${teachers['教授'][0].lxmc}</a>
            </div>
            <div class="post">
                <div id="title">
                    计算机科学与技术学院师资队伍
                </div>
                <hr class="color-gray">
                <div class="post-lists">
                    <c:forEach items="${teachers}" var="mymap">
                        <div class="lists">
                            <div class="til">${mymap.key}</div>
                            <ul>
                                <c:forEach items="${mymap.value}" var="v1">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/teacher/font/findTeacherById.do?Id=${v1.id}">${v1.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:forEach>
                    <div class="write-time">
                        发表时间:<span class="time">2014-04-10</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp"/>
</body>
</html>
