<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/WEB-INF/views/cn/common/html.head.jsp" %>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/cn/common/headerAndMenu.jsp" %>
        <link rel="stylesheet" type="text/css" href="/css/main.css" />
        <script type="text/javascript" src="/scripts/jquery.flexslider.js"></script>
        <script type="text/javascript" src="/scripts/language/mainCN.js"></script>
        <div id="container" class="main">
            <!--Banner-->
            <section class="mainBanner">
                <ul class="slides">
        		<c:forEach var="mainBanner" items="${mainBannerList}" varStatus="status">	
        			<c:if test="${mainBanner.fileType eq 'video'}">
        			<!-- 메인베너 영상 일때 -->
                    <li class="typeVideo">
                        <div class="tit"><a href="#">${mainBanner.contents}</a></div>
                        <div class="bg">&nbsp;</div>
                        <c:if test="${mainBanner.imgUrl ne ''}">
                        <video muted loop>
                            <source src="/UploadFiles/MainBanner/${mainBanner.imgUrl}" type="video/mp4">
                        </video>
                        </c:if>
                        <c:if test="${mainBanner.moimgUrl ne ''}">
                        	<img src="/UploadFiles/MainBanner/${mainBanner.moimgUrl}" class="forMobile"/>
                        </c:if>
                    </li>
                    </c:if>
        			<c:if test="${mainBanner.fileType eq 'image'}">
					<!--  메인베너 이미지 일때 -->
					<li class="typeImage">
                        <!-- #### git에 수정되어 있는 데이타   
                        <c:choose>
                            <c:when test="${mainBanner.linkUrl ne '' && (mainBanner.linkOutYn eq 'Y' || mainBanner.linkOutYn eq 'C')}">
                                <a href="${mainBanner.linkUrl}" <c:if test="${mainBanner.linkOutYn eq 'Y'}">target="_blank"</c:if>>$
                                    <div class="tit">${mainBanner.contents}</div>
                                    <c:if test="${mainBanner.imgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.imgUrl}" class="forPC"/></c:if>
                                    <c:if test="${mainBanner.moimgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.moimgUrl}" class="forMobile"/></c:if>
                                    <div class="bg">&nbsp;</div>
                                </a>
                            </c:when>
                            <c:otherwise>
                        		<div class="tit">${mainBanner.contents}</div>
                                <c:if test="${mainBanner.imgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.imgUrl}" class="forPC"/></c:if>
                                <c:if test="${mainBanner.moimgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.moimgUrl}" class="forMobile"/></c:if>
                                <div class="bg">&nbsp;</div>
                        	</c:otherwise>
                        </c:choose>
                        -->
                        <!-- #### 수정한 데이타-->
                        <c:choose>
                        	<c:when test="${mainBanner.linkUrl ne '' && (mainBanner.linkOutYn eq 'Y' || mainBanner.linkOutYn eq 'C')}">
                        		<a href="<c:if test="${not fn:contains(mainBanner.linkUrl,'http://') && not fn:contains(mainBanner.linkUrl,'https://')}">http://</c:if>${mainBanner.linkUrl}" <c:if test="${mainBanner.linkOutYn eq 'Y'}">target="_blank"</c:if>>
                        		<div class="tit">${mainBanner.contents}</div>
                        		<c:if test="${mainBanner.imgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.imgUrl}" class="forPC"/></c:if>
                        		<c:if test="${mainBanner.moimgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.moimgUrl}" class="forMobile"/></c:if>
                        		<div class="bg">&nbsp;</div>
                        		</a>
                        	</c:when>
                        	<c:otherwise>
                        		<div class="tit">${mainBanner.contents}</div>
                        		<c:if test="${mainBanner.imgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.imgUrl}" class="forPC"/></c:if>
                        		<c:if test="${mainBanner.moimgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.moimgUrl}" class="forMobile"/></c:if>
                        		<div class="bg">&nbsp;</div>
                        	</c:otherwise>
                        </c:choose>
                    </li>
                    </c:if>
                </c:forEach>    
                </ul>
                <div class="controller"><span class="activeNO">01</span><span class="totalNO"></span></div>
