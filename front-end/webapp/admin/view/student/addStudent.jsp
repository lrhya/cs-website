<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">

<div class="ui container">
    <form action="${pageContext.request.contextPath}/student/addStudent.do" class="ui form" id="studentForm">
        <div class="inline field">
            <label>学生学号</label>
            <input type="text" placeholder="输入学号" name="username" value="${student.username}">
        </div>
        <div class="inline field">
            <label>学生姓名</label>
            <input type="text" placeholder="输入姓名" name="name" value="${student.name}">
        </div>
        <div class="inline field">
            <label for="">选择班级名称</label>
            <select name="cid" id="" title="">
                <option value="0"></option>
                <c:forEach items="${clazzListJson.result}" var="clazz">
                    <option value="${clazz.id}">${clazz.name}</option>
                </c:forEach>
            </select>
        </div>
        <input type="hidden" name="photo" id="photo">
        <input type="hidden" name="resume" id="resume">

    </form>
    <div class="inline field">
        <button class="ui primary button" id="addStudent" type="button">添加</button>
        <button class="ui red button">重置</button>
    </div>
    <%--<button class="excxel">批量导入学生</button>--%>
    <%--<div class="exc" style="display: none">--%>
    <form method="post" enctype="multipart/form-data" id="addStudentBatchForm"
          action="${pageContext.request.contextPath}/student/addStudentBatch.do" class="ui form" style="margin-top: 15px">
        <span class="browseExcel">
                <button type="button" class="ui basic blue button browseExcelButton">选择excel文件</button>
                <input type="file" name="excelFile" style="display: none" class="excelInput">
                 <span class="show"></span>
                 <button class="ui blue button" id="addStudentBatch" type="button">批量导入学生</button>
            </span>
        <span class="ui blue button showHelp">使用说明</span>
    </form>
</div>
<%--更换颜色--%>
<div class="ui small modal" id="useModal">
    <div class="header">批量导入学生使用说明</div>
    <p class="description"><i class="warning sign icon red"></i>批量导入学生excel文件，要求每列对应学生一个属性，具体参考导入模板</p>
    <div class="content">
        <a href="${pageContext.request.contextPath}/file/downLoadFile.do?filePath=/file/addStudentBatchTemplet.xlsx" style="background-color:#fff;">
            下载批量导入学生excel模板
        </a>
    </div>
</div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/jquery.form/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<c:if test="${jsonMessage != null && !jsonMessage.success}">
    <script>
        $.growl.error({title: "添加学生提示", message: "${jsonMessage.result}"});
    </script>
</c:if>
<script type="text/javascript">
    $(".browseExcel > .browseExcelButton").on('click', function () {
        $(".browseExcel > input").click()
    });
    $(".browseExcel > input").change(function () {
        var excelName = $(this).val().substring($(this).val().lastIndexOf("\\") + 1);
        $(".browseExcel > .show").text(excelName)
    });
    $(".showHelp").click(function () {
        $("#useModal").modal("show")
    });
    //JS校验form表单信息
    function checkData() {
        var fileDir = $(".excelInput").val();
        var suffix = fileDir.substr(fileDir.lastIndexOf("."));
        if (!fileDir) {
            alert("选择需要导入的Excel文件！");
            return false;
        }
        if (".xls" !== suffix && ".xlsx" !== suffix) {
            alert("选择Excel格式的文件导入！");
            return false;
        }
        return true;
    }
    //ajaxSubmit上传文件操作
    $(document).ready(function () {
        $('#addStudentBatch').click(function () {
            if (!checkData()) {
                return;
            }
            $('#addStudentBatchForm').ajaxSubmit({
                url: '${pageContext.request.contextPath}/student/addStudentBatch.do',
                success: function (msg) {
                    $.growl.error({title: "添加学生提示", message: msg});
                    $(".excelInput").val("");
                },
                error: function () {
                    alert("导入excel出错！")
                    //$.growl.error({title: "添加学生提示", message: "导入excel出错！"});
                }
            });
        });
    });
</script>

<script>
    $(function () {
        $("#addStudent").click(function () {
            $("#studentForm").submit();
        })
    });
        $(".excxel").click(function () {
        $('.exc').css("display", "block");
    });
</script>

