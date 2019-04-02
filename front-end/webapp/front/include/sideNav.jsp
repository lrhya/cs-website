<%@page pageEncoding="UTF-8" %>
    <div class="nav">
        <ul class="nav-list">
            <li class="show"><a href="${pageContext.request.contextPath}/toIndex.do"></a>学院主页
                <ul class="fade-lists">
                    <li><a href="${pageContext.request.contextPath}/toIndex.do">学院主页</a></li>
                </ul>
            </li>
            <li class="show"><a href="#">学院概况</a>
                <ul class="fade-lists">
                    <li>
                        <a href="${pageContext.request.contextPath}/staticNews/front/findStaticNewsByNewsType.do?newsType=1">学院简介</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/staticNews/front/findStaticNewsByNewsType.do?newsType=2">历任领导</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/staticNews/front/findStaticNewsByNewsType.do?newsType=9">现任领导</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/staticNews/front/findStaticNewsByNewsType.do?newsType=3">机构设置</a>
                    </li>
                    <li><a href="#">开发团队</a></li>
                </ul>
            </li>
            <li class="show"><a href="#">师资队伍</a>
                <ul class="fade-lists">
                    <li><a href="${pageContext.request.contextPath}/teacher/front/findZcTeacher.do?lx_id=1">专任教师</a></li>
                    <li><a href="${pageContext.request.contextPath}/teacher/front/findZcTeacher.do?lx_id=2">外聘教师</a></li>
                </ul>
            </li>
            <li class="show"><a href="${pageContext.request.contextPath}/employment/front/toEmployeIndexPage.do">招聘就业</a>
                <ul class="fade-lists">
                    <li><a href="${pageContext.request.contextPath}/employment/front/toEmployeIndexPage.do">招聘就业</a></li>
                </ul>
            </li>
            <li class="show">
                <a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=18">学科建设</a>
                <ul class="fade-lists">
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=18">学科建设</a></li>
                </ul>
            </li>
            <li class="show"><a href="#">人才培养</a>
                <ul class="fade-lists">
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=2">本科生培养</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=3">研究生培养</a></li>
                </ul>
            </li>
            <li class="show"><a href="#">科学研究</a>
                <ul class="fade-lists">
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=5">学术交流</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=4">科研成果</a></li>
                </ul>
            </li>
            <li class="show"><a href="#">学工园地</a>
                <ul class="fade-lists">
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=1">通知公告</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=17">院系新闻</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=6">学工动态</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=7">学生社团</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=8">招生就业</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=9">创新创业</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=10">学习交流</a></li>
                </ul>
            </li>
            <li class="show"><a href="#">党群工作</a>
                <ul class="fade-lists">
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=12">支部生活</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=13">党校团校</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=14">工会工作</a></li>
                </ul>

            </li>
            <li class="show"><a href="#">校友天地</a>
                <ul class="fade-lists">
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=16">校友交流</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=15">校友档案</a></li>
                </ul>
            </li>
            <li class="show"><a href="#">课程建设</a>
                <ul class="fade-lists">
                    <li><a href="#">课程建设</a></li>
                </ul>
            </li>
        </ul>
    </div>
<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/menu.js"></script>

