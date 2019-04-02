<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
<style>
    .find {
        margin: 0 10px !important;
    }

    .photoInput {
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
<div class="toolbar clearFix">
    <a class="ui blue button" href="javascript:addIndexPhoto()">
        <i class="icon edit"></i>上传图片
    </a>
</div>
<img border='0' src="" class="imgHover"/>
<table class="ui celled table center aligned striped selectable tiny">
    <thead>
    <tr>
        <th>编号</th>
        <th>名字</th>
        <th>上传时间</th>
        <th colspan="4">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${jsonMessage.isSuccess()}">
        <c:forEach items="${jsonMessage.result}" var="pic" varStatus="index">
            <tr>
                <td>${index.index+1}</td>
                <td>
                    <span class="hoverImg">${pic.imagename} <span style="display: none">${pic.imagepath}</span></span>
                </td>
                <td>${pic.uptime}</td>
                <td>
                    <button class="ui blue button mini" onclick="changePhoto('${pic.id}')"><i class="icon edit"></i>更换图片</button>
                </td>
                <td>
                    <a class="ui button red mini btn-delete" href="javascript:deleteIndexPhoto('${pic.id}')"><i
                            class="icon trash"></i>删除</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<%--删除学生弹窗--%>
<div class="ui small modal delete-modal">
    <div class="header"><i class="warning sign icon red"></i>删除图片</div>
    <div class="content">
        <p>你确定删除该图片吗？</p>
    </div>
    <div class="actions">
        <div class="ui negative button">确定</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<%--上传图片弹窗--%>
<div class="ui small modal" id="uploadPhotoModal">
    <div class="header">上传图片</div>
    <div class="content">
        <form action="" id="addPhotoForm" enctype="multipart/form-data" type="post">
             <span class="browseIndexPhoto">
                <button class="ui basic blue button" type="button">选择图片</button>
                 <span class="show"></span>
                <input type="file" name="photo" id="photo" class="photoInput">
            </span>
        </form>
    </div>
    <div class="actions">
        <div class="ui negative button addPhoto">上传</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<%--更换图片弹窗--%>
<div class="ui small modal" id="changePhotoModal">
    <div class="header">更换图片</div>
    <div class="content">
        <form action="" id="changPhotoForm">
            <span class="changePhoto">
                 <button class="ui blue button mini" type="button"><i class="icon upload"></i>更换图片</button>
                <input type="file" name="photo" class="photoInput">
                <span class="show"></span>
            </span>
        </form>
    </div>
    <div class="actions">
        <div class="ui negative button changePhoto">更换</div>
        <div class="ui positive button">取消</div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/admin/semantic-ui/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/lib/jquery.form/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/main.js"></script>
<script>
    //触发input上传图片
    $(".browseIndexPhoto >button").on('click', function () {
        $(".browseIndexPhoto .photoInput").click();
    });
    $(".browseIndexPhoto .photoInput").change(function () {
        var photo = $(this).val().substring($(this).val().lastIndexOf("\\") + 1);
        $(".browseIndexPhoto .show").html(photo)
    });
    //触发input更换图片
    $(".changePhoto button").on('click', function () {
        $(".changePhoto .photoInput").click();
    });
    $(".changePhoto .photoInput").change(function () {
        var photo = $(this).val().substring($(this).val().lastIndexOf("\\") + 1);
        $(".changePhoto .show").html(photo)
    });

    function deleteIndexPhoto(id) {
        $('.delete-modal').modal('show');
        $(".negative.button").click(function () {
            window.location.href = "${pageContext.request.contextPath}/graduate/deleteById.do?id=" + id;
        })
    }

    //鼠标经过图片路径，图片显示
    $(".hoverImg").mouseenter(function (e) {
            var url = "${pageContext.request.contextPath}/upload/photo" + $(this).find("span").text();
            $(".imgHover").css("left", e.clientX + 10).css("top", e.clientY + 10)
                .attr("src", url).show("fast");
        }).mouseout( function () {
            $(".imgHover").attr("src", "").hide();
        });
    //添加图片
    function addIndexPhoto() {
        $(".browseIndexPhoto .show").html("");
        $("#uploadPhotoModal").modal('show');
        $(".negative.button.addPhoto").click(function () {
            $("#addPhotoForm").ajaxSubmit({
                url: '${pageContext.request.contextPath}/file/uploadPhoto.do',
                type: "post",
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                        var photoPath = data.result;
                        photoPath = photoPath.substring(photoPath.indexOf("photo") + 5);
                        alert(photoPath);
                        window.location.href = "${pageContext.request.contextPath}/graduate/addIndexPic.do?imagepath=" + photoPath;
                        $(this).resetForm(); // 提交后重置表单
                    }else{
                        alert(data.result)
                    }
                }
            });
        })
    }
//更换图片
    function changePhoto(picId) {
        $(".changePhoto .show").html("");
        $("#changePhotoModal").modal('show');
        $(".negative.button.changePhoto").click(function () {
            $("#changPhotoForm").ajaxSubmit({
                url: '${pageContext.request.contextPath}/file/uploadPhoto.do',
                type: "post",
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                        var photoPath = data.result;
                        photoPath = photoPath.substring(photoPath.indexOf("photo") + 5);
                        window.location.href = "${pageContext.request.contextPath}/graduate/changeIndexPic.do?imagepath=" + photoPath+"&id="+picId;
                        $(this).resetForm(); // 提交后重置表单
                    }else{
                        alert(data.result)
                    }
                }
                ,error:function (data) {
                    alert(data)
                }
            });
        })
    }
</script>