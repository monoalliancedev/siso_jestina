$(document).ready(function () {
    //Common
    function containerSub() {
        if ($('#container').hasClass('sub')) {
            $('header').addClass('subHeader')
        }
    }
    containerSub();
    //Location
    $('.location li.depmenu').hover(function () {
        $(this).find('.now').addClass('on');
        $(this).find('.dep2List').stop().slideDown();
    }, function () {
        $(this).find('.now').removeClass('on');
        $(this).find('.dep2List').stop().slideUp();
    })
});