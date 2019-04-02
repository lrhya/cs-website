<%--
  Created by IntelliJ IDEA.
  User: rf
  Date: 2017/8/16
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
    <script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/admin/lib/jquery.form/jquery.form.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/file/uploadFile.do" method="post" enctype="multipart/form-data" id="upload">
    <input type="file" name="test"><br>
    <button type="button" id="up">上传</button>
</form>
<form action="${pageContext.request.contextPath}/file/uploadFile.do"  method="post" enctype="multipart/form-data" id="resumeForm" >
    <input type="file" name="resumeForm">
    <div class="inline field">
        <button  id="addStudent" type="button">添加</button>
        <button class="ui red button">重置</button>
    </div>
</form>
<script>
    $(function () {
        $("#up").click(function () {
//            alert("tst");
            $("#upload").ajaxSubmit({
                url:"${pageContext.request.contextPath}/file/uploadFile.do",
                dataType:"json",
                success : function(data) {
                    alert('成功上传！'+data.result);

                }
            })
        });
        $("#addStudent").click(function () {
                $("#resumeForm").ajaxSubmit({
                        url: "${pageContext.request.contextPath}/file/uploadFile.do",
                        success: function (data) {
                            alert("test");
                            alert(data.result);
//                    $("#studentForm").submit()
                        },
                        error: function () {
                            alert("error");
                        }
                    }
                )
            }
        )
    });
</script>
</body>
</html>
