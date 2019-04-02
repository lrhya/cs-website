<%--
  Created by IntelliJ IDEA.
  User: hl
  Date: 2017/10/19
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .container{
        padding-top: 12px;
    }
</style>
        <div class="ui container">
            <form action="${pageContext.request.contextPath}/news/addNews.do" class="ui form" method="post">
                <div class="inline field">
                    <label class="" for="title">新闻标题</label>
                    <input type="text" name="title" id="title" placeholder="输入标题" value="${jsonMessage.result.title}">
                </div>
                <div class="inline field">
                    <label class="" for="newsType">新闻类型</label>
                    <select name="newstype" id="newsType">
                        <c:if test="${newsTypesJson.success}">
                            <c:forEach items="${newsTypesJson.result}" var="teacherTypes">
                                <option value="${teacherTypes.id}">${teacherTypes.typename}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                    <c:if test="${!newsTypesJson.success}">
                        ${newsTypesJson.result}
                    </c:if>
                </div>
                <div class="inline field">
                    <label class="" for="newsType">设置轮播</label>
                    <div class="upload-pic">
                        <div class="upload-form" name="upload" method="post"  enctype="multipart/form-data">
                            <button id="browse-pic" type="button" class="ui blue basic button">设置轮播</button>
                            <input id="file" name="filename" type="file">
                        </div>

                    </div>
                    <div class="ui list list-pic hidden">
                        <div class="item">
                            <span class="pic-name"></span>
                            <span class="cancel"><i class="remove icon"></i></span>
                        </div>
                    </div>
                </div>
                <div class="inline field">
                    <label class="" >附件列表</label>
                    <div class="upload">
                        <div class="upload-form" name="upload" method="post"  enctype="multipart/form-data">
                            <button id="browse" type="button" class="ui ui teal basic button">添加文件</button>
                        </div>
                    </div>
                    <div class="ui list list-file">
                    </div>
                </div>

                <div class="inline field">
                    <div id="editor"  name="content"></div>
                </div>
                <div class="inline field">
                    <button class="ui primary button">修改</button>
                    <button class="ui red button">重置</button>
                </div>
                <input id="content" type="hidden" name="content">
            </form>
        </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.uploadImgServer = '/upload';
    editor.create();
</script>

