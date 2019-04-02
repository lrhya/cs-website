<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>教师简介</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
    <link href="${pageContext.request.contextPath}/front/css/main.css" rel="stylesheet"/>
    <style>
        .zc{
            width: 130px;
        }
        .info{
            width: 300px;
            margin: 80px auto;
        }
    </style>
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
                <a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=${page.dataList[0].typeId}">${page.dataList[0].typename}</a>
            </div>
            <c:if test="${jsonMessage.success}">
                <c:set var="teacher" value="${jsonMessage.result}"/>
                <div class="">

                        <h2 class id="title">${teacher.name}老师简介</h2>
                        <span class="fr zc"><span>职称：</span>${teacher.zhicheng}</span>
                        <div class="jianjie">${teacher.jianjie}</div>
                        <c:if test="${teacher.jianjie==null}">
                            <div class="info">
                                暂时没有该老师的相关信息！
                            </div>
                        </c:if>

                </div>
            </c:if>
            <c:if test="${!jsonMessage.success}">
                ${jsonMessage.result}
            </c:if>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>

</html>