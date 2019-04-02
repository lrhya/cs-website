<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!--招聘就业主页-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:set var="base" value="${pageContext.request.contextPath}/"/>
    <title> ${jsonMessage.result.dataList[0].typename}</title>
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
            <div class="lists-resc">
                <c:if test="${jsonMessage.success}">
                    <c:set value="${jsonMessage.result}" var="page"/>
                    <div class="title">
                            ${jsonMessage.result.dataList[0].typename}
                    </div>
                    <div class="list-resc">
                        <ul>
                            <c:forEach items="${page.dataList}" var="empNews">
                                <li>
                                    <a href="${pageContext.request.contextPath}/employment/front/findEmploymentNewsById.do?id=${empNews.id}"> ${empNews.title}</a>
                                    <span class="time">${empNews.composetime}</span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <div class="page fr">
                    <span class="currPage">当前第${page.currentPage}页</span>
                    <span class="totalPage">共${page.totalPage}页</span>
                    <span>共 ${page.totalRecord}条</span>
                    <span >10条/页</span>
                    <a href="${base}/employment/front/employeNewTitleNav.do?newsType=${page.dataList[0].newstype}">首页</a>
                    <a href="${base}/employment/front/employeNewTitleNav.do?newsType=${page.dataList[0].newstype}&pageNum=${page.currentPage-1}">上一页</a>
                    <a href="${base}/employment/front/employeNewTitleNav.do?newsType=${page.dataList[0].newstype}&pageNum=${page.currentPage+1}">下一页</a>
                    <a href="${base}/employment/front/employeNewTitleNav.do?newsType=${page.dataList[0].newstype}&pageNum=${page.totalPage}">尾页</a>
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