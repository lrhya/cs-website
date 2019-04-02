<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:set var="base" value="${pageContext.request.contextPath}/"/>
    <c:if test="${jsonMessage.success}">
    <title>${jsonMessage.result.title}</title>
    </c:if>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
    <link href="${pageContext.request.contextPath}/front/css/main.css" rel="stylesheet"/>
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
                <a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=${jsonMessage.result.typeId}">${jsonMessage.result.typename}</a>
            </div>
            <c:if test="${jsonMessage.success}">
            <c:set var="news" value="${jsonMessage.result}"/>
            <div class="leader">
                <div class="contro">
                    <h2 id="title">${news.title}</h2>
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
</div>
    <jsp:include page="../include/footer.jsp"/>
    <img src="${pageContext.request.contextPath}/front/img/return_top1.png" alt="返回顶部" id="return_top">
    <script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/scroll.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/return_top.js"></script>
</body>

</html>