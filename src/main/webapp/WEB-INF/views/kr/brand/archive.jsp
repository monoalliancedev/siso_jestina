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
        <script type="text/javascript" src="/scripts/jquery.flexslider.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/brand.css" />
        <div id="container" class="sub brand archive">
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
            <section class="content">
            	
				<c:forEach var="list" items="${museAndYearList}" varStatus="yearIdx">
				<!--Year Set-->
                <div class="yearWrap">
                    <c:forEach var="muse" items="${list.value}" varStatus="museIdx">
                    <!--Category Set for(년도안에 뮤즈별)-->
                    <div class="categoryWrap">
                        <ul class="slides">
                        	
                           	<c:forEach var="file" items="${museAndFileList.get(muse.seq)}" varStatus="fileIdx">
                           	<!--for(이미지 루프)--> 
                           	<li>
                                <div class="titleText">
                                    <h5><span>${list.key}</span>BRAND ARCHIVE</h5>
                                    <h6>J.ESTINA<span>${muse.cate}</span><img src="/images/icon_archive_x.svg"/>${muse.name}</h6>
                                </div>
                                <c:if test="${file.save_filename ne ''}">
			                        <c:if test="${muse.linkOutYn eq 'Y'}">
				                    <a href="${muse.linkUrl}" target="_blank"><img src="/UploadFiles/${fileFolder}/${file.save_filename}" class="forPC"/></a>
				                    </c:if>
				        			<c:if test="${muse.linkOutYn eq 'C'}">
				        			<a href="${muse.linkUrl}"><img src="/UploadFiles/${fileFolder}/${file.save_filename}" class="forPC"/></a>
				        		    </c:if>
				                    <c:if test="${muse.linkOutYn eq 'N'}">
				        			<img src="/UploadFiles/${fileFolder}/${file.save_filename}" class="forPC"/>
				        		    </c:if>
				                </c:if>
				                <!-- img src="/images/sample/brand_archive_01_mo.jpg" class="forMobile"/ -->
                            </li>
                            <!--//for(이미지 루프)-->
                            </c:forEach>
                            
                        </ul>
                    </div>
                    <!--//Category Set for(년도안에 뮤즈별)-->
                    </c:forEach>
                    
                </div>
                <!--//Year Set-->
               	</c:forEach>
                
            </section>
            <!--controller-->
            <div class="controller">
                <div class="btnWrap">
                    <div class="prevYearList"></div>
                    <a href="#" class="yearPrev"><img src="/images/icon_archive_arrow_prev.svg"/></a>
                    <div class="yearList"><div class="list"></div></div>
                    <a href="#" class="yearNext"><img src="/images/icon_archive_arrow_next.svg"/></a>
                    <div class="nextYearList"></div>
                </div>
                <a href="#" class="moTop"><img src="/images/icon_archive_arrow_top.svg"/></a>
            </div>
            <!--//controller-->
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>