$(document).ready(function () {
    /*----------GNB & Location----------*/
    function subLocation() {
        if ($('#container').hasClass('store')) {
            var dep2Menu = $('nav dl:nth-child(3) dd').html();
            $('.location .dep1').text('STORE');
            $('.location .dep2List').append(dep2Menu);
            $('.location .now , .sub h3.pageTitle').text('STORE');
            $('nav .menuList dl:nth-child(3) dt a').addClass('inPage');
            $('.mobileGNB .moMenuList dl:nth-child(3) dt a').addClass('inPage');
            $('.mobileGNB .moMenuList dl:nth-child(3) dd').show();
        };
        if ($('#container').hasClass('store domestic')) {
            $('.location .now').text('국내');
            $('.location li .dep2List a').eq(0).addClass('on');
            $('nav .menuList dl:nth-child(3) dd a:first-child').addClass('inPage');
            $('header .mobileGNB .moMenuList dl:nth-child(3) dd a:first-child').addClass('inPage');
        };
        if ($('#container').hasClass('store overseas')) {
            $('.location .now').text('해외');
            $('.location li .dep2List a').eq(1).addClass('on');
            $('nav .menuList dl:nth-child(3) dd a:nth-child(2)').addClass('inPage');
            $('header .mobileGNB .moMenuList dl:nth-child(3) dd a:nth-child(2)').addClass('inPage');
        };
    };
    subLocation();
    $('.store.domestic .commBoardList td.name').each(function () {
        var telNum = $(this).parent('tr').find('.tel').html();
        $(this).find('span').append(telNum)
    });
    $('.store.overseas .commBoardList td.area').each(function () {
        var areaText = $(this).html();
        $(this).parent('tr').find('.name span').append(areaText)
    });
});