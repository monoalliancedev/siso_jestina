<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <div id="container" class="sub brand romanson">
            <!--Top Common-->
            <section class="subTop">
                <article>
                    <ul class="location">
                        <li><a href="/">HOME</a></li>
                        <li class="dep1"></li>
                        <li class="depmenu"><span class="now">&nbsp;</span><div class="dep2List"></div></li>
                    </ul>
                    <h3 class="pageTitle"></h3>
                </article>
            </section>
<script>
function jt_load(code) {
	if(code) {
		document.location.href = "./romanson?cateCode="+code;
	}else{
		document.location.href = "./romanson";
	}
	return fasle;	
}
</script>
            
            <!--//Top Common-->
            <section class="topVisual">
                <div class="commImgArea">
                    <img src="/images/brand_romanson_visual.jpg" class="forPC"/>
                    <img src="/images/brand_romanson_visual_mo.jpg" class="forMobile"/>   
                </div>
            </section>
            <section class="content">
                <!--Top Text-->
                <article class="topText">
                    <dl>
                        <dt><span><b>ROMANSON</b><i></i></span></dt>
                        <dd>
                        	<a href="#" onclick="jt_load('')" <c:if test="${cateCode eq '' || cateCode eq null}"> class="on"</c:if> >NEW ARRIVALS</a>
	                        <c:forEach var="categoryList" items="${categoryList}" varStatus="status">
		                    <a href="#" onclick="jt_load('${categoryList.seq}')" <c:if test="${cateCode eq categoryList.seq}"> class="on"</c:if> >${categoryList.cateName}</a>
		                    </c:forEach>
	                    </dd>
                    </dl>
                    <span class="text">
                        시계로 유명한 스위스의 공업 도시인 로만시온 에서 영감을 받아 탄생한 ROMANSON은 명품 시계 브랜드들과 함께 명품관에<br/>
                        자리를 당당히 차지하고 있을 만큼 해외에서의 관심도가 높습니다.<br/>
                        현재 전세계 70여 개국에 수출하며 Global 시계 브랜드로서 지속적인 성장하며 사랑을 받고 있습니다.
                    </span>
                    <a href="#" class="mallLink">Online shop</a>
                </article>
                <!--//Top Text-->
                <!--Controller-->
                <article class="controller">
                    <div>
                        <c:choose>
                        	<c:when test="${cateCode eq '' || cateCode eq null}">
								<div class="nowPrd">NEW ARRIVALS</div>
								<a href="romanson?cateCode=${cateInfo.get(0).seq}" class="nextPrd"><span>${cateInfo.get(0).cateName}</span><img src="/images/icon_brand_romanson_next.svg"/></a>
                        	</c:when>
                        	<c:otherwise>
	                        	<c:forEach var="cateInfo" items="${cateInfo}" varStatus="status">
									<c:if test="${status.index==0 && cateInfo.sortIdx ne 1}">
									<a href="romanson" class="prevPrd"><span>NEW ARRIVALS</span><img src="/images/icon_brand_romanson_prev.svg"/> </a>
									</c:if>
									
									<c:if test="${cateInfo.sortIdx eq 1}">
									<a href="romanson?cateCode=${cateInfo.seq}" class="prevPrd"><span>${cateInfo.cateName}</span><img src="/images/icon_brand_romanson_prev.svg"/> </a>
									</c:if>
							        <c:if test="${cateInfo.sortIdx eq 2}">
									<div class="nowPrd">${cateInfo.cateName}</div>
									</c:if>
							        <c:if test="${cateInfo.sortIdx eq 3}">
									<a href="romanson?cateCode=${cateInfo.seq}" class="nextPrd"><span>${cateInfo.cateName}</span><img src="/images/icon_brand_romanson_next.svg"/></a>
									</c:if>
	                        	</c:forEach>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                </article>
                <!--//Controller-->
                <!--Product List-->
                <article class="productList">
                    <ul>
                        <c:forEach var="list" items="${list}" varStatus="status">
                        <!--Set-->
                        <li>
                            <a href="romansonView?code=${list.seq}&cateCode=${cateCode}">
                                <div class="photo"><img src="/UploadFiles/${fileFolder}/${list.fileViewName[0]}"/></div>
                                <div class="name">${list.proName}</div>
                                <div class="cate">${list.cateName}</div>
                            </a>
                        </li>
                        <!--//Set-->
                        </c:forEach>
                    </ul>
                </article>
                <!--//Product List-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>