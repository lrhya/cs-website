/**
 * 前台侧边导航样式
 */
$(function () {
    var showMenu = $('.nav .nav-list .show');
    // showMenu.hover(function () {
    //         $(this).find("ul").slideToggle("slow");
    //         $(this).find("ul").addClass("active");
    //     }, function () {
    //         $(this).find("ul").slideToggle();
    //     }
    // )
    showMenu.hover(function () {
            $(this).find("ul").stop().slideDown("slow");
            $(this).find("ul").addClass("active").siblings().removeClass("active");
        }, function () {
            $(this).find("ul").stop().slideUp("slow");
        }
    )
});