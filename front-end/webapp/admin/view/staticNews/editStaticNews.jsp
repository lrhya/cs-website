<%--
  Created by IntelliJ IDEA.
  User: hl
  Date: 2017/10/19
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon3.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .container{
        padding-top: 12px;
    }
</style>
        <div class="ui container">
            <form action="${pageContext.request.contextPath}/staticNews/updateStaticNews.do" class="ui form" method="post">
                <input type="hidden" value="${jsonMessage.result.id}" name="id">
                <div class="inline field">
                    <label class="" for="title">新闻类型</label>
                    <input type="text" name="typename" id="title" placeholder="输入新闻类型" value="${jsonMessage.result.typename}">
                </div>


                    <div id="editor"  name="content">
                        ${jsonMessage.result.content}
                    </div>

                <div class="inline field">
                    <button type="submit" class="ui primary button btn-submit">更新</button>
                    <button type="reset" class="ui red button">重置</button>
                </div>
                <input id="content" type="hidden" name="content" >
            </form>
        </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>

    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.debug=true;
    editor.customConfig.uploadFileName = 'uploadPic';
    editor.customConfig.uploadImgServer= '${pageContext.request.contextPath}/file/uploadPicture.do';

    editor.create();
    $('.btn-submit').click(function () {
        $('#content').val(editor.txt.html());
    });
    $('#browse-pic').click(function () {
        $('#file').click();
    });
    $('#file').change(function () {
        if(this.value){
            $('.pic-name').text(this.files[0].name);
            $('.list-pic').fadeIn();
        }
    });
    $('.list-pic .cancel').click(function () {
        $('#file').value=false;
        $('.pic-name').text('');
        $('.list-pic').hide();
    });
    //添加文件
    $('#browse').click(function () {
        var fileInput=$('<input class="hidden" type="file">');
        fileInput.change(function () {
            if(this.value){
                $('.upload-form').append(fileInput);

                var item=$('<div class="item"></div>');
                var filename=$('<span class="filename"></span>').text(this.files[0].name);
                var cancel=$('<span class="cancel"><i class="remove icon"></i></span>');
                cancel.click(function () {
                    $(this).parent().remove();
                    fileInput.remove();
                });
                item.append(filename).append(cancel);
                $('.list-file').append(item);
                $('.list-file').fadeIn();
            }
        });
        fileInput.click();
    });
</script>

