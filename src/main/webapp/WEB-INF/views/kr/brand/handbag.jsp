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
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/brand.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/brand.css" />
        <div id="container" class="sub brand handbag">
            <!--Top Common-->
            <section class="subTop">
                <article>
                    <ul class="location">
                        <li><a href="/">HOME</a></li>
                        <li class="dep1"></li>
                        <li class="depmenu"><span class="now">&nbsp;</span><div class="dep2List"></div></li>
                    </ul>
                </article>
            </section>
            <!--//Top Common-->
            <section class="content brandVisual">
                <article>
                    <div class="textWrap">
                        <h5>J.ESTINA HANDBAG</h5>
                        <span>
                            ${brandBanner.contents}
                            <!-- 
                            제이에스티나는 2011년에 제이에스티나 핸드백을 런칭하여 티아라 심볼을 포인트로 한<br> 우아하고 고급스러운 디자인의 핸드백으로 많은 사랑을 받아왔습니다.<br/>
                            2019년 브랜드 리뉴얼 이후에는 쿨하고 당당한 동시대 여성상인 조엘(JOELLE)의<br> 이니셜 JJ 모티브를 활용한 조엘 라인의 핸드백으로 감각적이고 현대적인 감성의<br> 스타일을 제안하고 있습니다.
                            -->
                        </span>
                        <c:if test="${brandBanner.linkOutYn ne 'N'}">
		                    <a class="forPC" href="<c:if test="${not fn:contains(brandBanner.linkUrl,'http://') && not fn:contains(brandBanner.linkUrl,'https://')}">http://</c:if>${brandBanner.linkUrl}" <c:if test="${brandBanner.linkOutYn eq 'Y'}"> target="_blank" </c:if>>
		                    ONLINE SHOP</a>
		                    <a class="forMobile" href="<c:if test="${not fn:contains(brandBanner.linkUrl,'http://') && not fn:contains(brandBanner.linkUrl,'https://')}">http://</c:if>${brandBanner.linkUrl}" <c:if test="${brandBanner.linkOutYn eq 'Y'}"> target="_blank" </c:if>>
		                    ONLINE SHOP</a>
	                    </c:if>
                    </div>
                </article>
                <div class="commImgArea">
                    <c:if test="${!empty brandBanner.imgUrl}">
                        <img src="/UploadFiles/${fileFolder}/${brandBanner.imgUrl}" class="forPC"/>
	                </c:if>
	                <c:if test="${!empty brandBanner.moimgUrl}">
	        			<img src="/UploadFiles/${fileFolder}/${brandBanner.moimgUrl}" class="forMobile"/>
	                </c:if>
                </div>
            </section>
            <section class="moTextWrap"></section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>