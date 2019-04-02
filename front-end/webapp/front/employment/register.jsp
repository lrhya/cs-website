<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!--  招聘就业注册页面  -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>学院网站招生就业</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon3.ico" type="image/x-icon" />
</head>
<link href="../css/style.css" rel="stylesheet"  />

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
            <div class="register">
                <div class="title">用人单位注册</div>
                <form action="" method="post">
                    <ul class="regiU">
                        <li class="after"><span>用户名:
                            <input type="text" name="username" id="username"></span>
                            <span id="us" class="te">用户名长度3-20</span>
                        </li>
                        <li class="after">
                            <span>密码:<input type="password" name="password" id="password"></span>
                            <span id="pa" class="te">密码6-10数字.字母.下划线</span>
                        </li>
                        <li class="after">
                            <span>确认密码:
                                    <input type="password" name="password1" id="password1"></span>
                            <span id="pa1" class="te">请再输一遍</span>
                        </li>
                        <li class="after">
                            <span>单位网址:<input type="text"  id="http"></span>
                            <span id="ht" class="te">请输入网址</span>
                        </li>
                        <li class="after">
                            <span>单位邮箱:<input type="text" id="email"></span>
                            <span id="em" class="te">邮箱不能为空</span>
                        </li>
                        <li><span>单位名称:<input type="text"></span></li>
                        <li><span>联系人:<input type="text"></span></li>
                        <li class="after">
                            <span>所在地:<input type="text" id="location"></span>
                            <span id="loc" class="te"></span>
                        </li>
                        <li><span>联系电话:<input type="text"></span></li>
                        <li><span>单位规模:<input type="text"></span></li>
                        <li><span>邮政编码:<input type="text"></span></li>
                        <li><span>营业执照编号:<input type="text"></span></li>
                        <li><span>法人代表姓名：<input type="text" name="username"></span></li>
                        <li>
                            <span>单位简介:<textarea name="summary" cols="60" rows="5" id="summary"></textarea></span>
                        </li>
                    </ul>
                    <div class="picS">营业执照图片:<input name="licence" type="file">
                            <span class="text">请上传*.gif,*jpg,*.png的图片且必须小于1M</span>
            </div>
            <div class="regi">
                <input type="submit" id="mysubmit" disabled="disabled" value="提交" />
            </div>
            <div class="picS marBot">
                <input type="checkbox" id="agree"> 我已阅读并同意学校注册协议
                <a href="javascript:void(0)" onclick="open()" id="open">点击阅读单位注册协议</a>(只有同意本注册协议才能注册)
            </div>
            </form>
        </div>
            <jsp:include page="employeInclude/footer.jsp"/>
    </div>

    </div>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/register.js">

    </script>
    <script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/front/js/ResumeServlet.js"></script>
</body>
<script>
    function open() {
        window.open('protocol.html','阅读注册协议','width=700,height=400');
    }
</script>
</html>