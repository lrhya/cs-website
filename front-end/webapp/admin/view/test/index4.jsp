<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台首页</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon3.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
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
            border-radius: 5px 0 0px 5px;
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
<!--顶部-->
<jsp:include page="../include/header.jsp"/>
<!--中间内容-->
<div id="middle">
    <!--左边导航-->
    <jsp:include page="../include/leftNav.jsp"/>
    <!--主体-->
    <div id="main">
        <h3 class="ui center aligned header"></h3>
        <div class="ui three column doubling stackable grid">
            <div class="column">
                <a href="${pageContext.request.contextPath}/news/toAddNewsPage.do">
                    <div class="ui segment clearFix">
                        <div class="left fl"><i class="plus square outline icon"></i></div>
                        <div class="right fl"><span>添加新闻</span></div>
                    </div>
                </a>
            </div>
            <div class="column">
                <a href="${pageContext.request.contextPath}/news/newsList.do">
                    <div class="ui segment clearFix">
                        <div class="left fl" style="background-color:#F7B824;"><i class="file text outline icon"></i>
                        </div>
                        <div class="right fl"><span>新闻列表</span></div>
                    </div>
                </a>
            </div>
            <div class="column">
                <a href="${pageContext.request.contextPath}/user/toAddUi.do">
                    <div class="ui segment clearFix">
                        <div class="left fl" style="background-color:#FF5722;"><i class="add user icon"></i></div>
                        <div class="right fl"><span>添加用户</span></div>
                    </div>
                </a>
            </div>
            <div class="column">
                <div class="ui segment">
                    <a href="${pageContext.request.contextPath}/teacher/findTeacherPage.do">
                        <div class="ui segment clearFix">
                            <div class="left fl" style="background-color:#009688;"><i class="send outline icon"></i></div>
                            <div class="right fl"><span>师资队伍</span></div>
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>

<jsp:include page="../include/footer.jsp"/>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<%--<script src="${pageContext.request.contextPath}/admin/js/tab2.js"></script>--%>
</body>
</html>