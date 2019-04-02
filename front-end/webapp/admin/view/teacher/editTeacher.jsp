<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/wangEditor.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
<div class="ui container">
    <form action="${pageContext.request.contextPath}/teacher/updateTeacher.do" class="ui form" method="post">
        <c:if test="${teacherTypeJson.success}">
            <c:set var="teacherTypes" value="${teacherTypeJson.result}"/>
        </c:if>
        <c:if test="${jsonMessage.success}">
            <c:set var="teacher" value="${jsonMessage.result}"/>
        </c:if>
        <input type="hidden" value="${teacher.id}" id="id" name="id">
        <div class="inline field required">
            <label class="" for="title">教师姓名</label>
            <input type="text" name="name" id="title" placeholder="输入教师姓名" value="${teacher.name}">
        </div>
        <div class="inline field required">
            <label class="" for="zhichenghao">教师职称</label>
            <select name="zhichenghao" id="zhichenghao">
                <c:forEach items="${teacherTypes}" var="teacherType">
                    <c:choose>
                        <c:when test="${teacherType.id == teacher.zhichenghao}">
                            <option value="${teacherType.id}" selected>${teacherType.zhicheng}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${teacherType.id}">${teacherType.zhicheng}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
            <c:if test="${!teacherTypeJson.success}">
                ${teacherTypeJson.result}
            </c:if>
        </div>
        <div class="inline field required">
            <label class="" for="jslx">教师类型</label>
            <select name="id" id="jslx">
                <c:forEach items="${jslxJson.result}" var="jslx">
                    <c:choose>
                        <c:when test="${jslx.id == teacher.jslx}">
                            <option value="${jslx.id}" selected>${jslx.lxmc}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${jslx.id}">${jslx.lxmc}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
            <c:if test="${!jslxJson.success}">
                ${jslxJson.result}
            </c:if>
        </div>
        <input name="jianjie" id="jianjie" type="hidden" title="content"/>
        <div class="inline field required">
            <label class="" for="content">编辑教师简介</label>
            <div id="content">${teacher.jianjie}</div>
        </div>
        <div class="inline field">
            <a class="ui primary button" href="javascript:updateTeacher()"> 修改</a>
            <button class="ui red button" type="reset">重置</button>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<c:if test="${updateMsg != null && !updateMsg.success}">
    <script>
        $.growl.error({title: "编辑教师提示", message: "${updateMsg.result}" });
    </script>
</c:if>
<script>
    var E = window.wangEditor;
    var editor = new E('#content');
    editor.customConfig.uploadFileName = 'uploadPic';
    editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/file/uploadPicture.do';

    editor.create();
    function updateTeacher() {
        $("#jianjie").val(editor.txt.html());
        $("form").submit();
    }
</script>

