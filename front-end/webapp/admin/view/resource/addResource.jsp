<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
<style>
    .resourceInput {
        display: none;
    }
</style>
<div class="ui container">
    <form class="ui form" id="resource"
          enctype="multipart/form-data" method="post">
        <span class="browseResource">
            <button class="ui blue basic button selectFile" type="button">选择文件</button>
            <input type="file" name="file" class="resourceInput">
            <span class="show"></span>
        </span>
    </form>
    <form action="${pageContext.request.contextPath}/resource/addCommonResource.do" class="ui form"
          method="post" id="addResource">
        <input type="hidden" name="filename" id="filename">
        <div class="inline field">
            <label>文件所属类别</label>
            <select name="lb" title="资源类别">
                <option value=""></option>
                <c:if test="${newsTypesJson.success}">
                    <c:forEach items="${newsTypesJson.result}" var="newsType">
                        <option value="${newsType.id}">${newsType.typename}</option>
                    </c:forEach>
                </c:if>
            </select>
            <c:if test="${!newsTypesJson.success}">
                ${newsTypesJson.result}
            </c:if>
        </div>
        <div class="inline field">
            <button class="ui primary button" id="uploadResource" type="button">发布</button>
            <button type="reset" class="ui red button">重置</button>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<c:if test="${!jsonMessage.success && jsonMessage.result != null}">
    <script>
        $.growl.error({title: "添加资源提示", message: "${jsonMessage.result}"});
    </script>
</c:if>
<script src="${pageContext.request.contextPath}/admin/lib/jquery.form/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>

<script>
    $("#uploadResource").click(function () {
        $("#resource").ajaxSubmit({
            url: '${pageContext.request.contextPath}/file/uploadFile.do',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                if(data.success){
                    var filePath = data.result;
                    filePath = filePath.substring(filePath.indexOf("file") +4);
                    alert(filePath);
                    if (!filePath) {
                        $.growl.error({title: "添加资源提示", message: "没有选择文件"});
                        return;
                    }
                    $("#filename").val(filePath);
                    $("#addResource").submit();
                }else {
                    $.growl.error({title: "添加资源提示", message: data.result});
                }
            },
            error: function () {
                alert("添加资源出错");
                $.growl.error({title: "添加资源提示", message: "添加资源出错"});
            }
        });
    });
    $(".selectFile").on('click',function () {
        $(".resourceInput").click();
    });
    $(".resourceInput").change(function () {
        var resource = $(this).val().substring($(this).val().lastIndexOf("\\") + 1);
        $(".browseResource .show").text(resource)
    })
</script>

