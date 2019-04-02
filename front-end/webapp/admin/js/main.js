/**
 *日期函数，按格式输出日期
 */
function time() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    // console.log(typeof second)
    if (second < 10) {
        second = '0' + second;
    }
    if (minute < 10) {
        minute = '0' + minute;
    }
    if (hour < 10) {
        hour = '0' + hour;
    }
    if (day < 10) {
        day = '0' + day;
    }
    if (month < 10) {
        month = '0' + month;
    }
    var timeInfo = "<b>" + year + "年" + month + "月" + day + "日" + "  " + hour + ":" + minute + ":" + second + "</b>";
    $("#time").html(timeInfo);
    // console.log(timeInfo)
}
/**
 * 入口函数
 */
$(function () {
    /**
     * 调用日期函数
     */
    setInterval(time, 1000);
    /**
     * semantic-ui 下拉菜单
     */
    $("#userOperation").dropdown({
        on: "hover"
    });
    /**
     * semantic-ui 折叠菜单
     */
    $('.ui.accordion').accordion("toggle");
    /**
     * 左侧导航添加样式
     */
    $(".accordion .content li").hover(
        function () {
            $(this).toggleClass("item-hover");
            $(this).parent().prev().toggleClass("nav-hover");
        }
    );
    $(".accordion .title").hover(
        function () {
            $(this).toggleClass("nav-hover").siblings().removeClass("nav-hover");
        }
    );
    /**
     * 左侧导航项，点击后，激活样式
     */
    $(".ui.accordion .content li").click(
        function () {
            // $(this).parent().prev().addClass("active").siblings().removeClass("active");
            $(this).parents(".ui.accordion").find("li").removeClass("item-active");
            $(this).addClass("item-active").siblings().removeClass("item-active");
        }
    );
    /**
     * 控制菜单是否显示
     */
    $("#trigger-menu").click(
        function () {
            alert("test");
            $("#left-nav").fadeToggle();
            return false;
        }
    );
    // $("#trigger-menu .item").on('click',function () {
    //     $("#left-nav").fadeToggle();
    //     return false;
    // });

    $('#main .column .segment').mouseenter(function () {
        $(this).css("border-color","rgba(34, 36, 38, 0.3)");
        $(this).transition('pulse')
        ;
    });
    $('#main .column .segment').mouseout(function () {
        $(this).css("border-color","rgba(34, 36, 38, 0.15)");
        $(this).transition('clear queue');
    });
});