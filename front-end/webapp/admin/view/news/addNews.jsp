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
            <form action="${pageContext.request.contextPath}/news/addNews.do" class="ui form" method="post">
                <div class="inline field">
                    <label class="" for="title">新闻标题</label>
                    <input type="text" name="title" id="title" placeholder="输入标题">
                </div>
                <div class="inline field">
                    <label class="" for="newsType">新闻类型</label>
                    <select name="newstype" id="newsType">
                        <option value="0">选择新闻类型</option>
                        <c:if test="${newsTypesJson.success}">
                            <c:forEach items="${newsTypesJson.result}" var="newsType">
                                <option value="${newsType.id}">${newsType.typename}</option>
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
                    <div class="ui list list-file">
                    </div>
                </div>

                <div class="inline field">
                    <div id="editor"></div>
                </div>
                <div class="inline field">
                    <button type="submit" class="ui primary button btn-submit">发布</button>
                    <button type="reset" class="ui red button">重置</button>
                </div>
                <input id="content" type="hidden" name="content">
                <%--<textarea name="content" id="content" hidden="hidden"></textarea>--%>
            </form>
            <%--<c:if test="${jsonMessage != null && !jsonMessage.success}">--%>
                <%--<div class="ui error message">--%>
                    <%--<i class="close icon"></i>--%>
                        <%--${jsonMessage.result}--%>
                <%--</div>--%>
            <%--</c:if>--%>
        </div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<c:if test="${jsonMessage != null && !jsonMessage.success}">
    <script>
        $.growl.error({title: "添加新闻提示", message: "${jsonMessage.result}" });
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
