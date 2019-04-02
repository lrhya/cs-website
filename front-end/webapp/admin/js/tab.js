/**
 * 陈林的tab
 * @param title
 * @param url
 */
function addTab(title,url) {
    var isExist=false;
    //关闭原来激活的tab
    $('#m-tab .top .item').each(function () {
        $(this).removeClass('active');
    });
    $('#m-tab .bottom').each(function () {
        $(this).removeClass('active');
    });

    //添加tab
    //已存在，直接激活
    $('#m-tab .top .item').each(function () {
        if($(this).attr('data-tab')===title){
            $(this).addClass('active');
            isExist=true;
            //内容显示
            $('.tab').filter("[data-tab="+title+']').addClass('active');
            return;
        }
    });
    if(isExist)
        return;

    //不存在，添加
    var item=$("<span></span>").addClass("item active").attr('data-tab',title).text(title);
    var removeIcon=$("<i></i>").addClass("remove icon").click(function () {
        $('.tab').filter("[data-tab="+$(this).parent().attr('data-tab')+"]").remove();
        ($(this).parent()).remove();
        //关闭的是当前选项卡
        if($(this).parent().hasClass('active')){
            $('.top .item').last().addClass('active');
            $('.tab').last().addClass('active');
        }
    });
    item.append(removeIcon);
    var tab=$("<div></div>").addClass("ui bottom attached tab segment active").attr('data-tab',title);
    if(url!='')
    // tab.load(url);
        tab.append($('<iframe width="100%" height="100%" frameborder="0"></iframe>').attr('src',url));
    $('#m-tab .top.menu').append(item);
    $('#m-tab').append(tab);

    $('.menu .item').tab();
}

function addPTab(title,url) {
    parent.window.addTab(title,url);
}
function refreshPage() {
    // var url = $(".tab.active.bottom").find("iframe").prop("src");
    // alert(url);
    location.reload()
}
function closeOtherPage() {
    $('.top.menu > span').not('.active').remove();
    $('.tab.segment.attached:gt(0)').not('.active').remove();
//        $(".top.menu > a").click();
}
function closeAllPage() {
    $('.top.menu > span').remove();
    $('.tab.segment:gt(0)').remove();
    $(".top.menu > a").click();
}
function goIndexPage() {
    $(".top.menu > a").click();
}