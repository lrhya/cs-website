<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎登陆计算机科学与技术后台管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
    <script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
    <style>
        body{
            background: url('${pageContext.request.contextPath}/front/img/login.jpg')
        }
    </style>
</head>
<body>
    <div id="admin">
        <div class="adminUser">后台管理</div>
        <form action="${pageContext.request.contextPath}/user/login.do" name="login" method="post">
            <ul class="adLogin">
            <li>
                <label for="user">用户名 :</label>
                <input type="text" name="username" id="user" value="" placeholder="输入用户名"/>
            </li>
            <li>
                <label for="pwd">密&nbsp; &nbsp;码 :</label>
                <input type="password" name="password" id="pwd" value="" placeholder="输入密码"/>
            </li>
            <li class="code">
               <label for="cod">验证码 :</label>
                <input type="text" style="width:75px;vertical-align: middle;" name="inputCode" id="cod" size="4" maxlength="4" placeholder="输入验证码"/>
                <span><img src="${pageContext.request.contextPath}/getCaptchaImg.do" title ="看不清，点击刷新" id="codeImg"/>    </span>
                <a href="javascript:updateCode()" style="color: whitesmoke">看不清，点击换一张</a>
            </li>  
            <li id="but">
                    <input type="submit" value="登录">
                    <input onclick="window.history.go(-1);" value="返回" type="button">
            </li>          
        </ul>
        </form>
        <c:if test="${jsonMessage!=null && !jsonMessage.success && jsonMessage.result != null}">
            <script>
                $.growl.error({    title: "登录失败", message: "${jsonMessage.result}" });
            </script>
        </c:if>
    </div>


    <script>
        function updateCode(){
            $("#codeImg").attr("src","${pageContext.request.contextPath}/getCaptchaImg.do?"+new Date());
        }
    </script>
</body>
</html>