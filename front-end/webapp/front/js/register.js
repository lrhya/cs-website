/*
    注册页面中表单的校验
  */
$(function(){
        var us = $('#us');
        var pa = $('#pa');
        var pa1 = $('#pa1');
        var ht = $('#ht');
        var em = $('#em');
        var loc = $('#loc');
        /*
        注册表单的时候, 用正则表达式提前进行验证并提示用户修改
        */
        /*
        reg1-reg2分别对必填选项进行验证
         */
        var reg1 = /^.{3,20}$/;
        var reg2 = /^\w{6,10}$/;
        var reg3 = /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/;
        var reg4 = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
        var reg5 = /^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
        // 鼠标离开时进行验证
        $('.regiU #username').blur(function () {
            var uv1 = $('.regiU #username')[0].value;
            check(reg1, us, uv1)
        });
        $('.regiU #password').blur(function () {
            var uv2 = $('.regiU #password')[0].value;
            check(reg2, pa, uv2)
        });
        $('.regiU #password1').blur(function () {
            var uv2 = $('.regiU #password')[0].value;
            var uv3 = $('.regiU #password1')[0].value;
            check(reg2, pa1, uv2);
            checkPa(uv2, pa1, uv3)
        });
        $('.regiU #http').blur(function () {
            var uv4 = $('.regiU #http')[0].value;
            check(reg3, ht, uv4)
        });
        $('.regiU #email').blur(function () {
            var uv5 = $('.regiU #email')[0].value;
            check(reg4, em, uv5)
        });
        $('.regiU #location').blur(function () {
            var uv6 = $('.regiU #location')[0].value;
            check(reg5, loc, uv6)
        });
        // 用正则表达式进行验证
        function check(reg, h, u) {
            if (!reg.test(u)) {
                h.html("格式不正确或不能为空");
                h.removeClass('te');
                h.addClass('te1')
            } else {
                h.html('');
                h.removeClass('te1');
                h.addClass('te')
            }
        }
        // 验证两次输入的密码是否相同
        function checkPa(u1, h, u2) {
            if (u1 != u2) {
                h.html('两次输入密码不相同');
                h.removeClass('te');
                h.addClass('te1');
            } else {
                h.html('');
                h.removeClass('te1');
                h.addClass('te');
            }
        }
        // 控制注册页提交按钮, 是否可以点击, 当选中"我已阅读并同意学校注册协议"时, 按钮变成可选择状态
        var agree = $('#agree');
        agree.click(function () {
            if ($("#agree").prop("checked") === true) {
                $("#mysubmit").attr("disabled", false);
                $("#mysubmit").addClass('mysubmit');
            } else {
                $("#mysubmit").attr("disabled", 'disabled');
                $("#mysubmit").removeClass('mysubmit');
            }
        })
})