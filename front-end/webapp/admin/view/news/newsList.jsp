<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
.find {
        margin: 4px 15px;
    }

.add {
        margin: 4px 40px;
    }

    .menu {
        padding: 0 auto;
    }
</style>
<form class="ui form ft1" action="" method="post" id="form">
    <c:if test="${newsTypesJson.success}">
        <div class="field fl find">
            <div class="inline field">
                <label for="newsType">选择新闻类型</label>
                <select name="newstype" title="新闻类型" id="newsType">
                    <option></option>
                    <c:forEach items="${newsTypesJson.result}" var="newsType">
                        <c:choose>
                            <c:when test="${news.newstype==newsType.id}">
                                <option value="${newsType.id}" selected>${newsType.typename}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${newsType.id}">${newsType.typename}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>

        </div>
    </c:if>
    <div class="ui find fl search find">
        <div class="ui icon input">
            <input class="prompt title" type="text" placeholder="新闻标题" name="title" value="${news.title}">
        </div>
    </div>
    <button class="ui teal button small find fl" id="f1">
        <i class="icon search"></i>查找
    </button>
    <a id="btn-add" class="ui blue button small fl add" href="javascript:void(0);">
        <i class="icon add"></i>添加
    </a>
    <button class="ui blue button small fl add red find" id="batchDelete" type="button">
        <i class="icon remove"></i>批量删除
    </button>
    <table class="ui celled table green center aligned selectable striped tiny">
        <thead>
        <tr>
            <th>选择</th>
            <th>新闻标题</th>
            <th>新闻类别</th>
            <th>发布日期</th>
            <th colspan="3">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${jsonMessage.success}">
            <c:set var="page" value="${jsonMessage.result}"/>
        </c:if>
        <c:forEach items="${page.dataList}" var="news">
            <tr>
                <td><input type="checkbox" name="newsId"  class="new_id" value="${news.id}" title="选择新闻"></td>
                <td>${news.title}</td>
                <td>${news.typename}</td>
                <td>${news.composetime}</td>
                <td>
                    <a class="ui teal button mini icon"
                       href="${pageContext.request.contextPath}/news/front/findNewsById.do?id=${news.id}"><i
                            class="icon find"></i>查看</a>
                </td>
                <td>
                    <a class="ui blue button mini icon"
                       href="${pageContext.request.contextPath}/news/toEditNewsPage.do?id=${news.id}"><i
                            class="icon edit"></i>编辑
                    </a>
                </td>
                <td>
                    <a class="ui button red mini icon"
                       href="javascript:deleteNews(${news.id})"><i
                            class="icon trash"></i>删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
<input type="hidden" id="baseUrl" value="${pageContext.request.contextPath}">
<input type="hidden" value="${news.newstype}" class="newsid">
<input type="hidden" value="${news.title}" class="newstitle">
<div class="ui right floated pagination menu">
    <span class="item">当前第${page.currentPage}页</span>
    <span class="item">共${page.totalPage}页</span>
    <span class="item">每页显示${page.pageSize}条</span>
    <a href="${pageContext.request.contextPath}/news/newsList.do?newstype=${news.newstype}&title=${news.title}&pageNum=1"
       class="active item first">首页</a>
    <a href="${pageContext.request.contextPath}/news/newsList.do?newstype=${news.newstype}&title=${news.title}&pageNum=${page.currentPage -1}"
       class="item pre">上一页</a>
    <a href="${pageContext.request.contextPath}/news/newsList.do?newstype=${news.newstype}&title=${news.title}&pageNum=${page.currentPage +1}"
       class="item next">下一页</a>
    <a href="${pageContext.request.contextPath}/news/newsList.do?newstype=${news.newstype}&title=${news.title}&pageNum=${page.totalPage}"
       class="item last">尾页</a>
    <span class="item">跳转到 <input type="text" style="width: 36px" class="goPage" title="">页</span> <a
        href="javascript:go()" class="active item">确定</a>
</div>
<div class="ui small modal" id="deleteNewsModal">
    <div class="header"><i class="warning sign icon red"></i>删除新闻</div>
    <div class="content">
        <p>你确定删除该新闻？</p>
    </div>
    <div class="actions">
        <div class="ui negative button deleteNews">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<div class="ui small modal" id="deleteNewsBatchModal">
    <div class="header"><i class="warning sign icon red"></i>批量删除新闻</div>
    <div class="content">
        <p>你确定删除这几条新闻？</p>
    </div>
    <div class="actions">
        <div class="ui negative button deleteNewsBatch">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    function go() {
        var num = $(".goPage").val();
        var id = $('.newsid').val();
        var title = $('.newstitle').val();
        window.location.href = "${pageContext.request.contextPath}/news/newsList.do?newstype=" + id + "&title=" + title + "&pageNum=" + num;
    }
    function deleteNews(id) {
        $('#deleteNewsModal').modal('show');
        $(".negative.button.deleteNews").click(function () {
            var title=$('.title').val();
            var newsType=$('[selected]').val();
            if(newsType===undefined)
                newsType=0;
//            alert(title);
//            alert(newsType);
            window.location.href = "${pageContext.request.contextPath}/news/deleteNews.do?id=" + id+"&newsType="+newsType+"&title="+title;
        })
    }
    $('#batchDelete').click(function () {
        if($('.new_id').is(':checked')) {
        $('#deleteNewsBatchModal').modal('show');
        $(".negative.button.deleteNewsBatch").click(function () {
//            var title=$('.title').val();
//            var newsType=$('[selected]').val();
            $('#form').attr("action", $('#baseUrl').val() + "/news/batchDeleteNews2.do").submit();
        })}

    });
    $('#f1').click(function () {
        $('#form').attr("action", $('#baseUrl').val() + "/news/newsList.do").submit();
    });

    $('#btn-add').click(function () {
        parent.window.addTab('添加动态新闻', '${pageContext.request.contextPath}/news/toAddNewsPage.do');
    });
</script>