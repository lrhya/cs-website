<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="refresh" content="20">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .menu {
        padding: 0 auto;
    }
</style>
<form class="ui form ft1" action="${pageContext.request.contextPath}/log/findLog.do" method="post">
    <div class="ui find fl search">
        <div class="ui icon input">
            <input class="prompt user" type="text" placeholder="用户名" name="user" value="${log.user}">
        </div>
    </div>
    <button class="ui teal button small find fl" id="f1">
        <i class="icon search"></i>查找
    </button>
    <button class="ui blue button small fl add red" id="batchDelete" type="button">
        <i class="icon remove"></i>批量删除
    </button>
</form>
<form action="" id="form">
<table class="ui celled table green center aligned selectable striped tiny">
    <thead>
    <tr>
        <th>选择</th>
        <th>用户名</th>
        <th>事件</th>
        <th>时间</th>
        <th>IP</th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <tbody>

        <c:forEach items="${jsonMessage.result.dataList}" var="log">
        <tr>
            <td><input type="checkbox" name="logId" class="log_id" value="${log.id}" title=""></td>
            <td>${log.user}</td>
            <td>${log.action}</td>
            <td>${log.actionTime}</td>
            <td>${log.ip}</td>
            <td>
                <a class="ui button red mini icon" href="javascript:deleteLog(${log.id})">
                    <i class="icon trash"></i>删除</a>
            </td>
        </tr>
        </c:forEach>
    </tbody>
</table>
</form>
<input type="hidden" id="baseUrl" value="${pageContext.request.contextPath}">

<div class="ui right floated pagination menu">
    <span class="item">当前第${jsonMessage.result.currentPage}页</span>
    <span class="item">共${jsonMessage.result.totalPage}页</span>
    <span class="item">每页显示${jsonMessage.result.pageSize}条</span>
    <a href="${pageContext.request.contextPath}/log/findLog.do?user=${log1.user}&pageNum=1"
       class="active item first">首页</a>
    <a href="${pageContext.request.contextPath}/log/findLog.do?user=${log1.user}&pageNum=${jsonMessage.result.currentPage -1}"
       class="item pre">上一页</a>
    <a href="${pageContext.request.contextPath}/log/findLog.do?user=${log1.user}&pageNum=${jsonMessage.result.currentPage +1}"
       class="item next">下一页</a>
    <a href="${pageContext.request.contextPath}/log/findLog.do?user=${log1.user}&pageNum=${jsonMessage.result.totalPage}"
       class="item last">尾页</a>
    <span class="item">跳转到 <input type="text" style="width: 36px" class="goPage">页</span> <a
        href="javascript:go()" class="active item">确定</a>
</div>

<div class="ui small modal" id="deleteLogModel">
    <div class="header"><i class="warning sign icon red"></i>删除日志</div>
    <div class="content">
        <p>你确定该日志？</p>
    </div>
    <div class="actions">
        <div class="ui negative button deleteLog">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<div class="ui small modal" id="deleteLogsModel">
    <div class="header"><i class="warning sign icon red"></i>批量删除日志</div>
    <div class="content">
        <p>你确定这几条日志？</p>
    </div>
    <div class="actions">
        <div class="ui negative button deleteLogs">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    function go() {
        var num = $(".goPage").val();
        var user = $('.user').text();
        window.location.href = $('#baseUrl').val() + "/log/findLog.do?user=" + user + "&pageNum=" + num;
    }
    function deleteLog(logId) {
        $("#deleteLogModel").modal("show");
        $(".deleteLog.negative.button").click(function () {
            window.location.href = "${pageContext.request.contextPath}/log/delete.do?id=" + logId;
        })
    }
    $('#batchDelete').click(function () {
        if($('.log_id').is(':checked')) {
        $("#deleteLogsModel").modal("show");
        $(".deleteLogs.negative.button").click(function () {
            $('#form').attr("action", $('#baseUrl').val() + "/log/batchDelete.do").submit();
        });
        return}
        alert("请选择要删除的日志")

    });
</script>