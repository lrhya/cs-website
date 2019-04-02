<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>学院网站招生就业</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon3.ico" type="image/x-icon" />
    <link href="${pageContext.request.contextPath}/front/css/style.css" rel="stylesheet"  />
</head>
<style>
    body{
        background: linear-gradient(to bottom, rgba(14, 33, 88, 0.99), rgba(39, 112, 219, 0.5))
    }
</style>
<body>

<div class="main">
    <div id="header">

    </div>
    <div id="content">
        <div class="menu">
            <jsp:include page="../include/nav_picture.jsp"/>
        </div>
        <div class="cont">
            <div class="picture">
                <img src="${pageContext.request.contextPath}/CS/upload/201711/slide_2.jpg">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                </ul>
                <div class="p-background"></div>
            </div>
            <div class="cont-a">
                <div class="title">
                    <span class="label">公告通知</span>
                    <span class="more">
                        <a href="${pageContext.request.contextPath}/news/font/newTitleNav.do?newsType=1">更多</a>
                    </span>
                </div>
                <div class="lists">
                    <ul>
                        <c:if test="${jsonNotice.success}">
                            <c:forEach items="${jsonNotice.result}" var="notice">
                                <li>
                                    <a href="${pageContext.request.contextPath}/news/font/findNewsById.do?id=${notice.id}">${notice.title}</a>
                                    <span class="time">${notice.composetime}</span>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="cont-b">
                <div class="title">
                    <span class="label">学工动态 </span>
                    <span class="more">
                         <a href="${pageContext.request.contextPath}/news/font/newTitleNav.do?newsType=6">更多</a>
                    </span>
                </div>
                <div class="lists">
                    <ul>
                        <c:if test="${jsonXueGong.success}">
                            <c:forEach items="${jsonXueGong.result}" var="XueGong">
                                <li>
                                    <a href="${pageContext.request.contextPath}/news/font/findNewsById.do?id=${XueGong.id}">${XueGong.title}</a>
                                    <span class="time">${XueGong.composetime}</span>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="cont-c">
                <div class="title">
                    <span class="label">学院新闻</span>
                    <span class="more">
                        <a href="${pageContext.request.contextPath}/news/font/newTitleNav.do?newsType=11">更多</a>
                    </span>
                </div>
                <div class="lists">
                    <ul>
                        <c:if test="${jsonNews.success}">
                            <c:forEach items="${jsonNews.result}" var="news">
                                <li>
                                    <a href="${pageContext.request.contextPath}/news/font/findNewsById.do?id=${news.id}">${news.title}</a>
                                    <span class="time">${news.composetime}</span>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp"/>
</div>

<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/scroll.js"></script>
</body>
</html>