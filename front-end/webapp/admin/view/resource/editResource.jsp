<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .container {
        padding-top: 12px;
    }
</style>

<div class="ui container">
    <form action="${pageContext.request.contextPath}/resource/updateResource.do" class="ui form" method="post">
        <c:if test="${jsonMessage.success}">
        <c:set var="resource" value="${jsonMessage.result}"/>
        <input type="hidden" name="id" value="${resource.id}">
        <div class="inline field">
            <label class="" for="title">文件名称</label>
            <input type="text" name="filename" id="title" placeholder="输入文件名称" value="${resource.filename}">
        </div>
        <div class="inline field">
            </c:if>
            <label class="" for="newsType">新闻类型</label>
            <select name="lb" id="newsType">
                <c:if test="${newsTypesJson.success}">
                    <c:forEach items="${newsTypesJson.result}" var="newsType">
                        <c:choose>
                            <c:when test="${newsType.id == resource.lb}">
                                <option value="${newsType.id}" selected>${newsType.typename}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${newsType.id}">${newsType.typename}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:if>
            </select>
            <a href="${pageContext.request.contextPath}/file/downLoadFile.do?filePath=${resource.filePath}">查看资源</a>
            <%--<span class="browseResource">--%>
                <%--<button class="ui  button blue basic" type="button">更换资源</button>--%>
                <%--<span class="show"></span>--%>
                <%--<input type="file" id="resourceInput" style="display: none">--%>
            <%--</span>--%>
            <div class="inline field">
                <label>文件是否展示</label>
                <c:choose>
                    <c:when test="${resource.ispost == 1 }">
                        <input type="radio" name="ispost" value="1" checked class="radio" title="">是
                        <input type="radio" name="ispost" value="0" class="radio" title="">否
                    </c:when>
                    <c:otherwise>
                        <input type="radio" name="ispost" value="1" class="radio" title="">是
                        <input type="radio" name="ispost" value="0" checked class="radio" title="">否
                    </c:otherwise>
                </c:choose>
                <%--<div class="ui toggle checkbox">--%>
                <%--<input type="checkbox"  name="ispost2" checked>否--%>
                <%--</div>--%>
            </div>
            <c:if test="${!newsTypesJson.success}">
                ${newsTypesJson.result}
            </c:if>
        </div>
        <div class="inline field">
            <button type="submit" class="ui primary button btn-submit">修改</button>
            <button type="reset" class="ui red button">重置</button>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<c:if test="${!jsonMessage.success && jsonMessage.result != null}">
    <script>
        $.growl.error({    title: "编辑资源提示", message: "${jsonMessage.result}" });
    </script>
</c:if>
<script>
//    $('.checkbox.toggle').checkbox('attach events', '.toggle.button');
    $(".browseResource > button").on('click',function () {
        $(".photoInput").click();
    });
    $(".resourceInput").change(function () {
        var photo = $(this).val().substring($(this).val().lastIndexOf("\\") + 1);
        $(".browseResource .show").html(photo)
    });
</script>

