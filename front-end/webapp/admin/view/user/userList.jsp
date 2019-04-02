<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .user .find {
        margin: 3px 30px;
    }

    .user .add {
        margin: 4px 40px;
    }
</style>

<div class="ui container">
    <form action="${pageContext.request.contextPath}/user/findUsersPage.do" class="ui form user" method="post">
        <div class="ui search fl">
            <div class="ui icon input">
                <input class="prompt" id="username" type="text" placeholder="输入用户名" name="username"
                       value="${v_user.username}">
            </div>
            <div class="results"></div>
        </div>
        <button class="ui teal button fl find"><i class="icon search"></i>查找</button>
        <a id="btn-add" class="ui blue button fl find" href="javascript:void(0)"><i
                class="icon add"></i>添加
        </a>
    </form>
    <table class="ui celled table center aligned striped selectable mini">
        <thead>
        <tr>
            <th>选择</th>
            <th>用户名</th>
            <th>权限</th>
            <th colspan="2">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${jsonMessage.success}">
        <c:set var="users" value="${jsonMessage.result.dataList}"/>
        <c:set var="page" value="${jsonMessage.result}"/>
        <c:forEach items="${users}" var="user">
            <c:if test="${user.rank < userSession.rank}">
                <tr>
                    <th><input type="checkbox" name="id" title=""></th>
                    <td>${user.username}</td>
                    <td>${user.jsmc}</td>
                    <td class="center aligned">
                        <a class="ui button blue mini"
                           href="${pageContext.request.contextPath}/user/toEditUi.do?Id=${user.id}"><i
                                class="icon edit"></i>编辑</a>
                    </td>
                    <td class="center aligned">
                        <a class="ui button red mini btn-delete"
                           href="javascript:deleteUser('${user.id}' , '${user.username}')"><i
                                class="icon trash"></i>删除</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <div class="ui small modal" id="deleteUser">
        <div class="header"><i class="warning sign icon red"></i>删除用户</div>
        <div class="content">
            <p>你确定删除<b></b>用户吗？</p>
        </div>
        <div class="actions">
            <div class="ui negative button">确定</div>
            <div class="ui positive button">取消</div>
        </div>
    </div>
    <div class="ui right floated pagination menu">
        <span class="item">当前第${jsonMessage.result.currentPage}页</span>
        <span class="item">共${jsonMessage.result.totalPage}页</span>
        <span class="item">每页显示${jsonMessage.result.pageSize}条</span>
        <a href="${pageContext.request.contextPath}/user/findUsersPage.do?username=${v_user.username}&pageNum=1"
           class="active item first">首页</a>
        <a href="${pageContext.request.contextPath}/user/findUsersPage.do?username=${v_user.username}&pageNum=${page.currentPage -1}"
           class="item pre">上一页</a>
        <a href="${pageContext.request.contextPath}/user/findUsersPage.do?username=${v_user.username}&pageNum=${page.currentPage +1}"
           class="item next">下一页</a>
        <a href="${pageContext.request.contextPath}/user/findUsersPage.do?username=${v_user.username}&pageNum=${page.totalPage}"
           class="item last">尾页</a>
        <span class="item">跳转到 <input type="text" style="width: 36px" class="goPage" title="">页</span> <a
            href="javascript:go()" class="active item">确定</a>
    </div>
    </c:if>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    function go() {
        var num = $(".goPage").val();
        var username = $("#username").val();
        window.location.href = "${pageContext.request.contextPath}/user/findUsersPage.do?username=" + username + "&pageNum=" + num;
    }
    function deleteUser(id, username) {
        $('#deleteUser b').text(username);
        $('#deleteUser').modal('show');
        $(".negative.button").click(function () {
            window.location.href = "${pageContext.request.contextPath}/user/deleteUser.do?id=" + id;
        })
    }

    $('#btn-add').click(function () {
        //window.location.href='${pageContext.request.contextPath}/user/toAddUi.do';
        parent.window.addTab('添加用户','${pageContext.request.contextPath}/user/toAddUi.do');
        window.location.go(-1); //刷新上一页
    });
</script>