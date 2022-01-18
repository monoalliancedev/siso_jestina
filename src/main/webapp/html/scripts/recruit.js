$(document).ready(function () {
    /*----------GNB & Location----------*/
    function subLocation() {
        if ($('#container').hasClass('recruit')) {
            var dep2Menu = $('nav dl:nth-child(4) dd').html();
            $('.location .dep1').text('RECRUIT');
            $('.location .dep2List').append(dep2Menu);
            $('nav .menuList dl:nth-child(4) dt a').addClass('inPage');
            $('.mobileGNB .moMenuList dl:nth-child(4) dt a').addClass('inPage');
            $('.mobileGNB .moMenuList dl:nth-child(4) dd').show();
        };
        if ($('#container').hasClass('recruit talent')) {
            $('.location .now , .sub h3.pageTitle').text('인재상');
            $('.location li .dep2List a').eq(0).addClass('on');
            $('nav .menuList dl:nth-child(4) dd a:first-child').addClass('inPage');
            $('header .mobileGNB .moMenuList dl:nth-child(4) dd a:nth-child(1)').addClass('inPage');
        };
        if ($('#container').hasClass('recruit duty')) {
            $('.location .now , .sub h3.pageTitle').text('직무소개');
            $('.location li .dep2List a').eq(1).addClass('on');
            $('nav .menuList dl:nth-child(4) dd a:nth-child(2)').addClass('inPage');
            $('header .mobileGNB .moMenuList dl:nth-child(4) dd a:nth-child(2)').addClass('inPage');
        };
        if ($('#container').hasClass('recruit culture')) {
            $('.location .now , .sub h3.pageTitle').text('기업문화/복리후생');
            $('.location li .dep2List a').eq(2).addClass('on');
            $('nav .menuList dl:nth-child(4) dd a:nth-child(3)').addClass('inPage');
            $('header .mobileGNB .moMenuList dl:nth-child(4) dd a:nth-child(3)').addClass('inPage');
        };
        if ($('#container').hasClass('recruit jobOpening anncmnt')) {
            $('.location .now , .sub h3.pageTitle').text('채용공고');
            $('.location li .dep2List a').eq(3).addClass('on');
            $('nav .menuList dl:nth-child(4) dd a:nth-child(4)').addClass('inPage');
            $('header .mobileGNB .moMenuList dl:nth-child(4) dd a:nth-child(4)').addClass('inPage');
        };
        if ($('#container').hasClass('recruit jobOpening regist')) {
            $('.location .now , .sub h3.pageTitle').text('인재풀 등록');
            $('.location li .dep2List a').eq(4).addClass('on');
            $('nav .menuList dl:nth-child(4) dd a:nth-child(5)').addClass('inPage');
            $('header .mobileGNB .moMenuList dl:nth-child(4) dd a:nth-child(5)').addClass('inPage');
        };
        if ($('#container').hasClass('recruit application')) {
            $('.location .now , .sub h3.pageTitle').text('입사지원');
        };
    };
    subLocation();
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