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
            <c:if test="${jsonMessage.success}">
            <c:set var="news" value="${jsonMessage.result}"/>
            <div class="leader">
                <div class="contro">
                    <h2 class="leader-title">${news.title}</h2>
                    <div class="inscrS">
                        <div class="inscr">${news.content}</div>
                        <div class="write-time">
                            发表时间:<span class="time">${news.composetime}</span>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
            <c:if test="${!jsonMessage.success}">
                ${jsonMessage.result}
            </c:if>
        </div>
    </div>
    <jsp:include page="employeInclude/footer.jsp"/>
</div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/ResumeServlet.js"></script>
</body>
</html>