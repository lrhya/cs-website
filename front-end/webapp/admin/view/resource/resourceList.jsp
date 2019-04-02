<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .resource .find {
        margin: 4px 25px;
    }

    .resource .add {
        margin: 4px 40px;
    }

    .resourceInput {
        display: none;
    }
</style>
<form class="ui form resource" method="post"
      action="${pageContext.request.contextPath}/resource/findResourcePage.do">
    <div class="field fl find">
        <div class="inline field">
            <label class="fl">资源所在栏目</label>
            <select name="lb" id="" class="fl" title="资源类别">
                <c:if test="${newsTypesJson.success}">
                    <option></option>
                    <c:forEach items="${newsTypesJson.result}" var="newsType">
                        <c:if test="${newsType.id == resource.lb}">
                            <option value="${newsType.id}" name="lb" selected>
                                    ${newsType.typename}
                            </option>
                        </c:if>
                        <option value="${newsType.id}" name="lb">
                                ${newsType.typename}
                        </option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
    </div>
    <div class="fl find">
        <input type="text" placeholder="文件名" name="filename" value="${resource.filename}">
    </div>
    <button class="ui button teal" type="submit">查找</button>
    <a id="btn-add" href="javascript:void(0)"
       class="ui blue button add">添加</a>
</form>
<table class="ui celled table center aligned">
    <thead>
    <tr>
        <th>编号</th>
        <th>文件名</th>
        <th>所在类别</th>
        <th>发布时间</th>
        <th>是否可见</th>
        <th>更换文件</th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${jsonMessage.success}">
        <c:set var="page" value="${jsonMessage.result}"/>
        <c:forEach items="${jsonMessage.result.dataList}" var="resource">
            <tr>
                <td><input type="checkbox" title="资源选择框"></td>
                <td>
                    <a href="${pageContext.request.contextPath}/file/downLoadFile.do?filePath=/file${resource.filePath}">${resource.filename}</a>
                </td>
                <td>${resource.typename}</td>
                <td>
                        ${resource.compostime}
                </td>
                <td>
                    <c:choose>
                        <c:when test="${resource.isShow == 1}">
                            <a onclick="isShowResource(${resource.isShow},${resource.id})">
                                <input type="radio" name="${resource.id}" value="${resource.isShow})"
                                       checked title="资源选择框"> 是
                                <input type="radio" name="${resource.id}" value="${resource.isShow}"
                                       title="资源选择框"> 否
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a onclick="isShowResource(${resource.isShow},${resource.id})">
                                <input type="radio" name="${resource.id}" value="1" title="资源选择框"> 是
                                <input type="radio" name="${resource.id}" value="0" checked title="资源选择框"> 否
                            </a>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <button onclick="changeResume(${resource.id})" type="button" class="ui blue button tiny"><i class="icon edit"></i>更换文件</button>
                </td>
                <td>
                    <a class="ui blue button tiny"
                       href="${pageContext.request.contextPath}/resource/toEditResourceUi.do?id=${resource.id}"><i
                            class="icon edit"></i>修改</a>
                </td>
                <td>
                    <a class="ui red button tiny" href="javascript:deleteResource(${resource.id})"><i
                            class="icon trash"></i>删除</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<div class="ui small modal delete-modal">
    <div class="header"><i class="warning sign icon red"></i>删除资源文件</div>
    <div class="content">
        <p>你确定删除该资源文件吗？</p>
    </div>
    <div class="actions">
        <div class="ui negative button deleteButton">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<div class="ui small modal edit-modal">
    <div class="header">修改资源文件</div>
    <div class="description"><i class="warning sign icon red"></i>如果以前资源文件存在，以前资源文件将被替换</div>
    <div class="content">
        <form id="resourceForm"  enctype="multipart/form-data" method="post">
            <span class="browseResource">
                <button class="ui basic blue button" type="button">选择资源文件</button>
                <span class="show"></span>
                <input type="file" name="resource" id="resume" class="resourceInput">
            </span>
        </form>
    </div>
    <div class="actions">
        <div class="ui negative button edit">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<div class="ui right floated pagination menu">
    <span class="item">当前第${page.currentPage}页</span>
    <span class="item">共${page.totalPage}页</span>
    <span class="item">每页显示${page.pageSize}条</span>
    <a href="${pageContext.request.contextPath}/resource/findResourcePage.do?lb=${resource.lb}&filename=${resource.filename}&pageNum=1"
       class="active item first">首页</a>
    <a href="${pageContext.request.contextPath}/resource/findResourcePage.do?lb=${resource.lb}&filename=${resource.filename}&pageNum=${page.currentPage -1}"
       class="item pre">上一页</a>
    <a href="${pageContext.request.contextPath}/resource/findResourcePage.do?lb=${resource.lb}&filename=${resource.filename}&pageNum=${page.currentPage +1}"
       class="item next">下一页</a>
    <a href="${pageContext.request.contextPath}/resource/findResourcePage.do?lb=${resource.lb}&filename=${resource.filename}&pageNum=${page.totalPage}"
       class="item last">尾页</a>
    <span class="item">跳转到 <input type="text" style="width: 36px" class="goPage" title="">页</span> <a
        href="javascript:go()" class="active item">确定</a>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/jquery.form/jquery.form.js"></script>
<script>
    function deleteResource(id) {
        $(".delete-modal").modal('show');
        $(".negative.button.deleteButton").click(function () {
            window.location.href = "${pageContext.request.contextPath}/resource/deleteById.do?id=" + id;
        })
    }
    function isShowResource(show, id) {
        if (show === 1)
            show = 0;
        else
            show = 1;
        window.location.href = "${pageContext.request.contextPath}/resource/isShow.do?lb=${resource.lb}&filename=${resource.filename}&isShow=" + show + "&id=" + id;
    }
    function go() {
        var num = $(".goPage").val();
        window.location.href = "${pageContext.request.contextPath}/resource/findResourcePage.do?lb=${resource.lb}&filename=${resource.filename}&pageNum=" + num;
    }
    //触发input更换资源文件
    $(".browseResource > button").on('click', function () {
        $(".resourceInput").click();
    });
    $(".resourceInput").change(function () {
        var resource = $(this).val().substring($(this).val().lastIndexOf("\\") + 1);
        $(".browseResource .show").html(resource)
    });

    $('#btn-add').click(function () {
        var flag = top.window.addTab('添加资源', '${pageContext.request.contextPath}/resource/toAddResourceUi.do');
       // window.history.back();
    });
    function changeResume(resourceId) {
        $(".browseResource .show").html("");
        $(".edit-modal").modal('show');
        $(".negative.button.edit").click(function () {
            $("#resourceForm").ajaxSubmit({
                url: '${pageContext.request.contextPath}/file/uploadFile.do',
                type: "post",
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                        alert("test");
                        var resourcePath = data.result;
                        resourcePath = resourcePath.substring(resourcePath.indexOf("file") +4);
                        window.location.href = "${pageContext.request.contextPath}/resource/updateResource.do?id=" + resourceId + "&filePath=" +resourcePath;
                        $(this).resetForm(); // 提交后重置表单
                    }else {
                        $.growl.error({title: "添加资源提示", message: data.result});
                    }
                }
            });
        })
    }
</script>
