<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
<style>
</style>
<div class="ui container">
    <form action="${pageContext.request.contextPath}/user/updateUsers.do" class="ui form" method="post">
        <c:if test="${jsonMessage.success}">
            <c:set var="user" value="${jsonMessage.result}"/>
        </c:if>
        <input type="hidden" name="Id" value="${user.id}"/>
        <div class="inline field">
            <label>用户名</label>
            <input type="text" placeholder="输入姓名" name="username"
                   value="${user.username}">
        </div>
        <div class="inline field">
            <label>权限</label>
            <c:if test="${roleListJson.success}">
                <c:set var="roleList" value="${roleListJson.result}"/>
                <select name="rank" title="权限">
                    <c:forEach items="${roleList}" var="role">
                        <c:choose>
                            <c:when test="${role.id == user.rank}">
                                <option value="${role.id}" selected>${role.jsmc}</option>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${role.id < userSession.rank}">
                                    <option value="${role.id}" selected>${role.jsmc}</option>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </c:if>
        </div>
        <div class="inline field">
            <label>密码</label>
            <input type="password" placeholder="不更改密码就不填" name="password">
        </div>
        <div class="inline field">
            <label>确认密码</label>
            <input type="password" placeholder="不更改密码就不填" name="rePassword">
        </div>
        <div class="inline field">
            <button class="ui primary button">更改</button>
            <button class="ui red button" type="reset">重置</button>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<c:if test="${jsonMessage2 != null && !jsonMessage2.success }">
    <script>
        $.growl.error({title: "编辑用户提示", message: "${jsonMessage2.result}"});
    </script>
</c:if>


