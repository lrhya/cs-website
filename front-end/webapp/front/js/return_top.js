/**
 * 前台侧边导航样式
 */
$(function () {
    //绑定页面滚动事件
    $(window).bind('scroll',function(){
        var len=$(this).scrollTop()
        if(len>=100){
            //显示回到顶部按钮
            $('#return_top').show();
        }else{
            //影藏回到顶部按钮
            $('#return_top').hide();
        }
    })
    //绑定回到顶部按钮的点击事件
    $('#return_top').click(function(){
        //动画效果，平滑滚动回到顶部
        $('html,body').animate({scrollTop: '0px'}, 300);
        //不需要动画则直接
        //$('html,body').scrollTop(0)
    })
});