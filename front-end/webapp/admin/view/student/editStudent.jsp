<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
<style>
    .browsePhoto, .browseResume {
        cursor: pointer;
    }

    .photoInput, .resumeInput {
        display: none;
    }

    .photo {
        width: 700px;
        height: 500px;
    }
</style>
<div class="ui container">
    <form action="${pageContext.request.contextPath}/student/updateStudent.do" class="ui form" id="studentForm">
        <c:if test="${jsonMessage.success}">
            <c:set var="student" value="${jsonMessage.result}"/>
            <input type="hidden" name="id" value="${student.id}" id="studentId">
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
                        <c:choose>
                            <c:when test="${clazz.id==student.cid}">
                                <option value="${clazz.id}" selected>${clazz.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${clazz.id}">${clazz.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
        </c:if>
    </form>
    <div class="inline field">
        <button class="ui primary button" id="editStudent" type="button">更改</button>
        <button class="ui red button">重置</button>
    </div>
</div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<c:if test="${!jsonMessage2.success && jsonMessage2.result != null}">
    <script>
        $.growl.error({title: "编辑学生提示", message: "${jsonMessage2.result}"});
    </script>
</c:if>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/jquery.form/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    $("#editStudent").click(function () {
        $("#studentForm").submit();
            var studentId = $("#studentId").val();
        }
    )


</script>

