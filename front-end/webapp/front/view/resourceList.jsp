<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <c:set var="base" value="${pageContext.request.contextPath}"/>
    <title>资源列表</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
    <link href="${base}/front/css/main.css" rel="stylesheet"/>
    <style>
        a{
            color: inherit;
        }
        .cont h3{
            text-align: center;
            color: inherit;
        }
        .resourceList{
            width: 1156px;
            text-align: center;
            margin: 4px auto;
            border-collapse: collapse;
        }
        .resourceList th,.resourceList td{
            border: 1px solid #666;
            border-collapse: collapse;
            padding: 10px;
        }
        .page{
            margin: 10px auto;
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
            <h3>资源列表</h3>
            <c:if test="${jsonMessage.success}">
                <c:set var="page" value="${jsonMessage.result}"/>
                <table class="resourceList">
                    <thead>
                    <tr>
                        <td>编号</td>
                        <td>资源文件</td>
                        <td>所属类别</td>
                        <td>上传日期</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.dataList}" var="resource" varStatus="num">
                        <tr>
                            <td>${num.count}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/file/downLoadFile.do?filePath=/file${resource.filePath}"> ${resource.filename}</a>
                            </td>
                            <td>${resource.typename}</td>
                            <td>${resource.compostime}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <div class="page fr">
                <span class="item">当前第${page.currentPage}页</span>
                <span class="item">共${page.totalPage}页</span>
                <span class="item">每页显示${page.pageSize}条</span>
                <a href="${pageContext.request.contextPath}/resource/front/resourceNav.do?pageNum=1"
                   class="active item first">首页</a>
                <a href="${pageContext.request.contextPath}/resource/front/resourceNav.do?pageNum=${page.currentPage -1}"
                   class="item pre">上一页</a>
                <a href="${pageContext.request.contextPath}/resource/front/resourceNav.do?pageNum=${page.currentPage +1}"
                   class="item next">下一页</a>
                <a href="${pageContext.request.contextPath}/resource/front/resourceNav.do?pageNum=${page.totalPage}"
                   class="item last">尾页</a>
                <span class="item">跳转到 <input type="text" style="width: 36px" class="goPage" title="">页</span> <a
                    href="javascript:go()" class="active item">确定</a>
            </div>

        </div>
    </div>

</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
