<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <link rel="stylesheet" type="text/css" href="/css/main.css" />
        <script type="text/javascript" src="/scripts/jquery.flexslider.js"></script>
        <script type="text/javascript" src="/scripts/main.js"></script>
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
                        <div class="tit">
                        <c:choose>
                        	<c:when test="${mainBanner.linkUrl ne '' && (mainBanner.linkOutYn eq 'Y' || mainBanner.linkOutYn eq 'C')}">
                        		<a href="<c:if test="${not fn:contains(mainBanner.linkUrl,'http://') && not fn:contains(mainBanner.linkUrl,'https://')}">http://</c:if>${mainBanner.linkUrl}" <c:if test="${mainBanner.linkOutYn eq 'Y'}">target="_blank"</c:if>>${mainBanner.contents}</a>
                        	</c:when>
                        	<c:otherwise>
                        		${mainBanner.contents}
                        	</c:otherwise>
                        </c:choose>
                        </div>
                        
                        
                        <c:choose>
                        	<c:when test="${mainBanner.linkUrl ne '' && (mainBanner.linkOutYn eq 'Y' || mainBanner.linkOutYn eq 'C')}">
                        		<a href="<c:if test="${not fn:contains(mainBanner.linkUrl,'http://') && not fn:contains(mainBanner.linkUrl,'https://')}">http://</c:if>${mainBanner.linkUrl}" <c:if test="${mainBanner.linkOutYn eq 'Y'}">target="_blank"</c:if>>
                        		<c:if test="${mainBanner.imgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.imgUrl}" class="forPC"/></c:if>
                        		<c:if test="${mainBanner.moimgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.moimgUrl}" class="forMobile"/></c:if>
                        		</a>
                        	</c:when>
                        	<c:otherwise>
                        		<c:if test="${mainBanner.imgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.imgUrl}" class="forPC"/></c:if>
                        		<c:if test="${mainBanner.moimgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.moimgUrl}" class="forMobile"/></c:if>
                        	</c:otherwise>
                        </c:choose>
                        <div class="bg">&nbsp;</div>
                    </li>
                    </c:if>
                </c:forEach>    
                </ul>
                <div class="controller"><span class="activeNO"></span><span class="totalNO"></span></div>
