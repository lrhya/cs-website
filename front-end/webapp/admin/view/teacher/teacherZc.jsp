<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .news-list {
        padding-top: 12px;
    }
</style>
<div class="toolbar clearFix">
    <form action="${pageContext.request.contextPath}/teacher/findTeacherZC.do">
        <div class="ui search fl">
            <div class="ui icon input">
                <input class="prompt" type="text" placeholder="职称名字" name="zhicheng">
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
        <th>教师职称编码</th>
        <th>教师职称名称</th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${jsonMessage.success}">
        <c:forEach items="${jsonMessage.result.dataList}" var="teacherType">
            <tr>
                <td class="id">${teacherType.id}</td>
                <td class="zhicheng">${teacherType.zhicheng}</td>
                <td>
                    <button class="ui blue button small btn-editor"><i class="icon edit"></i>编辑</button>
                </td>
                <td>
                    <a class="ui button red mini icon" href="javascript:del(${teacherType.id})"><i
                            class="icon trash"></i>删除</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
    <tfoot>
    <tr>
        <th colspan="6">
            <div class="ui right floated pagination menu">
                <span class="item">当前第${jsonMessage.result.currentPage}页</span>
                <span class="item">共${jsonMessage.result.totalPage}页</span>
                <span class="item">每页显示${jsonMessage.result.pageSize}条</span>
                <a href="${pageContext.request.contextPath}/teacher/findTeacherZC.do?zhicheng=${teacherType.zhicheng}&pageNum=1"
                   class="active item first">首页</a>
                <a href="${pageContext.request.contextPath}/teacher/findTeacherZC.do?zhicheng=${teacherType.zhicheng}&pageNum=${jsonMessage.result.currentPage -1}"
                   class="item pre">上一页</a>
                <a href="${pageContext.request.contextPath}/teacher/findTeacherZC.do?zhicheng=${teacherType.zhicheng}&pageNum=${jsonMessage.result.currentPage +1}"
                   class="item next">下一页</a>
                <a href="${pageContext.request.contextPath}/teacher/findTeacherZC.do?zhicheng=${teacherType.zhicheng}&pageNum=${jsonMessage.result.totalPage}"
                   class="item last">尾页</a>
                <%--<span class="item">跳转到 <input type="text" class="goPage">页</span> <a href="javascript:go()" class="active item">确定</a>--%>
            </div>
        </th>
    </tr>
    </tfoot>
</table>
<div class="ui small modal delete-modal">
    <div class="header"><i class="warning sign icon red"></i>删除教师职称</div>
    <div class="content">
        <p>你确定删除该教师职称？</p>
    </div>
    <div class="actions">
        <div class="ui negative button">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>

<div class="ui small modal add-modal">
    <div class="header">添加教师职称</div>
    <div class="content">
        <form action="${pageContext.request.contextPath}/teacher/addTeacherZC.do" class="add_form">
            <div class="ui form">
                <div class="inline field">
                    <label>教师职称名称</label>
                    <input type="text" placeholder="教师职称名称	" name="zhicheng">
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
    <div class="header">修改教师职称</div>
    <div class="content">
        <form action="${pageContext.request.contextPath}/teacher/updateTeacherZc.do" class="edit_form">
            <div class="ui form">
                <div class="inline field">
                    <input type="hidden" placeholder="教师职称编码" value="1" class="edit_id" name="id">
                </div>
                <div class="inline field">
                    <label>教师职称名称</label>
                    <input type="text" placeholder="教师职称名称" value="" name="zhicheng" class="edit_name">
                </div>
            </div>
        </form>
    </div>
    <div class="actions">
        <div class="ui negative button">修改</div>
        <button class="ui positive button edit">取消</button>
    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>

    function del(id) {
        $('.delete-modal').modal('show');
        $(".negative.button").click(function () {
            window.location.href = "${pageContext.request.contextPath}/teacher/delTeacherZc.do?id=" + id;
        });
    }

    $('.btn-add').click(function () {
        $('.add-modal').modal('show');
        $('.add').click(function () {
            $('.add_form').submit();
        });
    });
    $('.btn-editor').click(function () {
        $('.editor-modal').modal('show');
        $('.edit_id').val($(this).parent().siblings('.id').text());
        $('.edit_name').val($(this).parent().siblings('.zhicheng').text());
        $('.edit').click(function () {
            $('.edit_form').submit();
        });
    });
</script>