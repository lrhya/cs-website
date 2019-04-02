<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="湖北师范大学计算机科学与技术学院 官网" />
    <title>湖北师范大学计算机院网站</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon"/>
    <link href="${pageContext.request.contextPath}/front/swiper/swiper.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/front/css/main.css" rel="stylesheet"/>
    <style>
        .swiper-container img {
            width: 1176px;
            height: 450px;
        }
        .webTitle{
            position: absolute;
            text-indent: -9999em;
        }
    </style>
</head>
<body>
<%--增加搜索引擎搜索概率--%>
<h1 class="webTitle">湖北师范大学计算机科学与技术学院</h1>
<jsp:include page="front/include/header.jsp"/>
<jsp:include page="front/include/sideNav.jsp"/>
<div class="main">
    <div id="content">
           <c:choose>
                   <c:when test="${carouselPicMessage.success}">
                       <div class="swiper-container">
                           <div class="swiper-wrapper">
                               <c:forEach items="${carouselPicMessage.result}" var="pic">
                                   <div class="swiper-slide">
                                       <img src="${pageContext.request.contextPath}/upload/photo/${pic.imagepath}">
                                   </div>
                               </c:forEach>
                           </div>
                           <!-- 滚动条 -->
                           <div class="swiper-scrollbar"></div>
                           <!-- 分页器 -->
                           <div class="swiper-pagination"></div>
                           <!-- 导航按钮 -->
                           <div class="swiper-button-prev"></div>
                           <div class="swiper-button-next"></div>
                       </div>
                   </c:when>
               <c:otherwise>
                   <jsp:include page="/front/include/sideNav.jsp"/>
               </c:otherwise>
           </c:choose>

        <div class="cont">
            <div class="cont-child">
                <div class="title">
                    <span class="label">公告通知</span>
                    <span class="more">
                        <a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=1">更多</a>
                    </span>
                </div>
                <div class="lists">
                    <ul>
                        <c:if test="${jsonNotice.success}">
                            <c:forEach items="${jsonNotice.result}" var="notice">
                                <li>
                                    <a href="${pageContext.request.contextPath}/news/front/findNewsById.do?id=${notice.id}">${notice.title}</a>
                                    <span class="time">${notice.composetime}</span>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="cont-child">
                <div class="title">
                    <span class="label">学工动态 </span>
                    <span class="more">
                         <a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=6">更多</a>
                    </span>
                </div>
                <div class="lists">
                    <ul>
                        <c:if test="${jsonXueGong.success}">
                            <c:forEach items="${jsonXueGong.result}" var="XueGong">
                                <li>
                                    <a href="${pageContext.request.contextPath}/news/front/findNewsById.do?id=${XueGong.id}">${XueGong.title}</a>
                                    <span class="time">${XueGong.composetime}</span>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="cont-child">
                <div class="title">
                    <span class="label">学院新闻</span>
                    <span class="more">
                        <a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=11">更多</a>
                    </span>
                </div>
                <div class="lists">
                    <ul>
                        <c:if test="${jsonNews.success}">
                            <c:forEach items="${jsonNews.result}" var="news">
                                <li>
                                    <a href="${pageContext.request.contextPath}/news/front/findNewsById.do?id=${news.id}">${news.title}</a>
                                    <span class="time">${news.composetime}</span>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="cont-child">
                <div class="title">
                    <span class="label">学院新闻</span>
                    <span class="more">
                        <a href="${pageContext.request.contextPath}/news/front/newTitleNav.do?newsType=11">更多</a>
                    </span>
                </div>
                <div class="lists">
                    <ul>
                        <c:if test="${jsonNews.success}">
                            <c:forEach items="${jsonNews.result}" var="news">
                                <li>
                                    <a href="${pageContext.request.contextPath}/news/front/findNewsById.do?id=${news.id}">${news.title}</a>
                                    <span class="time">${news.composetime}</span>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="cont-next">
                <div class="title">
                    校企合作
                </div>
                <ul>
                    <li>
                        <a href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/front/img/school1.png">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/front/img/school2.png">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/front/img/school3.png">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/front/img/school4.png">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/front/img/school5.png">
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/front/img/school6.png">
                        </a>
                    </li>
                </ul>
            </div>
            <div class="cont-right ">
                <div class="title">
                    友情链接
                </div>
                <ul id="friend-picture">
                    <li><a href="http://www.jwgl.hbnu.edu.cn/(52cc4345zsbyuymhy0fv5sy0)/default2.aspx"><img src="${pageContext.request.contextPath}/front/img/j1.png" alt="">
                        <div class="mana">教务管理</div>
                    </a></li>
                    <li><a href="http://www.cs.hbnu.edu.cn//jinping/net.html"><img
                            src="${pageContext.request.contextPath}/front/img/j2.png" alt="">
                        <div class="mana">网络课程</div>
                    </a></li>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/front/img/j3.png" alt="">
                        <div class="mana">问卷调查</div>
                    </a></li>
                    <li><a href="${pageContext.request.contextPath}/resource/front/resourceNav.do"><img src="${pageContext.request.contextPath}/front/img/j4.png" alt="">
                        <div class="mana">文件下载</div>
                    </a></li>
                </ul>
            </div>
        </div>
    </div>

</div>
<div class="clear"></div>
<jsp:include page="front/include/footer.jsp"/>

<script src="${pageContext.request.contextPath}/front/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/front/swiper/swiper.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/front/js/scroll.js"></script>
<script>
    var mySwiper = new Swiper('.swiper-container', {
        autoplay: 2000,//可选选项，自动滑动
        loop: true,
        zoom: true,
        scrollbar: '.swiper-scrollbar',
        scrollbarHide: false,
        scrollbarDraggable: true,
        lazyLoading: true,
        autoplayDisableOnInteraction : false,
        scrollbarSnapOnRelease:true,
        // 分页器
        pagination: '.swiper-pagination',
        paginationElement : 'li',
        paginationClickable :true,
        // 前进后退按钮
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev'

    })
</script>
</body>
</html>