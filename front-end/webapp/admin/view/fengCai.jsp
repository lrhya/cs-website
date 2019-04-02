<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>风采展示</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
    <style>
        .upload{
            padding: 10px 0;
        }
        .upload .upload-form span{
            color: #009999;
        }
        .upload .upload-form span:hover{
            color: #f30;
            cursor: pointer;
        }
        .upload #file{
            display: none;
        }
        .list{
            display: none;
            margin-top: 10px;
        }
        .list .filename{
            color:#337ab7;
        }
        .list .cancel{
            margin-left: 10px;
            color: #009999;
        }
        .list .cancel:hover{
            color: #f30;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div>
    <%--头部--%>
    <jsp:include page="../view/include/header.jsp"/>
    <!--中间内容-->
    <div id="middle">
        <!--左边导航-->
        <jsp:include page="../view/include/leftNav.jsp"/>
        <!--主体-->
        <div id="main">
            <div class="upload">
                <form class="upload-form" name="upload" method="post"  enctype="multipart/form-data">
                    <button id="browse" class="ui blue button" type="button">选择图片</button>
                    <input id="file" name="filename" type="file">
                    <span>开始上传</span>|
                    <span>取消上传</span>
                </form>
                <div class="list">
                    <span class="filename"></span>
                    <span class="cancel">删除</span>
                </div>
            </div>

            <table class="ui celled table center aligned">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>文件名</th>
                    <th>上传时间</th>
                    <th>显示状态</th>
                    <th>描述</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>1112709153926801rpucwbmvo99ixqfz4t.jpg</td>
                    <td>2012-05-31 02:24:46</td>
                    <td>
                        <input type="radio" name="radiobutton" value="radiobutton" checked> 是
                        <input type="radio" name="radiobutton" value="radiobutton"> 否
                    </td>
                    <td>
                        <button class="ui green button btn-describe">描述</button>
                    </td>
                    <td>
                        <button class="ui red button btn-delete">删除</button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="ui small modal delete-modal">
                <div class="header"><i class="warning sign icon red"></i>删除风采</div>
                <div class="content">
                    <p>你确定删除本条风采吗？</p>
                </div>
                <div class="actions">
                    <div class="ui negative button">否</div>
                    <div class="ui positive button">是</div>
                </div>
            </div>
            <div class="ui small modal describe-modal">
                <div class="header">添加描述</div>
                <div class="content">
                    <div class="ui form">
                        <div class="field">
                            <textarea rows="2"></textarea>
                        </div>
                    </div>
                </div>
                <div class="actions">
                    <div class="ui negative button">否</div>
                    <div class="ui positive button">是</div>
                </div>
            </div>

        </div>
    </div>
    <%--尾部--%>
    <jsp:include page="../view/include/footer.jsp"/>
    <script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
        <script>
            $('#browse').click(function () {
                $('#file').click();
            });
            $('#file').change(function () {
                if(this.value){
                    $('.filename').text(this.files[0].name);
                    $('.list').fadeIn();
                }
            });
            $('.list .cancel').click(function () {
                $('#file').value=false;
                $('.filename').text('');
                $('.list').hide();
            });

            $('.btn-delete').click(function () {
                $('.delete-modal').modal('show');
            });
            $('.btn-describe').click(function () {
                $('.describe-modal').modal('show');
            });
        </script>
</body>
</html>
