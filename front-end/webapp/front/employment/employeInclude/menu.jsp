<%@page pageEncoding="UTF-8" %>
<div class="menu">
    <div class="nav">
        <ul class="nav-list">
            <li class="show"> <a href="${pageContext.request.contextPath}/toIndex.do">学院主页</a></li>
            <li class="show"> <a href="${pageContext.request.contextPath}/employment/front/toEmployeIndexPage.do">招聘就业</a></li>
            <li class="show clickReg"> <a href="${pageContext.request.contextPath}/employment/front/toResumePage.do">个人简历</a></li>
            <li class="show clickReg"> <a href="${pageContext.request.contextPath}/employment/front/employeNewTitleNav.do?newsType=21">招聘信息</a></li>
            <li class="show clickReg"> <a href="${pageContext.request.contextPath}/employment/front/employeNewTitleNav.do?newsType=22">就业指导</a></li>
            <li class="show clickReg"> <a href="${pageContext.request.contextPath}/employment/front/employeNewTitleNav.do?newsType=3">创业指导</a></li>
            <li class="show clickReg"> <a href="${pageContext.request.contextPath}/employment/front/employeNewTitleNav.do?newsType=24">考研指导</a></li>
        </ul>
    </div>
    <div class="login">
        <div class="title"></div>
        <div class="f-style">
            <form action="" method="post" class="form">
                <ul>
                    <li>用户名:<input type="text" name="name" size="14" class="right-con"></li>
                    <li>密码:<input type="password" name="password" size="14" class="right-con"></li>
                    <li><input type="text" size="5" class="left-con" placeholder="输入验证码"><span class="code"><img src="${pageContext.request.contextPath}/getCaptchaImg.do" alt=""></span></li>
                    <li>
                        <input type="radio" name="identity" value="用人单位">用人单位
                        <input type="radio" name="identity" value="毕业生" checked="checked">毕业生
                        <input type="radio" name="identity" value="管理员">管理员
                    </li>
                    <li class="subm"><input type="submit" value="登录">
                        <input type="reset" value="重置">
                    </li>
                </ul>
            </form>
            <div class="newUser">
                新用人单位，请点击：<a href="${pageContext.request.contextPath}/front/employment/register.jsp">单位注册</a>
            </div>
        </div>
    </div>
</div>


