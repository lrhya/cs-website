<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.css">
<style>
    .find {
        margin: 0 10px !important;
    }

    .photoInput, .resumeInput {
        display: none;
    }

    .imgHover {
        width: 130px;
        height: 130px;
        display: none;
        position: absolute;
        z-index: 100;
    }

    .hoverImg {
        cursor: pointer;
    }
</style>
<form action="${pageContext.request.contextPath}/student/findStudentPage.do" method="post" class="ui form" id="form">
    <div class="inline field fl find">
        <label for="">选择班级名称</label>
        <select name="cid" id="" title="">
            <option value="0"></option>
            <c:forEach items="${clazzListJson.result}" var="clazz">
                <c:if test="${clazz.id == v_student.cid}">
                    <option value="${clazz.id}" selected>${clazz.name}</option>
                </c:if>
                <option value="${clazz.id}">${clazz.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="ui search fl find">
        <div class="ui icon input">
            <input class="prompt username" type="text" placeholder="输入学号" name="username"
                   value="${v_student.username}">
        </div>
        <div class="ui icon input find">
            <input class="prompt name" type="text" placeholder="输入姓名" name="name" value="${v_student.name}">
        </div>
    </div>
    <button class="ui teal button fl find" type="submit"><i class="icon search"></i>查找</button>
    <a id="btn-add" class="ui blue button fl find" href="javascript:void(0)"><i
            class="icon add"></i>添加</a>
    <button class="ui blue button small fl add red" id="batchDelete" type="button">
        <i class="icon remove"></i>批量删除
    </button>
    <img border='0' src="" class="imgHover"/>
    <table class="ui celled table center aligned striped selectable tiny">
        <thead>
        <tr>
            <th>选择</th>
            <th>学号</th>
            <th>姓名</th>
            <th>班级</th>
            <th>图片</th>
            <th>学生简历</th>
            <th colspan="4">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${jsonMessage.result.dataList}" var="student">
            <tr>
                <td><input type="checkbox" name="stuId" class="stu_id" value="${student.id}" title="选择学生"></td>
                <td>${student.username}</td>
                <td>${student.name}</td>
                <td>${student.cname}</td>
                <td><c:choose>
                    <c:when test="${student.photoName != null}">
                    <span class="hoverImg">
                            ${student.photoName}<span style="display: none">${student.photo}</span>
                    </span>
                    </c:when>
                    <c:otherwise>
                        暂无学生图片
                    </c:otherwise>
                </c:choose></td>
                <td>
                    <c:choose>
                        <c:when test="${student.resume != null && student.resume != ''}">
                            <a href="${pageContext.request.contextPath}/file/downLoadFile.do?filePath=/resume${student.resume}"
                               title="学生简历">${student.resumeName}</a>
                        </c:when>
                        <c:otherwise>
                            暂无学生简历
                        </c:otherwise>
                    </c:choose>

                </td>
                <td>
                    <a class="ui blue button mini" href="javascript:changePhoto(${student.id})">
                        <i class="icon edit"></i>更换图片
                    </a>
                </td>
                <td>
                    <a class="ui button blue mini" href="javascript:changeResume(${student.id})"><i
                            class="icon edit"></i>更换简历</a>
                </td>
                <td>
                    <a class="ui blue button mini"
                       href="${pageContext.request.contextPath}/student/toEditUi.do?id=${student.id}"><i
                            class="icon edit"></i>编辑</a>
                </td>
                <td>
                    <a class="ui button red mini btn-delete" href="javascript:deleteStudent(${student.id})"><i
                            class="icon trash"></i>删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
<div class="ui right floated pagination menu">
    <span class="item">当前第${jsonMessage.result.currentPage}页</span>
    <span class="item">共${jsonMessage.result.totalPage}页</span>
    <span class="item">每页显示${jsonMessage.result.pageSize}条</span>
    <a href="${pageContext.request.contextPath}/student/findStudentPage.do?pageNum=1&name=${v_student.name}&cid=${v_student.cid}&username=${v_student.username}"
       class="active item first">首页</a>
    <a href="${pageContext.request.contextPath}/student/findStudentPage.do?pageNum=${jsonMessage.result.currentPage -1}&cid=${v_student.cid}&name=${v_student.name}&username=${v_student.username}"
       class="item pre">上一页</a>
    <a href="${pageContext.request.contextPath}/student/findStudentPage.do?pageNum=${jsonMessage.result.currentPage +1}&cid=${v_student.cid}&name=${v_student.name}&username=${v_student.username}"
       class="item next">下一页</a>
    <a href="${pageContext.request.contextPath}/student/findStudentPage.do?pageNum=${jsonMessage.result.totalPage}&cid=${v_student.cid}&name=${v_student.name}&username=${v_student.username}"
       class="item last">尾页</a>
    <%--<span class="item">跳转到 <input type="text" class="goPage">页</span> <a href="javascript:go()" class="active item">确定</a>--%>
</div>
<%--批量删除学生--%>
<div class="ui small modal" id="deleteStduentBatchModal">
    <div class="header"><i class="warning sign icon red"></i>批量删除学生</div>
    <i class="warning sign icon red"></i>学生图片、简历等也会被删除
    <div class="content">
        <p>你确定删除这些学生？</p>
    </div>
    <div class="actions">
        <div class="ui negative button deleteNewsBatch">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<%--删除学生弹窗--%>
<div class="ui small modal delete-modal">
    <div class="header"><i class="warning sign icon red"></i>删除学生</div>
    <div class="content">
        <p><i class="warning sign icon red"></i>你确定删除本学生吗？</p>
    </div>
    <div class="actions">
        <div class="ui negative button">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<%--更换图片弹窗--%>
<div class="ui small modal" id="changePhoto">
    <div class="header">更换图片</div>
    <p class="description">
        <i class="warning sign icon red"></i>如果以前图片存在，以前图片将被替换
    </p>
    <div class="content">
        <form action="" id="photoForm">
             <span class="browsePhoto">
                <button class="ui basic blue button" type="button">选择图片</button>
                 <span class="show"></span>
                <input type="file" name="photo" id="photo" class="photoInput">
            </span>
        </form>
    </div>
    <div class="actions">
        <div class="ui negative button">上传</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<%--更换简历弹窗--%>
<div class="ui small modal" id="uploadResume">
    <div class="header">更换简历</div>
    <div class="description"><i class="warning sign icon red"></i>学生简历，要求上传word文档，如果以前简历存在，以前简历将被替换</div>
    <div class="content">
        <form action="" id="resumeForm">
            <span class="browseResume">
                <button class="ui basic blue button" type="button">选择简历</button>
                <span class="show"></span>
                <input type="file" name="resume" id="resume" class="resumeInput">
            </span>
        </form>
    </div>
    <div class="actions">
        <div class="ui negative button">更换</div>
        <div class="ui positive button">取消</div>
    </div>
    <input type="hidden" class="baseurl" value="${pageContext.request.contextPath}">
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/growl/jquery.growl.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/jquery.form/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>

    $('#batchDelete').click(function () {

        if ($('.stu_id').is(':checked')) {

            $('#deleteStduentBatchModal').modal('show');
            $(".negative.button.deleteNewsBatch").click(function () {
                var baseurl = $('.baseurl').val();
                $('#form').attr("action", baseurl + "/student/deleteStudentBatch.do").submit();
            })
        }


    });
    //触发input更换学生简历
    $(".browseResume > button").on('click', function () {
        $(".resumeInput").click();
    });
    $(".resumeInput").change(function () {
        var resume = $(this).val().substring($(this).val().lastIndexOf("\\") + 1);
        $(".browseResume .show").html(resume)
    });

    //触发input更换学生图片
    $(".browsePhoto > button").on('click', function () {
        $(".photoInput").click();
    });
    $(".photoInput").change(function () {
        var photo = $(this).val().substring($(this).val().lastIndexOf("\\") + 1);
        $(".browsePhoto .show").html(photo)
    });
    function deleteStudent(id) {
        $('.delete-modal').modal('show');
        $(".negative.button").click(function () {
            var username = $('.username').val();
            var name = $('.name').val();
            var cid = $('[selected]').val();
            window.location.href = "${pageContext.request.contextPath}/student/deleteStudent.do?id=" + id + "&cid=" + cid + "&name=" + name + "&username=" + username;
        })
    }
    //更换学生图片
    function changePhoto(studentId) {
        $(".browsePhoto .show").html("");
        $("#changePhoto").modal('show');
        $(".negative.button").click(function () {
            $("#photoForm").ajaxSubmit({
                url: '${pageContext.request.contextPath}/file/uploadPhoto.do',
                type: "post",
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                        var photoPath = data.result;
                        photoPath = photoPath.substring(photoPath.indexOf("photo") + 5);
//                        alert(photoPath);
                        window.location.href = "${pageContext.request.contextPath}/student/updatePhoto.do?id=" + studentId + "&photo=" + photoPath;
                        $(this).resetForm(); // 提交后重置表单
                    } else {
                        alert(data.result);
                        //$.growl.error({title: "更换图片提示", message: data.result});
                    }
                }
            });
        })
    }
    function changeResume(studentId) {
        $(".browseResume .show").html("");
        $("#uploadResume").modal('show');
        $(".negative.button").click(function () {
            $("#resumeForm").ajaxSubmit({
                url: '${pageContext.request.contextPath}/file/uploadResume.do',
                type: "post",
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                        var resumePath = data.result;
                        resumePath = resumePath.substring(resumePath.indexOf("resume") + 6);
                        window.location.href = "${pageContext.request.contextPath}/student/updateResume.do?id=" + studentId + "&resume=" + resumePath;
                        $(this).resetForm(); // 提交后重置表单
                    } else {
                        alert(data.result);
//                        $.growl.error({title: "更换简历提示", message: data.result});
                    }
                }
            });
        })
    }
    $(".hoverImg").hover(function (e) {
            var url = "${pageContext.request.contextPath}/upload/photo" + $(this).find("span").text();
            $(".imgHover").css("left", e.clientX + 10).css("top", e.clientY + 10)
                .attr("src", url).show("fast");
        },
        function () {
            $(".imgHover").attr("src", "").hide();
        }
    );

    $('#btn-add').click(function () {
        window.location.href = "${pageContext.request.contextPath}/student/toAddUi.do";
    });
</script>