<c:if test="${mainBannerList.size()>1}">	
                <a href="#" class="ctrlBtn prev"><img src="/images/icon_ban_arrow_left.svg"/></a>
                <a href="#" class="ctrlBtn next"><img src="/images/icon_ban_arrow_right.svg"/></a>
</c:if>
                <span class="scroll"><img src="/images/icon_main_ban_arrow.svg"/>Scroll</span>
            </section>
            <!--//Banner-->
            <!--About JㆍESTINA-->
             <section class="aboutJestina">
                <article>
                    <div class="visual"><img src="/images/about_jestina.jpg"/></div>
                    <div class="textArea">
                        <div>
                            <h6>公司简介</h6>
                            <h5>GLOBAL LIFESTYLE CREATOR <br/>J.ESTINA</h5>
                            <span>
                                J.ESTINA是韩国代表性珠宝&手提包品牌。<br/>
                                本公司有主营珠宝&手提包的J.ESTINA和主营手表的ROMANSON品牌，<br/>
                                目的在于打造综合时尚品牌。
                            </span>
                            <a href="/cn/company/business" class="more">MORE</a>
                        </div>
                    </div>
                </article>
            </section>
            <!--//About JㆍESTINA-->
            <!--Brand소개-->
            <section class="brandIntro">
                <!--J.ESTINA JEWELRY-->
                <article class="jewelry">
                    <div class="imgPhoto"><div class="blind">&nbsp;</div>
                    	<!-- #### git에 수정되어 있는 데이타   
                    	<c:choose>
                        	<c:when test="${mainBarndJ.linkUrl ne '' && (mainBarndJ.linkOutYn eq 'Y' || mainBarndJ.linkOutYn eq 'C')}">
                        		<a href="${mainBarndJ.linkUrl}" <c:if test="${mainBarndJ.linkOutYn eq 'Y'}">target="_blank"</c:if>><img src="/UploadFiles/Jewerly/${mainBarndJ.imgUrl}"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/UploadFiles/Jewelry/${mainBarndJ.imgUrl}" class="forPC"/>
                        		<img src="/UploadFiles/Jewelry/${mainBarndJ.imgUrl}" class="forMobile"/>
                        	</c:otherwise>
                        </c:choose>
                        -->
                        <!-- #### 수정한 데이타-->
                        <a href="/cn/brand/jewelry">
                    		<img src="/UploadFiles/Jewelry/${mainBarndJ.imgUrl}" class="forPC"/>
                    		<img src="/UploadFiles/Jewelry/${mainBarndJ.moimgUrl}" class="forMobile"/>
                    	</a>
                    </div>
                    <div class="info">
                        <ul>
                            <li class="cate">品牌</li>
                            <li class="name">J.ESTINA JEWELRY</li>
                            <li class="text pc">J.ESTINA珠宝成立于2003年，是以曾是意大利公主、现为保加利亚王妃的吉奥瓦娜公主为形象而诞生的韩国首家平价珠宝首饰品牌。珠宝将象征公主的皇冠设计成品牌标识，得到了大众的关注，2019年更新品牌，推出了反映同时代年轻炫酷女性生活方式的感性珠宝。</li>
                            <li class="text mo">J.ESTINA珠宝成立于2003年，是以曾是意大利公主、现为保加利亚王妃的吉奥瓦娜公主为形象而诞生的韩国首家平价珠宝首饰品牌。珠宝将象征公主的皇冠设计成品牌标识，得到了大众的关注，2019年更新品牌，推出了反映同时代年轻炫酷女性生活方式的感性珠宝。</li>
                            <li class="more"><a href="/cn/brand/jewelry">MORE</a></li>
                        </ul>
                    </div>
                </article>
                <!--//J.ESTINA JEWELRY-->
                <!--J.ESTINA HANDBAG-->
                <article class="handbag">
                    <div class="imgPhoto"><div class="blind">&nbsp;</div>
                    	<!-- #### git에 수정되어 있는 데이타
                    	<c:choose>
                        	<c:when test="${mainBarndB.linkUrl ne '' && (mainBarndB.linkOutYn eq 'Y' || mainBarndB.linkOutYn eq 'C')}">
                        		<a href="${mainBarndB.linkUrl}" <c:if test="${mainBarndB.linkOutYn eq 'Y'}">target="_blank"</c:if>><img src="/UploadFiles/Bag/${mainBarndB.imgUrl}"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/UploadFiles/Bag/${mainBarndB.imgUrl}" class="forPC"/>
                        		<img src="/UploadFiles/Bag/${mainBarndB.imgUrl}" class="forMobile"/>
                        	</c:otherwise>
                        </c:choose>
                        -->
                        <a href="/cn/brand/handbag">
                    		<img src="/UploadFiles/Bag/${mainBarndB.imgUrl}" class="forPC"/>
                    		<img src="/UploadFiles/Bag/${mainBarndB.moimgUrl}" class="forMobile"/>
                    	</a>
                    </div>
                    <div class="info">
                        <ul>
                            <li class="cate">品牌</li>
                            <li class="name">J.ESTINA HANDBAG</li>
                            <li class="text pc">J.ESTINA于2011年推出了J.ESTINA手提包，手提包采用优雅高贵的设计，并以皇冠标识作为亮点，深受人们的喜爱。2019年更新品牌后，以炫酷有魄力的同时代女商人JOELLE的名字首字母JJ为主题，推出了JOELLE系列的手提包，展现了充满感性和现代情怀的风格。</li>
                            <li class="text mo">J.ESTINA于2011年推出了J.ESTINA手提包，手提包采用优雅高贵的设计，并以皇冠标识作为亮点，深受人们的喜爱。2019年更新品牌后，以炫酷有魄力的同时代女商人JOELLE的名字首字母JJ为主题，推出了JOELLE系列的手提包，展现了充满感性和现代情怀的风格。</li>
                            <li class="more"><a href="/cn/brand/handbag">MORE</a></li>
                        </ul>
                    </div>
                </article>
                <!--//J.ESTINA HANDBAG-->
                <!--ROMANSON-->
                <article class="romanson">
                    <div class="imgPhoto"><div class="blind">&nbsp;</div>
                    	<!-- #### git에 수정되어 있는 데이타
                    	<c:choose>
                        	<c:when test="${mainBarndR.linkUrl ne '' && (mainBarndR.linkOutYn eq 'Y' || mainBarndR.linkOutYn eq 'C')}">
                        		<a href="${mainBarndR.linkUrl}" <c:if test="${mainBarndR.linkOutYn eq 'Y'}">target="_blank"</c:if>><img src="/UploadFiles/Romason/${mainBarndR.imgUrl}"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/UploadFiles/Romanson/${mainBarndR.imgUrl}" class="forPC"/>
                        		<img src="/UploadFiles/Romanson/${mainBarndR.imgUrl}" class="forMobile"/>
                        	</c:otherwise>
                        </c:choose>
                        -->
                        <!-- #### 수정한 데이타-->
                        <a href="/cn/brand/romanson">
                    		<img src="/UploadFiles/Romanson/${mainBarndR.imgUrl}" class="forPC"/>
                    		<img src="/UploadFiles/Romanson/${mainBarndR.moimgUrl}" class="forMobile"/>
                    	</a>
                    </div>
                    <div class="info">
                        <ul>
                            <li class="cate">品牌</li>
                            <li class="name">ROMANSON</li>
                            <li class="text pc">1988年，从因手表而闻名的瑞士罗曼斯霍恩中获得灵感，诞生了ROMANSON这一品牌，该品牌自1997年起参加全球最大的钟表博览会“巴塞尔国际珠宝钟表展”，并在名品馆中进行展览。</li>
                            <li class="text mo">1988年，从因手表而闻名的瑞士罗曼斯霍恩中获得灵感，诞生了ROMANSON这一品牌，该品牌自1997年起参加全球最大的钟表博览会“巴塞尔国际珠宝钟表展”，并在名品馆中进行展览。</li>
                            <li class="more"><a href="/cn/brand/romanson">MORE</a></li>
                        </ul>
                    </div>
                </article>
                <!--//ROMANSON-->
            </section>
            <!--//Brand소개-->
            <!--Social Media-->
            <section class="socialMedia">
                <article style="display: none;">
                    <h5>social media</h5>
                    <ul>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_01.jpg" class="loadImg"/></a></li>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_02.jpg" class="loadImg"/></a></li>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_03.jpg" class="loadImg"/></a></li>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_04.jpg" class="loadImg"/></a></li>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_05.jpg" class="loadImg"/></a></li>
                    </ul>
                </article>
            </section>
            <!--//Social Media-->
            <!--Buttom Menu-->
            <section class="bottomMenu"></section>
            <!--//Buttom Menu-->
        </div>
        <%@ include file="/WEB-INF/views/cn/common/html.footer.jsp" %>
    </div>

