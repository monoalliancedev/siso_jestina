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
        <script type="text/javascript" src="/scripts/recruit.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/recruit.css" />
        <div id="container" class="sub recruit jobOpening anncmnt">
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
            <!--//Top Common-->
            <section class="content">
                <article class="detailWrap">
                    <!--Top Title-->
                    <div class="topTitle">
                        <div class="box1">
	                        <c:if test="${recruit.careerIsnt eq 'Y'}"><i class="career">경력</i></c:if>
	                        <c:if test="${recruit.careerIsnt eq 'N'}"><i class="new">신입</i></c:if>
                        </div>
                        <div class="box2">
                            <ul>
                                <li class="tit">${recruit.jobField}</li>
                                <li class="part">
                                    <ol>
                                        <li>사업부문 : ${recruit.business}</li>
                                        <li>
                                        	${recruit.recruitFromDate} ~ 
			                                <c:if test="${recruit.recruitEnd eq 'checked'}">마감시까지</c:if>
			                                <c:if test="${recruit.recruitEnd ne ''}">
				                                ${recruit.recruitToDate}
				                                <c:if test="${toDay>recruit.recruitToDate}"><b>완료</b></c:if>
				                                <c:if test="${toDay<recruit.recruitToDate}">
				                                	<fmt:parseDate var="strPlanDate" value="${toDay}"  pattern="yyyy-MM-dd"/>
													<fmt:parseNumber var="strDate" value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" ></fmt:parseNumber>
													<fmt:parseDate var="endPlanDate" value="${recruit.recruitToDate}"  pattern="yyyy-MM-dd"/>
													<fmt:parseNumber var="endDate" value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" ></fmt:parseNumber>
													<b>D-${endDate-strDate}</b>
												</c:if>
			                                </c:if>     
			                            </li>
                                    </ol>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--//Top Title-->
                    <!--Info-->
                    <div class="infoWrap">
                        
                        ${recruit.contents}
                        
                    </div>
                    <!--//Info-->
                    <div class="bottom_btn">
                        <a href="#" onclick="history.back()" class="list">목록</a>
                        <c:if test="${(recruit.recruitEnd eq 'checked') || (toDay<=recruit.recruitToDate)}">
                        	<a href="application?code=${code}" class="apply">지원하기</a>
                        </c:if>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>