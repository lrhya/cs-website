<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .teacher .find {
        margin: 4px 25px;
    }

    .teacher .add {
        margin: 4px 40px;
    }
</style>
<c:if test="${teacherType.success}">
    <c:set var="teacherTypes" value="${teacherType.result}"/>
</c:if>
<div class="ui container">
    <form action="${pageContext.request.contextPath}/teacher/findTeacherPage.do" class="ui form teacher"
          method="post">
        <div class="field fl find">
            <div class="inline field">
                <label>选择教师类型</label>
                <select name="zhichenghao" title=教师类型">
                    <option value=""></option>
                    <c:forEach items="${teacherTypes}" var="teacherType">
                        <c:choose>
                            <c:when test="${v_teacher.zhichenghao==teacherType.id}">
                                <option value="${teacherType.id}" selected>${teacherType.zhicheng}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${teacherType.id}">${teacherType.zhicheng}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="ui search fl find">
            <div class="ui icon input">
                <input class="prompt" type="text" placeholder="输入用户名" name="name" value="${v_teacher.name}">
            </div>
            <div class="results"></div>
        </div>
        <button class="ui teal button fl find" type="submit"><i class="icon search"></i>查找</button>
        <a id="btn-add" class="ui blue button fl add" href="javascript:void(0);"><i class="icon add"></i>添加</a>
    </form>
    <table class="ui celled table center aligned selectable striped">
        <thead>
        <tr>
            <th>选择</th>
            <th>姓名</th>
            <th>职称</th>
            <th>类型</th>
            <th colspan="3">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${jsonMessage.success}">
            <c:set var="teachers" value="${jsonMessage.result.dataList}"/>
            <c:set var="page" value="${jsonMessage.result}"/>
        </c:if>
        <c:forEach items="${teachers}" var="teacher">
            <tr>
                <td><input type="checkbox" name="id" title=""></td>
                <td>${teacher.name}</td>
                <td>${teacher.zhicheng}</td>
                <td>${teacher.lxmc}</td>
                <td>
                    <a class="ui blue teal button mini"
                       href="${base}/teacher/admin/findById.do?id=${teacher.id}">
                        <i class="icon find"></i>查看
                    </a>
                </td>
                <td>
                    <a class="ui blue button mini" href="${base}/teacher/toEditUi.do?id=${teacher.id}"><i
                            class="icon edit"></i>编辑
                    </a>
                </td>
                <td>
                    <a class="ui button red mini" href="javascript:deleteTeacher(${teacher.id})">
                        <i class="icon trash"></i>删除
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <input type="hidden" id="baseUrl" value="${pageContext.request.contextPath}">
    <div class="ui right floated pagination menu">
        <span class="item">当前第${page.currentPage}页</span>
        <span class="item">共${page.totalPage}页</span>
        <span class="item">每页显示${page.pageSize}条</span>
        <a href="${base}/teacher/findTeacherPage.do?zhichenghao=${v_teacher.zhichenghao}&name=${v_teacher.name}"
           class="item">首页</a>
        <a href="${base}/teacher/findTeacherPage.do?zhichenghao=${v_teacher.zhichenghao}&name=${v_teacher.name}&pageNum=${page.currentPage -1} "
           class="item"><i class="chevron left icon"></i>上一页</a>
        <a href="${base}/teacher/findTeacherPage.do?zhichenghao=${v_teacher.zhichenghao}&name=${v_teacher.name}&pageNum=${page.currentPage +1}"
           class="item">下一页<i class="chevron right icon"></i></a>
        <a href="${base}/teacher/findTeacherPage.do?zhichenghao=${v_teacher.zhichenghao}&name=${v_teacher.name}&pageNum=${page.totalPage}"
           class="item">尾页</a>
        <span>跳转到 <input type="text" style="width: 36px" title="" class="goPage">页</span> <a href="javascript:go()"
                                                                                             class="item">确定</a>
    </div>
    <div class="ui small modal" id="deleteTeacher">
        <div class="header"><i class="warning sign icon red"></i>删除教师</div>
        <div class="content">
            <p>你确定删除本教师吗？</p>
        </div>
        <div class="actions">
            <div class="ui negative button">确定</div>
            <div class="ui positive button">取消</div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    function go() {
        var num = $(".goPage").val();
        window.location.href = $("#baseUrl").val() + "/teacher/findTeacherPage.do?pageNum=" + num;
    }
    function deleteTeacher(id) {
        $('#deleteTeacher').modal('show');
        $(".negative.button").click(function () {
            console.log($(this).find(":hidden").val());
            window.location.href = $("#baseUrl").val() + "/teacher/deleteTeacher.do?id=" + id;
        })
    }

    $('#btn-add').click(function () {
        parent.window.addTab('添加教师','${pageContext.request.contextPath}/teacher/toAddUi.do');
    });
</script>
