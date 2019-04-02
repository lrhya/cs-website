$(function () {
    /*
    进行用户登录的弹出框的关闭
    */
        var close = $('.close a');
        close.click(function () {
            $('#loginHidd').css('display', 'none')
        });
        var loginShow = $('.clickReg');
        //  点击按钮进行隐藏
        loginShow.click(function () {
            $('#loginHidd').css('display', 'inline-block')
        })
    /*
    时间横向滚动
    */
        function time() {
            var d = new Date();
            var vYear = d.getFullYear();
            var vMon = d.getMonth() + 1;
            var vDay = d.getDate();
            var h = d.getHours();
            var m = d.getMinutes();
            var se = d.getSeconds();
            //生成当前时间
            s = vYear + '年' + vMon + '月' + vDay + '日' + adder(h) + ':' + adder(m) ;
            //写入到html
            $('.newTime').text(s);
        }
        // 数字小于10时在前面添加0
        function adder(e) {
            return (e < 10 ? '0' + e : e)
        }
        setInterval(function () {
            time();
        }, 1000);

});