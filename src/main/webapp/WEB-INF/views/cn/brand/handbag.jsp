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
        <script type="text/javascript" src="/scripts/language/subCN.js"></script>
        <script type="text/javascript" src="/scripts/brand.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/brand.css" />
        <div id="container" class="sub brand handbag">
            <!--Top Common-->
            <section class="subTop">
                <article>
                    <ul class="location">
                        <li><a href="/cn">HOME</a></li>
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
                            <!-- J.ESTINA于2011年推出了J.ESTINA手提包，手提包采用优雅高贵的设计，<br/>
                            并以皇冠标识作为亮点，深受人们的喜爱。2019年更新品牌后，以炫酷有魄力的同时代女商人JOELLE的名字首字母JJ为主题，推出了JOELLE系列的手提包，展现了充满感性和现代情怀的风格。 -->
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
        <%@ include file="/WEB-INF/views/cn/common/html.footer.jsp" %>
    </div>
</body>
</html>