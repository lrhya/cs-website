<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<div class="toolbar clearFix">
    <form action="${pageContext.request.contextPath}/clazz/findClazzPage.do">
        <div class="ui search fl">
            <div class="ui icon input">
                <input class="prompt" type="text" placeholder="输入班级" name="name" value="${className}">
            </div>
            <div class="results"></div>
        </div>

        <button class="ui teal button fl" type="submit"><i class="icon search"></i>查找</button>
        <a id="btn-add" class="ui blue button fl" href="javascript:void(0)"><i
                class="icon add"></i>添加</a>
    </form>
</div>
<table class="ui celled table center aligned">
    <thead>
    <tr>
        <th>班级</th>
        <th>入学时间</th>
        <th>专业名</th>
        <th>男生人数</th>
        <th>女生人数</th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${jsonClassList.result.dataList}" var="clazz">
        <tr>
            <td>${clazz.name}</td>
            <td><fmt:formatDate value="${clazz.entrancetime}" pattern="yyyy-MM-dd"/></td>
            <td>${clazz.proname}</td>
            <td>${clazz.boy}</td>
            <td>${clazz.girl}</td>
            <td>
                <button class="ui blue button mini"
                        onclick=window.location.href="${pageContext.request.contextPath}/clazz/toEditUi.do?id=${clazz.id}">
                    <i class="icon edit"></i>编辑
                </button>
            </td>
            <td>
                <button class="ui button red mini btn-delete" onclick=deleteClass(${clazz.id})><i
                        class="icon trash"></i>删除
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="ui right floated pagination menu">
    <span class="item">当前第${jsonClassList.result.currentPage}页</span>
    <span class="item">共${jsonClassList.result.totalPage}页</span>
    <span class="item">每页显示${jsonClassList.result.pageSize}条</span>
    <a href="${pageContext.request.contextPath}/clazz/findClazzPage.do?pageNum=1" class="active item first">首页</a>
    <a href="${pageContext.request.contextPath}/clazz/findClazzPage.do?pageNum=${jsonClassList.result.currentPage -1}"
       class="item pre">上一页</a>
    <a href="${pageContext.request.contextPath}/clazz/findClazzPage.do?pageNum=${jsonClassList.result.currentPage +1}"
       class="item next">下一页</a>
    <a href="${pageContext.request.contextPath}/clazz/findClazzPage.do?pageNum=${jsonClassList.result.totalPage}"
       class="item last">尾页</a>
    <%--<span class="item">跳转到 <input type="text" class="goPage">页</span> <a href="javascript:go()" class="active item">确定</a>--%>
</div>
<div class="ui small modal delete-class">
    <div class="header">删除班级</div>
    <div class="content">
        <p>你确定删除本班级吗？</p>
    </div>
    <div class="actions">
        <div class="ui negative button">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/tab.js"></script>
<script>
    function deleteClass(id) {
        $('.delete-class').modal('show');
        $(".negative.button").click(function () {
            window.location.href = "${pageContext.request.contextPath}/clazz/deleteClazz.do?id=" + id;
        })
    }
    $('#btn-add').click(function () {
        window.location.href ="${pageContext.request.contextPath}/clazz/toAddClazz.do";
    });
</script>