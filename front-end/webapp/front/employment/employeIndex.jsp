<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!--招聘就业主页-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>学院网站招生就业</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon3.ico" type="image/x-icon" />
    <link href="${pageContext.request.contextPath}/front/css/style.css" rel="stylesheet"/>
</head>
<body>
    <div id="employment">
        <jsp:include page="employeInclude/header.jsp"/>
        <div id="title">
            <div class="text"><a href="#">就业信息</a></div>
            <div id="move">
                <div id="moven"><span>现在时间 : </span>
                    <span class="newTime"></span>
                </div>
            </div>
        </div>
        <div id="content">
            <jsp:include page="employeInclude/menu.jsp"/>
            <div class="cont">
                <div class="cont-b">
                    <div class="title">
                        <span class="label">招聘信息 </span>
                        <span class="more">
                         <a href="${pageContext.request.contextPath}/employment/front/employeNewTitleNav.do?newsType=21">更多</a>
                    </span>
                    </div>
                    <div class="lists">
                        <ul>
                            <c:if test="${jsonEmploy.success}">
                                <c:forEach items="${jsonEmploy.result}" var="employ">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/employment/front/findEmploymentNewsById.do?id=${employ.id}">${employ.title}</a>
                                        <span class="time">${employ.composetime}</span>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="cont-a">
                    <div class="title">
                        <span class="label">通知公告</span>
                        <span class="more">
                        <a href="${pageContext.request.contextPath}/employment/front/findEmploymentNewsById.do?newsType=20">更多</a>
                    </span>
                    </div>
                    <div class="lists">
                        <ul>
                            <c:if test="${jsonNotice.success}">
                                <c:forEach items="${jsonNotice.result}" var="notice">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/employment/front/findEmploymentNewsById.do?id=${notice.id}">${notice.title}</a>
                                        <span class="time">${notice.composetime}</span>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="cont-b">
                    <div class="title">
                        <span class="label">就业指导</span>
                        <span class="more">
                         <a href="${pageContext.request.contextPath}/employment/front/employeNewTitleNav.do?newsType=22">更多</a>
                    </span>
                    </div>
                    <div class="lists">
                        <ul>
                            <c:if test="${jsonWork.success}">
                                <c:forEach items="${jsonWork.result}" var="work">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/employment/front/findEmploymentNewsById.do?id=${work.id}">${work.title}</a>
                                        <span class="time">${work.composetime}</span>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="cont-c">
                    <div class="title">
                        <span class="label">考研指导</span>
                        <span class="more">
                        <a href="${pageContext.request.contextPath}/employment/front/employeNewTitleNav.do?newsType=24">更多</a>
                    </span>
                    </div>
                    <div class="lists">
                        <ul>
                            <c:if test="${jsonTest.success}">
                                <c:forEach items="${jsonTest.result}" var="test">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/news/front/findNewsById.do?id=${test.id}">${test.title}</a>
                                        <span class="time">${test.composetime}</span>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="employeInclude/footer.jsp"/>
    </div>
    <script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/ResumeServlet.js"></script>
</body>
</html>