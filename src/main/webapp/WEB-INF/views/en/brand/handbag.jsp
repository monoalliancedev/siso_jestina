<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/views/en/common/html.head.jsp" %>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/en/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/language/subEN.js"></script>
        <script type="text/javascript" src="/scripts/brand.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/brand.css" />
        <div id="container" class="sub brand handbag">
            <!--Top Common-->
            <section class="subTop">
                <article>
                    <ul class="location">
                        <li><a href="/en">HOME</a></li>
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
                        <span>${brandBanner.contents}
                        <!-- In 2011, J.ESTINA launched the J.ESTINA handbag line that promotes elegant and luxurious designs highlighted by the signature tiara symbol, and received love from the public. Since the brand renewal in 2019, the brand has been proposing a sensual and modern style through the JOELLE handbag line, which is inspired by the sophisticated and confident image of contemporary women highlighted by the JJ motif.-->
                        </span>
                        <c:if test="${brandBanner.linkOutYn ne 'N'}">
		                    <a class="forPC" href="<c:if test="${not fn:contains(brandBanner.linkUrl,'http://') && not fn:contains(brandBanner.linkUrl,'https://')}">http://</c:if>${brandBanner.linkUrl}" <c:if test="${brandBanner.linkOutYn eq 'Y'}"> target="_blank" </c:if>>
		                    ONLINE SHOP</a>
                            <a class="forMobile" href="<c:if test="${not fn:contains(brandBanner.molinkUrl,'http://') && not fn:contains(brandBanner.molinkUrl,'https://')}">http://</c:if>${brandBanner.molinkUrl}" <c:if test="${brandBanner.linkOutYn eq 'Y'}"> target="_blank" </c:if>>
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
        <%@ include file="/WEB-INF/views/en/common/html.footer.jsp" %>
    </div>
</body>
</html>
