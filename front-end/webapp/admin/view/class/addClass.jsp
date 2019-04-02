<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic-ui-calendar/calendar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/wangEditor.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
<style>
    .con1 {
        padding-top: 14px;
    }
</style>
<div class="ui container con1">
    <form action="${pageContext.request.contextPath}/clazz/addClazz.do" class="ui form" method="post" onsubmit="return checkDate()">
        <div class="inline field six wide">
            <label>专业名称</label>
            <input type="text" placeholder="输入专业名称" name="proname" class="proname" value="${clazz.proname}"><span class="error1" style="display: none">专业名不能为空</span>
        </div>
        <div class="inline field six wide">
            <label>班级名称</label>
            <input type="text" placeholder="输入班级名称" name="name" class="name" value="${clazz.name}"><span class="error2" style="display: none">班级不能为空</span>
        </div>
        <div class="ui calendar inline field six wide" id="example1">
            <label>入学时间</label>
            <div class="ui input left icon inline field six wide">
                <i class="calendar icon"></i>
                <input type="text" placeholder="输入入学时间" name="entrancetime" class="time entranceTime" value="${clazz.entrancetime}"><span class="error3 " style="display: none">时间不能为空</span>
            </div>
        </div>

        <div class="inline field six wide">
            <label>男生人数</label>
            <input type="text" placeholder="输入男生人数" name="boy" class="boy" value="${clazz.boy}"><span class="error4" style="display: none">人数不能为空</span>
        </div>
        <div class="inline field six wide">
            <label>女生人数</label>
            <input type="text" placeholder="输入女生人数" name="girl" class="girl" value="${clazz.girl}"><span class="error5" style="display: none">人数不能为空</span>
        </div>
        <div class="inline field">
            <div id="editor-class" name="ttscheme"></div>
        </div>
        <div class="inline field">
            <button class="ui primary button" id="btn" type="button">添加</button>
            <button class="ui red button" type="reset">重置</button>
        </div>
        <input id="content" type="hidden" name="ttscheme">
    </form>
</div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic-ui-calendar/calendar.js"></script>
<c:if test="${jsonMessage != null && !jsonMessage.success}">
    <script>
        $.growl.error({title: "添加班级提示", message: "${jsonMessage.result}"});
    </script>
</c:if>

<script>
//    $('#example1').calendar({type: 'date'});
    $('#example1').calendar({
        type: 'date',
        formatter: { // 自定义日期的格式
            date: function (date, settings) {
                if (!date) return '';
                var year = date.getFullYear();
                var month = date.getMonth() + 1;
                var day = date.getDate();
                month = month < 10 ? '0' + month : month;
                day = day < 10 ? '0' + day : day;
                return year + '/' + month + '/' + day;
            }
        }
    });
    var E = window.wangEditor;
    var editor = new E('#editor-class');
    editor.create();
    $('#btn').click(function () {
        $('#content').val(editor.txt.html());
        $(".form").submit()
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
/**
 *
 * 入学时间由js校验，其他数据校验后端校验
 */
function checkDate() {
    if ($('.entranceTime').val() === '') {
        $.growl.error({title: "添加班级提示", message: "入学时间不能为空！"});
        return false
    }
    return true;
}
//    function check() {
//            if ($('.proname').val() == '') {
//                $('.error1').css("display", "inline");
//                return false
//            }
//            else {
//                $('.error1').css("display", "none");
//            }
//            if ($('.name').val() == '') {
//                $('.error2').css("display", "inline");
//                return false
//            }
//            else {
//                $('.error2').css("display", "none");
//            }
//            if ($('.time').val() == '') {
//                $('.error3').css("display", "inline");
//                return false
//            }
//            else {
//                $('.error3').css("display", "none");
//            }
//            if ($('.boy').val() == '') {
//                $('.error4').css("display", "inline");
//                return false
//            }
//            else {
//                $('.error4').css("display", "none");
//            }
//            if ($('.girl').val() == '') {
//                $('.error5').css("display", "inline");
//                return false
//            }
//            else {
//                $('.error5').css("display", "none");
//            }
//            return true;
//    }
</script>