<c:if test="${MainPopupList.size()>0}">    
<script>
//쿠키 가져오기 함수
function getCookie(cName) {
	
	cName = cName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cName);
	var cValue = '';
	if(start != -1) {
		start += cName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1) end = cookieData.length;
		cValue = cookieData.substring(start, end);
	}
	return unescape(cValue);
}
//쿠키설정
function setCookie( name, value, expiredays ){ 
	var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
</script>

<!--팝업-->
<div class="popupWrap" style="display: none;">
	
	<c:forEach var="MainPopup" items="${MainPopupList}" varStatus="status">
	<script>
	function jt_pageMove${status.count}(linkKey) {
		if(linkKey=="Y") { // 새창
			window.open("${MainPopup.linkUrl}", "_blank", "");
		}else if(linkKey=="C") { // 페이지 이동
			location.href = "${MainPopup.linkUrl}";
		}
	}
	</script>
	<!--Set-->
    <div class="popupData">
        <div class="imgArea">
        	<c:choose>
            <c:when test="${MainPopup.linkUrl ne '' && (MainPopup.linkOutYn eq 'Y' || MainPopup.linkOutYn eq 'C')}">
            	<a href="#" onclick="jt_pageMove${status.count}('${MainPopup.linkOutYn}')"><img src="/UploadFiles/Mpopup/${MainPopup.imgUrl}" alt="${MainPopup.title}"/></a>
            </c:when>
            <c:otherwise>
            	<img src="/UploadFiles/Mpopup/${MainPopup.imgUrl}" alt="${MainPopup.title}"/>
            </c:otherwise>
            </c:choose>
        </div>
        <div class="ctrl">
            <div class="checkBox"><input type="checkbox" id="dayHide${status.count}"><i>&nbsp;</i><label for="dayHide${status.count}">하루 동안 보지 않기</label></div>
            <a href="#" class="close">닫기 <img src="/images/popup_close.svg"/></a>
        </div>
    </div>
    <!--//Set-->
    </c:forEach>    
</div>
<!--//팝업-->
<script></script>  
<script>
//팝업전체 div (모두 다시안보기일때 팝업div를 열지 않는다.) 
var CookieIsCnt = 0;
for (var i = 0; i < $('.popupWrap .popupData').length; i++) {
	var cookieID = getCookie("popup"+(i+1)+"YN");
	if (cookieID=="N") CookieIsCnt ++ ; //쿠키있어요.
}
if(CookieIsCnt<${MainPopupList.size()}) {
	$('.popupWrap').show();	//팝업전체div
}
//개별 popup창 숨기기,보여주기
for (var i = 0; i < $('.popupWrap .popupData').length; i++) {
	var cookieID = getCookie("popup"+(i+1)+"YN");
	if (cookieID=="N") { //쿠키있어요.(다시 팝업창을 열지 않기)
		$('.popupWrap .popupData').eq(i).hide(); //i번째 숨김	
	}else{
		$('.popupWrap .popupData').eq(i).show(); //i번째 보여줌
	}
}
//닫기버튼을 누를때 다시보지않기 클릭한 팝업은 쿠키값을 넣어준다.
$('.popupWrap .close').click(function () {
	<c:forEach var="MainPopup" items="${MainPopupList}" varStatus="stat">
	if($('input:checkbox[id="dayHide${stat.count}"]').is(":checked") == true) {
		setCookie( "popup${stat.count}YN", "N" , 1 ); 
		//alert("${status.count}번째 팝업이 체크되어 있습니다.");
	}
	</c:forEach>   
	
    $(this).parents('.popupData').hide();
    $(this).parents('.popupData').addClass('closed');
    var popupDataEA = $('.popupWrap .popupData').length;
    var popupDataNoneEA = $('.popupWrap .popupData.closed').length;
    if (popupDataEA == popupDataNoneEA) {
        $('.popupWrap').hide();
    }
    return false;
})
</script>
</c:if>
</body>
</html>