<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
</style>
<div class="toolbar clearFix">
    <form action="${pageContext.request.contextPath}/teacher/findJslxSelective.do">
        <div class="ui search fl">
            <div class="ui icon input">
                <input class="prompt" type="text" placeholder="输入类型名称" name="lxmc">
            </div>
            <div class="results"></div>
        </div>

        <button class="ui green button fl" type="submit"><i class="icon search"></i>查找</button>
    </form>
    <button class="ui blue button fl btn-add"><i class="icon add"></i>添加</button>

</div>
<table class="ui celled table center aligned">
    <thead>
    <tr>
        <th>教师类别编码</th>
        <th>教师类别名称</th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${jsonMessage.success}">
        <c:forEach items="${jsonMessage.result.dataList}" var="jslx1">
            <tr>
                <td class="id">${jslx1.id}</td>
                <td class="lxmc">${jslx1.lxmc}</td>
                <td>
                    <button class="ui blue button small btn-editor"><i class="icon edit"></i>编辑</button>
                </td>
                <td>
                    <a class="ui button red mini icon" href="javascript:del(${jslx1.id})"><i
                            class="icon trash"></i>删除</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<div class="ui right floated pagination menu">
    <span class="item">当前第${jsonMessage.result.currentPage}页</span>
    <span class="item">共${jsonMessage.result.totalPage}页</span>
    <span class="item">每页显示${jsonMessage.result.pageSize}条</span>
    <a href="${pageContext.request.contextPath}/teacher/findJslxSelective.do?lxmc=${jslx.lxmc}&pageNum=1"
       class="active item first">首页</a>
    <a href="${pageContext.request.contextPath}/teacher/findJslxSelective.do?lxmc=${jslx.lxmc}&pageNum=${jsonMessage.result.currentPage -1}"
       class="item pre">上一页</a>
    <a href="${pageContext.request.contextPath}/teacher/findJslxSelective.do?lxmc=${jslx.lxmc}&pageNum=${jsonMessage.result.currentPage +1}"
       class="item next">下一页</a>
    <a href="${pageContext.request.contextPath}/teacher/findJslxSelective.do?lxmc=${jslx.lxmc}&pageNum=${jsonMessage.result.totalPage}"
       class="item last">尾页</a>
    <%--<span class="item">跳转到 <input type="text" class="goPage">页</span> <a href="javascript:go()" class="active item">确定</a>--%>
</div>
<div class="ui small modal delete-modal">
    <div class="header"><i class="warning sign icon red"></i>删除教师类别</div>
    <div class="content">
        <p>你确定删除该教师类别？</p>
    </div>
    <div class="actions">
        <div class="ui negative button">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>

<div class="ui small modal add-modal">
    <div class="header">添加教师类别</div>
    <div class="content">
        <form action="${pageContext.request.contextPath}/teacher/addJslx.do" class="add_jslxForm">
            <div class="ui form">
                <div class="inline field">
                    <%--<label>教师类别编码</label>--%>
                    <%--<input type="text" placeholder="教师类别编码	">--%>
                </div>
                <div class="inline field">
                    <label>教师类别名称</label>
                    <input type="text" placeholder="教师类别名称	" name="lxmc">
                </div>
            </div>
        </form>
    </div>
    <div class="actions">
        <div class="ui negative button">取消</div>
        <button class="ui positive button add">添加</button>
    </div>
</div>

<div class="ui small modal editor-modal">
    <div class="header">修改教师类别</div>
    <div class="content">
        <form action="${pageContext.request.contextPath}/teacher/editJslx.do" class="edit_form">
            <div class="ui form">
                <div class="inline field">
                    <%-- <label>教师类别编码</label>--%>
                    <input type="hidden" placeholder="教师类别编码" value="1" name="id" class="edit_id">
                </div>
                <div class="inline field">
                    <label>教师类别名称</label>
                    <input type="text" placeholder="教师类别名称" value="本科生培养" name="lxmc" class="edit_name">
                </div>
            </div>
        </form>
    </div>
    <div class="actions">
        <div class="ui negative button edit">修改</div>
        <button class="ui positive button">取消</button>
    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    function del(id) {
        $('.delete-modal').modal('show');
        $(".negative.button").click(function () {
            window.location.href = "${pageContext.request.contextPath}/teacher/delJslx.do?id=" + id;
        });
    }

    $('.btn-add').click(function () {
        $('.add-modal').modal('show');
        $('.add').click(function () {
            $('.add_jslxForm').submit();
        });
    });
    $('.btn-editor').click(function () {
        $('.editor-modal').modal('show');
        $('.edit_id').val($(this).parent().siblings('.id').text());
        $('.edit_name').val($(this).parent().siblings('.lxmc').text());
        $('.edit').click(function () {
            $('.edit_form').submit();
        })
    });
</script>