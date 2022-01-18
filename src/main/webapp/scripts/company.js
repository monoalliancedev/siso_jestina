$(document).ready(function () {
    /*----------GNB & Location----------*/
    function subLocation() {
        if ($('#container').hasClass('company')) {
            var dep2Menu = $('nav dl:first-child dd').html();
            $('.location .dep1').text('COMPANY');
            $('.location .dep2List').append(dep2Menu);
            $('nav .menuList dl:first-child dt a').addClass('inPage');
            $('.mobileGNB .moMenuList dl:first-child dt a').addClass('inPage');
            $('.mobileGNB .moMenuList dl:first-child dd').show();
        };
        if ($('#container').hasClass('company vision')) {
            $('.location .now , .sub h3.pageTitle').text('비전');
            $('.location li .dep2List a').eq(0).addClass('on');
            $('nav .menuList dl:first-child dd a:first-child').addClass('inPage');
            $('header .mobileGNB .moMenuList dl:first-child dd a:first-child').addClass('inPage');
        };
        if ($('#container').hasClass('company history')) {
            $('.location .now , .sub h3.pageTitle').text('연혁');
            $('.location li .dep2List a').eq(1).addClass('on');
            $('nav .menuList dl:first-child dd a:nth-child(2)').addClass('inPage');
            $('.mobileGNB .moMenuList dl:first-child dd a:nth-child(2)').addClass('inPage');
        };
        if ($('#container').hasClass('company business')) {
            $('.location .now , .sub h3.pageTitle').text('사업영역');
            $('.location li .dep2List a').eq(2).addClass('on');
            $('nav .menuList dl:first-child dd a:nth-child(3)').addClass('inPage');
            $('.mobileGNB .moMenuList dl:first-child dd a:nth-child(3)').addClass('inPage');
        };
        if ($('#container').hasClass('company identity')) {
            $('.location .now , .sub h3.pageTitle').text('BI');
            $('.location li .dep2List a').eq(3).addClass('on');
            $('nav .menuList dl:first-child dd a:nth-child(4)').addClass('inPage');
            $('.mobileGNB .moMenuList dl:first-child dd a:nth-child(4)').addClass('inPage');
        };
        if ($('#container').hasClass('company contact')) {
            $('.location .now , .sub h3.pageTitle').text('Contact');
            $('.location li .dep2List a').eq(4).addClass('on');
            $('nav .menuList dl:first-child dd a:nth-child(5)').addClass('inPage');
            $('.mobileGNB .moMenuList dl:first-child dd a:nth-child(5)').addClass('inPage');
        };
    };
    subLocation();
    /*----------연혁----------*/
    $('.history .yearSelectWrap dt').click(function () {
        $(this).toggleClass('on');
        $(this).next('dd').slideToggle();
    });
    $('.history .yearSelectWrap dd').mouseleave(function () {
        $('.history .yearSelectWrap dt').removeClass('on');
        $(this).slideUp();
    });
    $('.history .yearSelectWrap dd a').click(function () {
        $('.history .yearSelectWrap dt').removeClass('on');
        $('.history .yearSelectWrap dd').slideUp();
        $('.history .yearData').hide();
        $($(this).attr('href')).show();
        var thisYearText = $(this).text();
        $('.history .yearSelectWrap dt span i').text(thisYearText)
        return false;
    });
    $('.history .yearInfo h5 i.prev').click(function () {
        var thisParent = $(this).parents('.yearData');
        var thisYear = thisParent.next('.yearData').find('h5 b').text();
        thisParent.hide();
        thisParent.next('.yearData').show();
        $('.history .yearSelectWrap dt span i').text(thisYear);
    });
    $('.history .yearInfo h5 i.next').click(function () {
        var thisParent = $(this).parents('.yearData');
        var thisYear = thisParent.prev('.yearData').find('h5 b').text();
        thisParent.hide();
        thisParent.prev('.yearData').show();
        $('.history .yearSelectWrap dt span i').text(thisYear);
    });
    var startX, endX;
    $(".history .yearData").on('touchstart',function(event){
        startX = event.originalEvent.changedTouches[0].screenX;
    });
    $(".history .yearData").on('touchend',function(event){
        endX=event.originalEvent.changedTouches[0].screenX;
        if(startX-endX>50){
            $(this).find('h5 .next').trigger('click')
        }else if(endX-startX>50){
            $(this).find('h5 .prev').trigger('click')
        }
    });
    $(window).scroll(function () {
        var historyContentPos = $('.history .content').offset().top;
        var headerHT = $('header').outerHeight();
        if ($(window).scrollTop() > historyContentPos) {
            $('.history .yearSelectWrap dl').addClass('fix');
            $('.history .yearSelectWrap dl').css('top', headerHT)
        }
        else {
            $('.history .yearSelectWrap dl').removeClass('fix');
            $('.history .yearSelectWrap dl').css('top', 0)
        }
    });
});