<c:if test="${mainBannerList.size()>1}">	
                <a href="#" title="이전배너" class="ctrlBtn prev"><img src="/images/icon_ban_arrow_left.svg"/></a>
                <a href="#" title="다음배너" class="ctrlBtn next"><img src="/images/icon_ban_arrow_right.svg"/></a>
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
                            <h6>About JㆍESTINA</h6>
                            <h5>Global luxury brand<br/>J.ESTINA</h5>
                            <span>
                                한국을 대표하는 주얼리 & 핸드백 브랜드, 제이에스티나<br/>
                                당사는 J.ESTINA 브랜드로 주얼리와 핸드백 , ROMANSON 브랜드로<br/>
                                손목시계 사업을 진행하고 있으며 토탈 패션 브랜드 사업을 목표로 하고 있습니다
                            </span>
                            <a href="#" class="more">MORE</a>
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
                    	<a href="/brand/jewelry"><img src="/UploadFiles/Jewelry/${mainBarndJ.imgUrl}" class="forPC"/></a>
                    	<!-- ${mainBarndJ.moimgUrl}" class="forMobile"/> -->
                    	<!-- 
                    	<c:choose>
                        	<c:when test="${mainBarndJ.linkUrl ne '' && (mainBarndJ.linkOutYn eq 'Y' || mainBarndJ.linkOutYn eq 'C')}">
                        		<a href="${mainBarndJ.linkUrl}" <c:if test="${mainBarndJ.linkOutYn eq 'Y'}">target="_blank"</c:if>><img src="/UploadFiles/Jewerly/${mainBarndJ.imgUrl}" class="forPC"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/UploadFiles/Jewelry/${mainBarndJ.imgUrl}" class="forPC"/>
                        	</c:otherwise>
                        </c:choose>
                        -->
                    </div>
                    <div class="info">
                        <ul>
                            <li class="cate">Brand</li>
                            <li class="name">J.ESTINA JEWELRY</li>
                            <li class="text pc">J.ESTINA는 실존했던 이탈리아의 조반나 공주를 뮤즈로 탄생한 럭셔리 브랜드<br> 입니다. 컬렉션 및 스토리는 J.ESTINA 프린세스의 라이프 스타일에서 영감을 받아 현대적으로 트렌디한 감성으로 재해석 되고 있습니다.</li>
                            <li class="text mo">J.ESTINA는 실존했던 이탈리아의 조반나 공주를 뮤즈로 탄생한 럭셔리 브랜드 입니다. </li>
                            <li class="more"><a href="/brand/jewelry">MORE</a></li>
                        </ul>
                    </div>
                </article>
                <!--//J.ESTINA JEWELRY-->
                <!--J.ESTINA HANDBAG-->
                <article class="handbag">
                    <div class="imgPhoto"><div class="blind">&nbsp;</div>
                    	<a href="/brand/handbag"><img src="/UploadFiles/Bag/${mainBarndB.imgUrl}"/></a>
                    	<!-- 
                    	<c:choose>
                        	<c:when test="${mainBarndB.linkUrl ne '' && (mainBarndB.linkOutYn eq 'Y' || mainBarndB.linkOutYn eq 'C')}">
                        		<a href="${mainBarndB.linkUrl}" <c:if test="${mainBarndB.linkOutYn eq 'Y'}">target="_blank"</c:if>><img src="/UploadFiles/Bag/${mainBarndB.imgUrl}"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/UploadFiles/Bag/${mainBarndB.imgUrl}"/>
                        	</c:otherwise>
                        </c:choose> -->
                    </div>
                    <div class="info">
                        <ul>
                            <li class="cate">Brand</li>
                            <li class="name">J.ESTINA HANDBAG</li>
                            <li class="text pc">제이에스티나 핸드백(J.ESTINA BAG)은 조반나 공주의 라이프 스타일에서 영감을 받아 런칭한 핸드백 브랜드 입니다. 클래식하면서도 현대적인 감성을 반영한<br> 디자인으로 2030 여성들에게 사랑을 받고 있습니다.</li>
                            <li class="text mo">제이에스티나 핸드백(J.ESTINA BAG)은 조반나 공주의 라이프 스타일에서 영감을 받아 런칭한 핸드백 브랜드 입니다.</li>
                            <li class="more"><a href="/brand/handbag">MORE</a></li>
                        </ul>
                    </div>
                </article>
                <!--//J.ESTINA HANDBAG-->
                <!--ROMANSON-->
                <article class="romanson">
                    <div class="imgPhoto"><div class="blind">&nbsp;</div>
                    	<a href="/brand/romanson"><img src="/UploadFiles/Romanson/${mainBarndR.imgUrl}"/></a>
                    	<!--
                    	<c:choose>
                        	<c:when test="${mainBarndR.linkUrl ne '' && (mainBarndR.linkOutYn eq 'Y' || mainBarndR.linkOutYn eq 'C')}">
                        		<a href="${mainBarndR.linkUrl}" <c:if test="${mainBarndR.linkOutYn eq 'Y'}">target="_blank"</c:if>><img src="/UploadFiles/Romason/${mainBarndR.imgUrl}"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/UploadFiles/Romanson/${mainBarndR.imgUrl}"/>
                        	</c:otherwise>
                        </c:choose>-->
                    </div>
                    <div class="info">
                        <ul>
                            <li class="cate">Brand</li>
                            <li class="name">ROMANSON</li>
                            <li class="text pc">시계로 유명한 스위스의 공업 도시인 로만시온에서 영감을 받아 탄생한 ROMANSON은 명품 시계 브랜드들과 함께 명품관에 자리를 당당히 차지하고 있을 만큼 해외에서의 관심도가 높습니다. </li>
                            <li class="text mo">ROMANSON은 시계로 유명한 스위스의 공업 도시인 로만시온에  영감을 받아 탄생한 명품 브랜드입니다.</li>
                            <li class="more"><a href="/brand/romanson">MORE</a></li>
                        </ul>
                    </div>
                </article>
                <!--//ROMANSON-->
            </section>
            <!--//Brand소개-->
            <!--Latest-->
            <section class="latestArea">
                <article>
                    <ul class="notice">
                        <li class="cate">News 
                        ${URL} <br> ${URI} 
						</li>
                        <li class="tit"><a href="/news/newsView?seq=${mainNews.seq}">${mainNews.title}</a></li>
                        <li class="text"><a href="/news/newsView?seq=${mainNews.seq}">${mainNews.contentsMain}</a></li>
                        <li class="more"><a href="/news/news">MORE</a></li>
                    </ul>
                    <ul class="news">
                        <li class="cate">Culture</li>
                        <li class="tit"><a href="/recruit/recruitCulture">제이에스티나 기업문화 및 복리후생</a></li>
                        <li class="text"><a href="/recruit/recruitCulture">제이에스티나의 기업문화 및 복리후생을 확인 할 수 있습니다.</a></li>
                        <li class="more"><a href="/recruit/recruitCulture">MORE</a></li>
                    </ul>
                    <ul class="rescruit">
                        <li class="cate">Recruit</li>
                        <li class="tit"><a href="/recruit/recruitResources">제이에스티나 인재풀 등록</a></li>
                        <li class="text"><a href="/recruit/recruitResources">제이에스티나는 상시 지원할 수 있는 채용시스템을 운영하고 있습니다.</a></li>
                        <li class="more"><a href="/recruit/recruitResources">MORE</a></li>
                    </ul>
                    <ul class="ir">
                        <li class="cate">Store</li>
                        <li class="tit"><a href="/store/domestic">제이에스티나 오프라인 매장안내</a></li>
                        <li class="text"><a href="/store/domestic">제이에스티나의 국내 백화점, 아울렛, 면세점 매장 및 해외 매장 소개</a></li>
                        <li class="more"><a href="/store/domestic">MORE</a></li>
                    </ul>
                </article>
            </section>
            <!--//Latest-->
            <!--Social Media
            <section class="socialMedia">
                <article>
                    <h5>social media</h5>
                    <ul>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_01.jpg" class="loadImg"/></a></li>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_02.jpg" class="loadImg"/></a></li>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_03.jpg" class="loadImg"/></a></li>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_04.jpg" class="loadImg"/></a></li>
                        <li><a href="#" target="_blank"><i><img src="/images/icon_main_social_insta.svg"/></i><img src="/images/sample/main_social_thumb_05.jpg" class="loadImg"/></a></li>
                    </ul>
                </article>
            </section>-->
            <!--//Social Media-->
            <!--Buttom Menu-->
            <section class="bottomMenu"></section>
            <!--//Buttom Menu-->
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
  ${MainPopupList.size()}
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