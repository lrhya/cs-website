<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
<style>
    #erro {
        background-color: red;
        font-size: 20px;
        color: wheat;
        display: none;
    }

</style>


    <form action="${pageContext.request.contextPath}/user/addUsers.do" class="ui form">
        <div class="ui form">
            <div class="inline field">
                <label>用户名</label>
                <input type="text" placeholder="输入姓名" name="username" id="username"
                       value="${user.username}">
            </div>
            <div class="inline field">
                <label>权限</label>
                <c:if test="${roleListJson.success}">
                    <c:set var="roleList" value="${roleListJson.result}"/>
                    <select name="rank" title="权限">
                        <c:forEach items="${roleList}" var="role">
                            <c:if test="${role.id < userSession.rank}">
                                <option value="${role.id}">${role.jsmc}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </c:if>
            </div>
            <div class="inline field">
                <label>密码</label>
                <input type="password" placeholder="输入密码" name="password" id="password1"
                       value="${user.password}">
            </div>
            <div class="inline field">
                <label>确认密码</label>
                <input type="password" placeholder="再次输入密码" id="password2" value="${rePassword}" name="rePassword">
                <div id="erro">两次密码不一致</div>
            </div>
            <div class="inline field">
                <label> </label>
                <button class="ui primary button">添加</button>
                <button class="ui red button">重置</button>
            </div>
        </div>
    </form>

<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<c:if test="${!jsonMessage.success && jsonMessage.result != null}">
    <script>
        $.growl.error({title: "添加用户提示", message: "${jsonMessage.result}"});
    </script>
</c:if>
<script>
    $(document).ready(function () {
        $('#password2').blur(function () {
            var p1 = $('#password1').val();
            var p2 = $('#password2').val();
            if (p1 !== p2) {
                $('#erro').css("display", "inline");
            }
            else {
                $('#erro').css("display", "none");
            }
        });

    });
    $('.message .close').on('click', function () {
        $(this).closest('.message').transition('fade');
    });
</script>

