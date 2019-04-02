<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .goPage {
        display: inline-block;
        width: 22px;
    }
</style>
<form action="${pageContext.request.contextPath}/staticNews/findStaticNews.do">
    <div class="ui search fl">
        <div class="ui icon input">
            <input class="prompt" id="typename" type="text" placeholder="输入新闻类型名" name="typename" value="${typename}">
        </div>
        <div class="results"></div>
    </div>
    <button class="ui teal button fl find" type="submit"><i class="icon search"></i>查找</button>
</form>
<table class="ui celled table center aligned small">
<thead>
<tr>
    <th>新闻类别</th>
    <th>发布日期</th>
    <th colspan="3">操作</th>
</tr>
</thead>
<tbody>
<c:if test="${jsonMessage.success}">
    <c:forEach items="${jsonMessage.result.dataList}" var="staticNews">
        <tr>
            <td>${staticNews.typename}</td>
            <td>${staticNews.composetime}</td>
            <td>
                <a class="ui teal button mini icon"
                   href="${pageContext.request.contextPath}/staticNews/front/findStaticNewsByNewsType.do?id=${staticNews.id}">
                    <i class="icon find"></i>查看
                </a>
            </td>
            <td>
                <a class="ui blue button mini icon"
                   href="${pageContext.request.contextPath}/staticNews/toEditUi.do?id=${staticNews.id}">
                    <i class="icon edit"></i>编辑
                </a>
            </td>
            <td>
                <a class="ui button red mini icon"
                   href="javascript:deleteNews(${staticNews.id})"><i class="icon trash"></i>删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    </table>
    <div class="ui right floated pagination menu">
        <span class="item">当前第${jsonMessage.result.currentPage}页</span>
        <span class="item">共${jsonMessage.result.totalPage}页</span>
        <span class="item">每页显示${jsonMessage.result.pageSize}条</span>
        <a href="${pageContext.request.contextPath}/staticNews/findStaticNews.do?pageNum=1"
           class="active item first">首页</a>
        <a href="${pageContext.request.contextPath}/staticNews/findStaticNews.do?typename=${typename}&pageNum=${jsonMessage.result.currentPage -1}"
           class="item pre">上一页</a>
        <a href="${pageContext.request.contextPath}/staticNews/findStaticNews.do?typename=${typename}&pageNum=${jsonMessage.result.currentPage +1}"
           class="item next">下一页</a>
        <a href="${pageContext.request.contextPath}/staticNews/findStaticNews.do?typename=${typename}&pageNum=${jsonMessage.result.totalPage}"
           class="item last">尾页</a>
        <span class="item">跳转到 <input type="text" style="width: 36px" class="goPage" title="">页</span> <a href="javascript:go()"
                                                                                                 class="active item">确定</a>
    </div>
    <div class="ui small modal delete-modal">
        <div class="header"><i class="warning sign icon red"></i>删除静态新闻</div>
        <div class="content">
            <p>你确定删除本条静态新闻职称吗？</p>
        </div>
        <div class="actions">
            <div class="ui negative button">确定</div>
            <div class="ui positive button">取消</div>
        </div>
    </div>
</c:if>
<%--  <div class="ui small modal add-modal">
      <div class="header">添加静态新闻</div>
      <div class="content">
          <div class="ui form">
              <div class="inline field">
                  <label>新闻类别</label>
                  <input type="text" placeholder="新闻类别	">
              </div>
              <div class="inline field">
                  <div id="add-editor"></div>
              </div>
          </div>
      </div>
      <div class="actions">
          <div class="ui negative button">取消</div>
          <div class="ui positive button">添加</div>
      </div>
  </div>
--%>
<%--  <div class="ui small modal editor-modal">
      <div class="header">修改新闻类别</div>
      <div class="content">
          <div class="ui form">
              <div class="inline field">
                  <label>新闻类别</label>
                  <input type="text" placeholder="新闻类别" value="1">
              </div>
              <div class="inline field">
                  <div id="modify-editor"></div>
              </div>
          </div>
      </div>
      <div class="actions">
          <div class="ui negative button">取消</div>
          <div class="ui positive button">修改</div>
      </div>
  </div>--%>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    function deleteNews(id) {
        $('.delete-modal').modal('show');
        $(".negative.button").click(function () {
            window.location.href = "${pageContext.request.contextPath}/staticNews/deleteNews.do?id=" + id;
        })

    }

    function go() {
        var num = $(".goPage").val();
        var typename = $('#typename').val();
        window.location.href = "/staticNews/findStaticNews?typename=" + typename + "&pageNum=" + num;
    }
</script>