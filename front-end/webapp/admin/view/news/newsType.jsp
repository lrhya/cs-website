<%--
  Created by IntelliJ IDEA.
  User: hl
  Date: 2017/10/19
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .data-list {
        padding-top: 12px;
    }
</style>
<div class="data-list">
    <div class="toolbar clearFix">
        <div class="ui search fl">
            <div class="ui icon input">
                <input class="prompt" type="text" placeholder="输入新闻类别">
            </div>
            <div class="results"></div>
        </div>

        <button class="ui green button fl"><i class="icon search"></i>查找</button>

        <button class="ui blue button fl btn-add"><i class="icon add"></i>添加</button>
    </div>
    <table class="ui celled table center aligned">
        <thead>
        <tr>
            <th>新闻类别编码</th>
            <th>新闻类别名称</th>
            <th colspan="2">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${newsTypesJson.result.dataList}" var="newsTypes">
            <tr>
                <td class="newsType_id">${newsTypes.id}</td>
                <td class="newsType_name">${newsTypes.typename}</td>
                <td>
                    <button class="ui blue button small btn-editor"><i class="icon edit"></i>编辑</button>
                </td>
                <td>
                    <div class="ui button red small btn-delete"><i class="icon delete"></i>删除</div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="ui right floated pagination menu">
        <span class="item">当前第${newsTypesJson.result.currentPage}页</span>
        <span class="item">共${newsTypesJson.result.totalPage}页</span>
        <span class="item">每页显示${newsTypesJson.result.pageSize}条</span>
        <a href="${pageContext.request.contextPath}/news/newsTypePage.do" class="active item first">首页</a>
        <a href="${pageContext.request.contextPath}/news/newsTypePage.do?pageNum=${newsTypesJson.result.currentPage -1}"
           class="item pre">上一页</a>
        <a href="${pageContext.request.contextPath}/news/newsTypePage.do?pageNum=${newsTypesJson.result.currentPage +1}"
           class="item next">下一页</a>
        <a href="${pageContext.request.contextPath}/news/newsTypePage.do?pageNum=${newsTypesJson.result.totalPage}"
           class="item last">尾页</a>
    </div>
    <div class="ui small modal delete-modal">
        <div class="header"><i class="warning sign icon red"></i>删除新闻类别</div>
        <div class="content">
            <p>你确定删除本新闻类别吗？</p>
        </div>
        <div class="actions">
            <div class="ui negative button">否</div>
            <div class="ui positive button" id="delete1">是</div>
        </div>
    </div>
    <div class="ui small modal add-modal">
        <div class="header">添加新闻类别</div>
        <div class="content">
            <form action="${pageContext.request.contextPath}/news/addNewstype.do" method="post" class="fm2">
                <div class="ui form">
                    <div class="inline field">
                        <label>新闻类别名称</label>
                        <input type="text" placeholder="新闻类别名称	" name="typename">
                    </div>
                </div>
            </form>
        </div>
        <div class="actions">
            <div class="ui negative button">取消</div>
            <div class="ui positive button" id="add">添加</div>
        </div>
    </div>

    <div class="ui small modal editor-modal">
        <div class="header">修改新闻类别</div>
        <div class="content">
            <form action="${pageContext.request.contextPath}/news/editNewstype.do" method="post" class="fm1">
                <div class="ui form">
                    <div class="inline field" hidden>
                        <label>新闻类别编码</label>
                        <input type="text" placeholder="新闻类别编码" class="new_ntid" name="id"/>
                    </div>
                    <div class="inline field">
                        <label>新闻类别名称</label>
                        <input type="text" placeholder="新闻类别名称" class="new_ntname" name="typename"/>
                    </div>
                </div>
            </form>
        </div>
        <div class="actions">
            <div class="ui negative button">取消</div>
            <button class="ui positive button" id="edit">修改</button>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    $('.btn-delete').click(function () {
        $('.delete-modal').modal('show');
        id = $(this).parent().siblings().first().text();
        $('#delete1').click(function () {
            /* alert("dsf");*/
            window.location.href = "${pageContext.request.contextPath}/news/deleteNewstype.do?id=" + id;
        })
    });

    $('.btn-add').click(function () {
        $('.add-modal').modal('show');
    });
    $('.btn-editor').click(function () {
        $('.new_ntid').val($(this).parent().siblings('.newsType_id').text());
        $('.new_ntname').val($(this).parent().siblings('.newsType_name').text());
        $('.editor-modal').modal('show');
    });
    $('#edit').click(function () {
        $('.fm1').submit();
    });
    $('#add').click(function () {
        $('.fm2').submit();
    });
</script>

