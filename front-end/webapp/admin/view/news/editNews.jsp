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
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
<style>
    .container {
        padding-top: 12px;
    }
</style>
<div class="ui container">
    <form action="${pageContext.request.contextPath}/news/updateNews.do" class="ui form" method="post">
        <input type="hidden" value="${jsonMessage.result.id}" name="id">
        <div class="inline field">
            <label class="" for="title">新闻标题</label>
            <input type="text" name="title" id="title" placeholder="输入标题" value="${jsonMessage.result.title}">
        </div>
        <div class="inline field">
            <label class="" for="newsType">新闻类型</label>
            <select name="newstype" id="newsType">
                <option value="0">选择新闻类型</option>
                <c:if test="${newsTypesJson.success}">
                    <c:forEach items="${newsTypesJson.result}" var="newsType">
                        <c:choose>
                            <c:when test="${jsonMessage.result.newstype==newsType.id}">
                                <option value="${newsType.id}" selected>${newsType.typename}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${newsType.id}">${newsType.typename}</option>
                            </c:otherwise>
                        </c:choose>
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
                <div class="upload-form" name="upload" method="post" enctype="multipart/form-data">
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
            <label class="">附件列表</label>
            <div class="upload">
                <div class="upload-form" name="upload" method="post" enctype="multipart/form-data">
                    <button id="browse" type="button" class="ui ui teal basic button">添加文件</button>
                </div>
            </div>
        </div>
        <div class="inline field">
            <div id="editor" name="content">
                ${jsonMessage.result.content}
            </div>
        </div>
        <div class="inline field">
            <button type="submit" class="ui primary button btn-submit">更新</button>
            <button type="reset" class="ui red button">重置</button>
        </div>
        <input id="content" type="hidden" name="content">
    </form>
</div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<c:if test="${!jsonMessage.success && jsonMessage.result != null}">
    <script>
        $.growl.error({title: "编辑新闻提示", message: "${jsonMessage.result}"});
    </script>
</c:if>
<script>

    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.debug = true;
    editor.customConfig.uploadFileName = 'uploadPic';
    editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/file/uploadPicture.do';

    editor.create();
    $('.btn-submit').click(function () {
        $('#content').val(editor.txt.html());
    });
    $('#browse-pic').click(function () {
        $('#file').click();
    });
    $('#file').change(function () {
        if (this.value) {
            $('.pic-name').text(this.files[0].name);
            $('.list-pic').fadeIn();
        }
    });
    $('.list-pic .cancel').click(function () {
        $('#file').value = false;
        $('.pic-name').text('');
        $('.list-pic').hide();
    });
    //添加文件
    $('#browse').click(function () {
        var fileInput = $('<input class="hidden" type="file">');
        fileInput.change(function () {
            if (this.value) {
                $('.upload-form').append(fileInput);

                var item = $('<div class="item"></div>');
                var filename = $('<span class="filename"></span>').text(this.files[0].name);
                var cancel = $('<span class="cancel"><i class="remove icon"></i></span>');
                cancel.click(function () {
                    $(this).parent().remove();
                    fileInput.remove();
                });
                item.append(filename).append(cancel);
                $('.list-file').append(item).fadeIn();
            }
        });
        fileInput.click();
    });
</script>
