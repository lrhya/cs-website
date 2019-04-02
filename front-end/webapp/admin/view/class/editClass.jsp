<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic-ui-calendar/calendar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
<style>
    .con1 {
        padding-top: 14px;
    }
</style>
<div class="ui container con1">
    <div class="ui form">
        <form action="${pageContext.request.contextPath}/clazz/updateClazz.do" class="ui form" method="post">
            <input type="hidden" name="id" value="${jsonMessage.result.id}">
            <div class="inline field six wide">
                <label>专业名称</label>
                <input type="text" placeholder="输入专业名称" name="proname" value="${jsonMessage.result.proname}">
            </div>
            <div class="inline field six wide">
                <label>班级名称</label>
                <input type="text" placeholder="输入班级名称" name="name" value="${jsonMessage.result.name}">
            </div>
            <div class="ui calendar inline field six wide" id="example1">
                <label>入学时间</label>

                <div class="ui input left icon inline field six wide" >
                    <i class="calendar icon"></i>
                    <input type="text" placeholder="输入入学时间" name="entrancetime" value="${jsonMessage.result.entrancetime}">
                </div>

            </div>
            <div class="inline field six wide">
                <label>男生人数</label>
                <input type="text" placeholder="输入男生人数" name="boy" value="${jsonMessage.result.boy}">
            </div>
            <div class="inline field six wide">
                <label>女生人数</label>
                <input type="text" placeholder="输入女生人数" name="girl" value="${jsonMessage.result.girl}">
            </div>
            <%--回显备注说明--%>
            <div class="inline field">
                <div id="editor-class">${jsonMessage.result.ttscheme}</div>
            </div>
            <div class="inline field">
                <button class="ui primary button" id="btn">更新</button>
                <button class="ui red button">重置</button>
            </div>
            <input id="content" type="hidden" name="ttscheme">
        </form>
    </div>
</div>
<c:if test="!${jsonMessage.success}">
    ${jsonMessage.result}
</c:if>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic-ui-calendar/calendar.js"></script>
<c:if test="${!jsonMessage2.success && jsonMessage2.result != null}">
    <script>
        $.growl.error({    title: "编辑资源提示", message: "${jsonMessage2.result}" });
    </script>
</c:if>
<script>

    $('#example1').calendar({
        type: 'date',
        formatter: { // 自定义日期的格式
            date: function(date, settings) {
                if (!date) return '';
                var year  = date.getFullYear();
                var month = date.getMonth() + 1;
                var day   = date.getDate();
                month = month < 10 ? '0'+month : month;
                day   = day   < 10 ? '0'+day   : day;
                return year + '/' + month + '/' + day;
            }
        }
    });
    var E = window.wangEditor;
    var editor = new E('#editor-class');
    editor.create();
    $('#btn').click(function () {
        $('#content').val(editor.txt.html());
        $(".form").submit();
    });
</script>

