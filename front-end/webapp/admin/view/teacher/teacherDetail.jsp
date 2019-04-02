<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/wangEditor.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
    <style>
        #content{
            margin: 50px 10px;
        }
        .back{
            margin:8px 80px;
        }
    </style>
            <div class="ui container">

                <c:if test="${jsonMessage.success}">
                    <c:set var="teacher" value="${jsonMessage.result}"/>
                </c:if>
                    <h3 class="txt-center">${teacher.name} 教师简介</h3>
                <div class="fr">
                    <label class="" for="zhicheng">教师职称</label>
                    <span id="zhicheng">${teacher.zhicheng}</span>
                </div>
                <textarea name="content" id="content2" hidden="hidden" title="content"></textarea>
                <div id="content">${teacher.jianjie}</div>
            </div>
            <div class="fr back">
                <a class="ui primary button" href="javascript:back()"> 返回</a>
            </div>
        </div>

        <c:if test="${!jsonMessage.success}">
            <div class="ui error message">
                    ${jsonMessage.result}
            </div>
        </c:if>

<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    function back() {
        window.history.go(-1)
    }
</script>
