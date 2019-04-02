<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="ui three column doubling stackable grid">
    <div class="column">
        <a href="${pageContext.request.contextPath}/news/toAddNewsPage.do">
            <div class="ui segment clearFix">
                <div class="left fl"><i class="plus square outline icon"></i></div>
                <div class="right fl"><span>添加新闻</span></div>
            </div>
        </a>
    </div>
    <div class="column">
        <a href="${pageContext.request.contextPath}/news/newsList.do">
            <div class="ui segment clearFix">
                <div class="left fl" style="background-color:#F7B824;"><i class="file text outline icon"></i>
                </div>
                <div class="right fl"><span>新闻列表</span></div>
            </div>
        </a>
    </div>
    <div class="column">
        <a href="${pageContext.request.contextPath}/user/toAddUi.do">
            <div class="ui segment clearFix">
                <div class="left fl" style="background-color:#FF5722;"><i class="add user icon"></i></div>
                <div class="right fl"><span>添加用户</span></div>
            </div>
        </a>
    </div>
    <div class="column">
        <div class="ui segment">
            <a href="${pageContext.request.contextPath}/teacher/findTeacherPage.do">
                <div class="ui segment clearFix">
                    <div class="left fl" style="background-color:#009688;"><i class="send outline icon"></i></div>
                    <div class="right fl"><span>师资队伍</span></div>
                </div>
            </a>
        </div>
    </div>
</div>