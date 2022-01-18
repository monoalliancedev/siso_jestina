$(document).ready(function () {
    /*----------직무소개----------*/
    //Tab
    $('.recruit.duty .pcTab a').click(function(){
        $('.recruit.duty .pcTab a').removeClass('on')
        $('.recruit.duty .tabData').hide();
        $($(this).attr('href')).show();
        $(this).addClass('on');
        return false;
    })
    
    function TabDataResize(){
        if($(window).width() < 813){
            $('.tabDataWrap > div ').flexslider({
                animation: '',
                directionNav: false,
                animationLoop: false,
                controlNav: true,
                controlsContainer: ".tabCtrl",
                slideshow: false,
                start: function () {
                    function ctrlAction() {
                        var tabPaging = $('.tabDataWrap .tabData').length;
                        for (var i = 0; i < tabPaging; i++) {
                            var tabArr = $('.tabDataWrap .tabData').eq(i).attr('class');
                            var tabText = tabArr.split("tabData").pop('').split(' ')[1];
                            $('.flex-control-paging li').eq(i).find('span').html(tabText);
                        }
                        var tabDataHT = $('.tabDataWrap .tabData.flex-active-slide').outerHeight();
                        $('.duty .tabDataWrap > div').css('height' , tabDataHT);
                    };
                    ctrlAction();
                },
                after: function () {
                    var tabDataHT = $('.tabDataWrap .tabData.flex-active-slide').outerHeight();
                    $('.duty .tabDataWrap > div').css('height' , tabDataHT);
                },
            });
        }
    }
    TabDataResize();
    $(window).resize(function(){
        TabDataResize();
    })
    $('.recruit.duty .tabCtrl .prev').click(function () {
        if($('.duty .tabCtrl ol li:first-child a').hasClass('flex-active') == true){
            $('.duty .tabDataWrap > div').flexslider('stop');
        }else{
            var tabOffset = $('.duty .tabCtrl .flex-active').offset().left;
            $('.duty .tabCtrl ol').stop().animate({'scrollLeft' : -tabOffset})

            $('.duty .tabDataWrap > div').flexslider('prev');
        }
        return false;
    });

    $('.recruit.duty .tabCtrl .next').click(function () {
        if($('.duty .tabCtrl ol li:nth-child(6) a').hasClass('flex-active') == true){
            $('.duty .tabDataWrap > div').flexslider('stop');
        }else{
            var tabOffset = $('.duty .tabCtrl .flex-active').offset().left;
            $('.duty .tabCtrl ol').stop().animate({'scrollLeft' : tabOffset})
               
            $('.duty .tabDataWrap > div').flexslider('next');
        }
        return false;
    });

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