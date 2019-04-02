<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!--招聘就业----个人简历-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>学院网站招生就业</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon3.ico" type="image/x-icon" />
</head>
<link href="${pageContext.request.contextPath}/front/css/style.css" rel="stylesheet" />

<body>
    <div id="employment">
        <div id="header"></div>
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
                <div class="left-class">
                    <h2>班级列表</h2>
                    <ul>
                        <li>1501班</li>
                        <li>1502班</li>
                        <li>1503班</li>
                        <li>1504班</li>
                        <li>1505班</li>
                    </ul>
                </div>
                <div class="right-class">
                    <div class="top-content">
                        班级 : <span class="class1">1501</span> 专业 : <a href="#" class="profes">计算机科学与技术</a> 人数 : <span class="num">55</span>                        男生 : <span class="boy">37</span> 女生 : <span class="girl">18</span>
                    </div>
                    <div class="personal">
                        <ul>
                            <li>
                                <img src="${pageContext.request.contextPath}/front/img/touxiang.png"> 姓名 :
                                <div class="name">XXX</div>
                                <a href="#">下载简历</a>
                            </li>
                            <li>
                                <img src="${pageContext.request.contextPath}/front/img/touxiang.png"> 姓名 :
                                <div class="name">XXX</div>
                                <a href="#">下载简历</a>
                            </li>
                            <li>
                                <img src="${pageContext.request.contextPath}/front/img/touxiang.png"> 姓名 :
                                <div class="name">XXX</div>
                                <a href="#">下载简历</a>
                            </li>
                            <li>
                                <img src="${pageContext.request.contextPath}/front/img/touxiang.png"> 姓名 :
                                <div class="name">XXX</div>
                                <a href="#">下载简历</a>
                            </li>
                            <li>
                                <img src="${pageContext.request.contextPath}/front/img/touxiang.png"> 姓名 :
                                <div class="name">XXX</div>
                                <a href="#">下载简历</a>
                            </li>
                            <li>
                                <img src="${pageContext.request.contextPath}/front/img/touxiang.png"> 姓名 :
                                <div class="name">XXX</div>
                                <a href="#">下载简历</a>
                            </li>
                        </ul>
                    </div>
                    <div class="pages">
                        <span>页次: <span class="currPage">1</span>/<span class="totalPage">1</span></span>
                        <span>共 <span class="totalRecord">10</span> 条</span>
                        <span>10 条/页</span>
                        <select name="page">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                        </select>
                        <a href="#">首页</a>
                        <a href="#">上一页</a>
                        <a href="#">下一页</a>
                        <a href="#">尾页</a>
                    </div>
                </div>
            </div>
            <jsp:include page="employeInclude/footer.jsp"/>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/ResumeServlet.js"></script>
</body>

</html>