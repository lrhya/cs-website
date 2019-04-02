<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${jsonMessage.result.typename}</title>
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
                <a href="#">正文</a>
            </div>
            <div class="leader">
                <div id="title">${jsonMessage.result.typename}</div>
                <div class="color-gray"></div>
                <div class="leader-lists">
                    ${jsonMessage.result.content}
                    </div>
                    <div class="write-time">
                        发表时间:<span class="time">${jsonMessage.result.composetime}</span>
                    </div>
                </div>

            </div>
        </div>
    </div>
<jsp:include page="../include/footer.jsp"/>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/menu.js"></script>

</body>

</html>