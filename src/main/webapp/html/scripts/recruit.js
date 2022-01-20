$(document).ready(function () {
    /*----------직무소개----------*/
    function dutyFun() {
        $('.duty .tabDataWrap').flexslider({
            animation: '',
            directionNav: false,
            animationLoop: false,
            controlNav: true,
            slideshow: false,
            smoothHeight: true,
            controlsContainer: '.duty .tabButton .buttons',
            start: function () {
                var tabEA = $('.tabDataWrap .tabData').length;
                for (var i = 0; i < tabEA; i++) {
                    var tabTitle = $('.tabDataWrap .tabData').eq(i).attr('data-tab');
                    $('.tabButton ol li').eq(i).find('span').html(tabTitle);
                }
                $('.duty .tabButton ol li').each(function () {
                    $(this).next('li').css({ 'left': $(this).outerWidth() + parseInt($(this).css('left')) })
                });
            },
            after: function () {
                var prevOffset = $('.duty .tabButton ol a.flex-active').parent('li').css('left');
                $('.duty .tabButton .buttons ol').animate({ scrollLeft: prevOffset });
            }
        });
    }
    dutyFun();
    $('.duty .tabButton > a.prev').click(function () {
        $('.duty .tabDataWrap').flexslider('prev');
        return false;
    });
    $('.duty .tabButton > a.next').click(function () {
        $('.duty .tabDataWrap').flexslider('next');
        return false;
    });
    $(window).resize(function () {
        $('.duty .tabButton ol li').each(function () {
            $(this).next('li').css({ 'left': $(this).outerWidth() + parseInt($(this).css('left')) })
        })
    })
    /*----------채용공고----------*/
    //목록 제목
    $('.recruit.jobOpening .listWrap li.tit').each(function () {
        var length = 25;
        $(this).each(function () {
            if ($(this).text().length >= length) {
                $(this).text($(this).text().substr(0, length) + '...');
            }
        });
    });
    //FAQ
    $('.recruit.jobOpening .faqWrap dt').click(function () {
        if ($(this).hasClass('on')) {
            $(this).removeClass('on');
            $(this).next('dd').stop().slideUp();
            $(this).next('dd').scrollTop(0);
        } else {
            $('.jobOpening .faqWrap dt').removeClass('on');
            $('.jobOpening .faqWrap dd').stop().slideUp();
            $(this).next('dd').stop().slideDown();
            $(this).addClass('on');
        }
    });
    /*----------입사지원----------*/
    //첨부파일
    $('.application .addFile .fileField input').MultiFile({
        accept: 'doc|docx|xls|xlsx|ppt|pptx|pdf',
        list: '.application .addFile .viewWrap',
        STRING: {
            duplicate: '$file 은 이미 추가된 파일입니다.'
        }
    });
});