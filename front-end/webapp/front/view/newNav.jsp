<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:set var="base" value="${pageContext.request.contextPath}"/>
    <c:if test="${jsonMessage.success}">
        <title>${jsonMessage.result.dataList[0].typename}</title>
    </c:if>
    <c:if test="${!jsonMessage.success}">
        <title>动态新闻</title>
    </c:if>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
    <link href="${base}/front/css/main.css" rel="stylesheet"/>
</head>
<body>
<%--头部--%>
<jsp:include page="../include/header.jsp"/>
<%--头部导航--%>
<jsp:include page="../include/sideNav.jsp"/>
<div class="main">
    <div id="content">
        <jsp:include page="../include/nav_picture.jsp"/>
        <div class="cont-content">
            <div class="student-lists">
                <c:choose>
                    <c:when test="${jsonMessage.success}">
                        <c:set value="${jsonMessage.result}" var="page"/>
                        <div class="path">
                            当前位置 :
                            <a href="${pageContext.request.contextPath}/toIndex.do">首页</a>>>
                            <%--<span >人才培养</span>>>--%>
                            <a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=${page.dataList[0].typeId}">${page.dataList[0].typename}</a>
                        </div>
                        <div id="title">
                                ${page.dataList[0].typename}
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div id="title">
                            动态新闻
                        </div>
                    </c:otherwise>
                </c:choose>

                <div class="st-list">
                    <div class="lists">
                        <c:if test="${jsonMessage.success}">
                            <ul>
                                <c:forEach items="${page.dataList}" var="news">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/news/front/findNewsById.do?id=${news.id}"> ${news.title}</a>
                                        <span class="time">${news.composetime}</span>
                                    </li>
                                </c:forEach>
                            </ul>
                    </div>
                </div>
                <div class="page">
                    <span class="currPage">当前第${page.currentPage}页</span>
                    <span class="totalPage">共${page.totalPage}页</span>
                    <span>共 ${page.totalRecord}条</span>
                    <span>10条/页</span>
                    <a href="${base}/news/front/newTitleNav.do?newsType=${page.dataList[0].newstype}">首页</a>
                    <a href="${base}/news/front/newTitleNav.do?pageNum=${page.currentPage-1}&newsType=${jsonMessage.result.dataList.get(0).newstype}">上一页</a>
                    <a href="${base}/news/front/newTitleNav.do?pageNum=${page.currentPage+1}&newsType=${jsonMessage.result.dataList.get(0).newstype}">下一页</a>
                    <a href="${base}/news/front/newTitleNav.do?pageNum=${page.totalPage}&newsType=${jsonMessage.result.dataList.get(0).newstype}">尾页</a>
                </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
