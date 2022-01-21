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
        			<c:if test="${mainBanner.fileType eq 'video'}">
                    <li class="typeVideo">
                        <div class="tit">
                        <c:choose>
                        	<c:when test="${mainBanner.linkUrl ne '' && (mainBanner.linkOutYn eq 'Y' || mainBanner.linkOutYn eq 'C')}">
                        		<a href="${mainBanner.linkUrl}" <c:if test="${mainBanner.linkOutYn eq 'Y'}">target="_blank"</c:if>>${mainBanner.contents}</a>
                        	</c:when>
                        	<c:otherwise>
                        		${mainBanner.contents}
                        	</c:otherwise>
                        </c:choose>
        				</div>
                        <div class="bg">&nbsp;</div>
                        <video muted loop>
                            <c:if test="${mainBanner.imgUrl ne ''}">
                            <source src="/UploadFiles/MainBanner/${mainBanner.imgUrl}" type="video/mp4">
                            </c:if>
                        </video>
                        <c:if test="${mainBanner.moimgUrl ne ''}">
                        	<img src="/UploadFiles/MainBanner/${mainBanner.moimgUrl}" class="forMobile"/>
                        </c:if>
                    </li>
                    </c:if>
                    
					<c:if test="${mainBanner.fileType eq 'image'}">
					<li class="typeImage">
                        <div class="tit">
                        <c:choose>
                        	<c:when test="${mainBanner.linkUrl ne '' && (mainBanner.linkOutYn eq 'Y' || mainBanner.linkOutYn eq 'C')}">
                        		<a href="${mainBanner.linkUrl}" <c:if test="${mainBanner.linkOutYn eq 'Y'}">target="_blank"</c:if>>${mainBanner.contents}</a>
                        	</c:when>
                        	<c:otherwise>
                        		${mainBanner.contents}
                        	</c:otherwise>
                        </c:choose>
                        </div>
                        <c:if test="${mainBanner.imgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.imgUrl}" class="forPC"/></c:if>
                        <c:if test="${mainBanner.moimgUrl ne ''}"><img src="/UploadFiles/MainBanner/${mainBanner.moimgUrl}" class="forMobile"/></c:if>
                        <div class="bg">&nbsp;</div>
                    </li>
                    </c:if>
                    
                    
                    <li class="typeVideo">
                        <div class="tit"><a href="#">Art Of Giving<br/>21WINTER COLLECTION</a></div>
                        <div class="bg">&nbsp;</div>
                        <video muted loop>
                            <source src="video/visual1.mp4" type="video/mp4">
                        </video>
                        <img src="/images/sample/mo_main_banner1.jpg" class="forMobile"/>
                    </li>
                    <li class="typeImage">
                        <div class="tit"><a href="#">Art Of Giving<br/>21WINTER COLLECTION</a></div>
                        <img src="/images/sample/main_banner.jpg" class="forPC"/>
                        <img src="/images/sample/mo_main_banner2.jpg" class="forMobile"/>
                        <div class="bg">&nbsp;</div>
                    </li>
                    <li class="typeVideo">
                        <div class="tit"><a href="#">Art Of Giving<br/>21WINTER COLLECTION</a></div>
                        <div class="bg">&nbsp;</div>
                        <video muted loop>
                            <source src="video/visual1.mp4" type="video/mp4">
                        </video>
                        <img src="/images/sample/mo_main_banner1.jpg" class="forMobile"/>
                    </li>
                    <li class="typeImage">
                        <div class="tit"><a href="#">Art Of Giving<br/>21WINTER COLLECTION</a></div>
                        <img src="/images/sample/main_banner.jpg" class="forPC"/>
                        <img src="/images/sample/mo_main_banner2.jpg" class="forMobile"/>
                        <div class="bg">&nbsp;</div>
                    </li>
                    
                    
                    
                    
                    
                </ul>
                <div class="controller"><span class="activeNO"></span><span class="totalNO"></span></div>
                <a href="#" title="이전배너" class="ctrlBtn prev"><img src="/images/icon_ban_arrow_left.svg"/></a>
                <a href="#" title="다음배너" class="ctrlBtn next"><img src="/images/icon_ban_arrow_right.svg"/></a>
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
                    	<c:choose>
                        	<c:when test="${mainBarndJ.linkUrl ne '' && (mainBarndJ.linkOutYn eq 'Y' || mainBarndJ.linkOutYn eq 'C')}">
                        		<a href="${mainBarndJ.linkUrl}" <c:if test="${mainBarndJ.linkOutYn eq 'Y'}">target="_blank"</c:if>><img src="/UploadFiles/Jewerly/${mainBarndJ.imgUrl}"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/UploadFiles/Jewerly/${mainBarndJ.imgUrl}"/>
                        	</c:otherwise>
                        </c:choose>
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
                    	<c:choose>
                        	<c:when test="${mainBarndB.linkUrl ne '' && (mainBarndB.linkOutYn eq 'Y' || mainBarndB.linkOutYn eq 'C')}">
                        		<a href="${mainBarndB.linkUrl}" <c:if test="${mainBarndB.linkOutYn eq 'Y'}">target="_blank"</c:if>><img src="/UploadFiles/Bag/${mainBarndB.imgUrl}"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/UploadFiles/Bag/${mainBarndB.imgUrl}"/>
                        	</c:otherwise>
                        </c:choose>
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
                    	<c:choose>
                        	<c:when test="${mainBarndR.linkUrl ne '' && (mainBarndR.linkOutYn eq 'Y' || mainBarndR.linkOutYn eq 'C')}">
                        		<a href="${mainBarndR.linkUrl}" <c:if test="${mainBarndR.linkOutYn eq 'Y'}">target="_blank"</c:if>><img src="/UploadFiles/Romason/${mainBarndR.imgUrl}"/></a>
                        	</c:when>
                        	<c:otherwise>
                        		<img src="/UploadFiles/Romason/${mainBarndR.imgUrl}"/>
                        	</c:otherwise>
                        </c:choose>
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
                        <li class="cate">News</li>
                        <li class="tit"><a href="#">${mainNews.title}</a></li>
                        <li class="text"><a href="#">${mainNews.contentsMain}</a></li>
                        <li class="more"><a href="#">MORE</a></li>
                    </ul>
                    <ul class="news">
                        <li class="cate">Culture</li>
                        <li class="tit"><a href="#">제이에스티나 기업문화 및 복리후생</a></li>
                        <li class="text"><a href="#">제이에스티나의 기업문화 및 복리후생을 확인 할 수 있습니다.</a></li>
                        <li class="more"><a href="#">MORE</a></li>
                    </ul>
                    <ul class="rescruit">
                        <li class="cate">Recruit</li>
                        <li class="tit"><a href="#">제이에스티나 인재풀 등록</a></li>
                        <li class="text"><a href="#">제이에스티나는 상시 지원할 수 있는 채용시스템을 운영하고 있습니다.</a></li>
                        <li class="more"><a href="#">MORE</a></li>
                    </ul>
                    <ul class="ir">
                        <li class="cate">Store</li>
                        <li class="tit"><a href="#">제이에스티나 오프라인 매장안내</a></li>
                        <li class="text"><a href="#">제이에스티나의 국내 백화점, 아울렛, 면세점 매장 및 해외 매장 소개</a></li>
                        <li class="more"><a href="#">MORE</a></li>
                    </ul>
                </article>
            </section>
            <!--//Latest-->
            <!--Social Media-->
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
            </section>
            <!--//Social Media-->
            <!--Buttom Menu-->
            <section class="bottomMenu"></section>
            <!--//Buttom Menu-->
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>