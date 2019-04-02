<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>wangEditor 上传图片</title>
</head>
<body>
    <p>wangEditor 上传图片到服务器</p>
    <div id="div3">
        <p>欢迎使用 wangEditor 富文本编辑器</p>
    </div>

    <p>wangEditor 以base64保存图片文件</p>
    <div id="div4">
        <p>欢迎使用 wangEditor 富文本编辑器</p>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;

        var editor2 = new E('#div3');
        editor2.customConfig.debug = true;
        editor2.customConfig.uploadImgServer = '${pageContext.request.contextPath}/file/uploadPicture.do';
        editor2.customConfig.uploadImgFileName = 'myFileName';
        editor2.create();

        var editor1 = new E('#div4');
        editor1.customConfig.uploadImgShowBase64 = true;
        editor1.create()
    </script>
</body>
</html>