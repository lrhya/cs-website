<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>湖北师范大学计算机科学与技术学院网站</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }
        html {
            height: 100%;
            color: #444;
        }
        body {
            height: 100%;
            background: linear-gradient(#f2f2f2, #e3e5e4);
            position: relative;
        }
        #not-found {
            position: absolute;
            top: 30%;
            left: 20%;
        }
        .title {
            font-size: 32px;
            font-weight: bold;
        }
        a {
            display: inline-block;
            margin-top: 1em;
            text-decoration: none;
        }
        .title a:link,
        .title a:visited {
            color: #f30;
        }
        .title a:hover {
            color: #666;
        }
        .sub-title {
            font-size: 16px;
            margin-top: 10px;
        }

    </style>
</head>
<body>
<div id="not-found">
    <div class="title">哦噢, 您访问的网站不存在, 请检查您的地址。</div>
    <div class="sub-title">Oh, oh! The site you visited does not exist, please check your address.</div>
    <a href="JavaScript:history.go(-1)">返回上一页</a>
</div>
</body>
</html>
