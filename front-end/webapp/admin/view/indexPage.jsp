<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
    <script src="${pageContext.request.contextPath}/admin/js/tab.js"></script>
    <style>
        .column a{
            display: block;
        }
        .column .segment {
            padding: 0;
            height: 100px;
            border-radius: 5px;
            text-align: center;
        }

        .column .left {
            height: 100%;
            width: 40%;
            background-color: #54ade8;
            border-radius: 5px 0 0 5px;
        }

        .column .left i {
            color: #fff;
            line-height: 100px;
            font-size: 40px;
        }

        .column .right {
            width: 60%;
            height: 100%;

        }

        .column .right span {
            line-height: 100px;
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>

    <!--左边导航-->
    <!--主体-->
    <div id="main">
        <h3 class="ui center aligned header"></h3>
        <div class="ui three column doubling stackable grid">
            <div class="column">
                <a href="javascript:void(0);" onclick="addPTab('添加新闻','${pageContext.request.contextPath}/news/toAddNewsPage.do')">
                    <div class="ui segment clearFix">
                        <div class="left fl"><i class="plus square outline icon"></i></div>
                        <div class="right fl"><span>添加新闻</span></div>
                    </div>
                </a>
            </div>
            <div class="column">
                <a href="javascript:void(0);" onclick="addPTab('新闻列表','${pageContext.request.contextPath}/news/newsList.do')">
                    <div class="ui segment clearFix">
                        <div class="left fl" style="background-color:#F7B824;"><i class="newspaper icon"></i></div>
                        <div class="right fl"><span>新闻列表</span></div>
                    </div>
                </a>
            </div>
            <div class="column">
                <a href="javascript:void(0);" onclick="addPTab('资源列表','${pageContext.request.contextPath}/resource/findResourcePage.do')">
                    <div class="ui segment clearFix">
                        <div class="left fl" style="background-color:#5FB878;"><i class="file text outline icon"></i></div>
                        <div class="right fl"><span>资源列表</span></div>
                    </div>
                </a>
            </div>
            <c:if test="${userSession.rank > 2}">
                <div class="column">
                    <a href="javascript:void(0);" onclick="addPTab('添加用户','${pageContext.request.contextPath}/user/toAddUi.do')">
                        <div class="ui segment clearFix">
                            <div class="left fl" style="background-color:#FF5722;"><i class="add user icon"></i></div>
                            <div class="right fl"><span>添加用户</span></div>
                        </div>
                    </a>
                </div>
            </c:if>
            <c:if test="${userSession.rank > 1}">
                <div class="column">
                    <div class="ui segment">
                        <a href="javascript:void(0);" onclick="addPTab('师资队伍','${pageContext.request.contextPath}/teacher/findTeacherPage.do')">
                            <div class="ui segment clearFix">
                                <div class="left fl" style="background-color:#009688;"><i class="send outline icon"></i></div>
                                <div class="right fl"><span>师资队伍</span></div>
                            </div>
                        </a>
                    </div>
                </div>
            </c:if>
            <c:if test="${userSession.rank > 1}">
                <div class="column">
                    <div class="column">
                        <div class="ui segment">
                            <a href="javascript:void(0);" onclick="addPTab('学生列表','${pageContext.request.contextPath}/student/findStudentPage.do')">
                                <div class="ui segment clearFix">
                                    <div class="left fl" style="background-color:#2F4056;"><i class="student icon"></i></div>
                                    <div class="right fl"><span>学生列表</span></div>
                                </div>
                            </a>
                        </div>
                    </div>
            </c:if>
        </div>
</div>

<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<%--<script src="${pageContext.request.contextPath}/admin/js/tab2.js"></script>--%>
</body>
</html>