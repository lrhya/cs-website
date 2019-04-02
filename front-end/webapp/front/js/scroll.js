$(function(){
    /*
     首页轮播图
     */
        var Psrc = $('.picture img');
        var imgLis = $('.picture ul li');
        var index = 1;
        var playScroll;
        auto();
        function auto() {
            playScroll = setInterval(function () {
                //target/CS/upload/201711/slide_1.jpg  ./front/img/slide_' + index + '.jpg
                Psrc.attr('src', './upload/201711/slide_' + index + '.jpg');
                LiChange();
                if (index > 3)
                    index = 1;
                else {
                    index++
                }
            }, 4000)
        }
        Psrc.mouseover(function () {
            clearInterval(playScroll)
        });
        Psrc.mouseout(function () {
            auto()
        });
        function LiChange() {
            var liT = imgLis.eq(index - 1);
            liT.addClass('active');
            imgLis.not(liT).removeClass('active')
        }
        imgLis.mouseover(function () {
            clearInterval(playScroll);
            index = $(this).index() + 1;
            Psrc.attr('src', './upload/201711/slide_' + index + '.jpg');
            $(this).addClass('active');
            imgLis.not(this).removeClass('active')
        });
        imgLis.mouseout(function () {
            auto()
        })
})