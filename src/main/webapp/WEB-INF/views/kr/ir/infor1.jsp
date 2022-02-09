<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/ir.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/commBoard.css" />
        <link rel="stylesheet" type="text/css" href="/css/ir.css" />
        <div id="container" class="sub ir stock">
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
                <!--실시간 시세-->
                <article class="realTime">
                    <h3><!-- 실시간 시세--> <span class="date"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd hh:mm:ss" /> 기준</span></h3>
                    <ul>
                        <li>
                            <div class="box">
                                <div>
                                    <h6>제이에스티나 현재가</h6>
                                    <span><i>${info.clpr}</i></span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box">
                                <div>
                                    <h6>전일대비</h6>
                                    <c:choose>
			                            <c:when test="${fn:contains(info.vs, '-')}">
				                        	<span class="lower"><i>${info.vs}</i><b>${info.fltRt}%</b></span>    
			                            </c:when>
			                            <c:otherwise>
			                            	<span class="upper"><i>${info.vs}</i><b>${info.fltRt}%</b></span>
			                            </c:otherwise>
	                            	</c:choose>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box">
                                <div>
                                    <h6>거래량</h6>
                                    <span><i>${info.trqu}</i></span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box">
                                <div>
                                    <h6>거래대금</h6>
                                    <span>${info.trPrc}</i></span>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="tableData">
                        <div>
                            <dl>
                                <dt>시가</dt>
                                <dd><fmt:formatNumber value="${info.mkp}" pattern="#,###" /></dd>
                            </dl>
                            <dl>
                                <dt>상장주식수</dt>
                                <dd><fmt:formatNumber value="${info.lstgStCnt}" pattern="#,###" /></dd>
                            </dl>
                        </div>
                        <div>
                            <dl>
                                <dt>고가</dt>
                                <dd><span class="red"><fmt:formatNumber value="${info.hipr}" pattern="#,###" /></span></dd>
                            </dl>
                            <dl>
                                <dt>저가</dt>
                                <dd><span class="blue"><fmt:formatNumber value="${info.lopr}" pattern="#,###" /></span></dd>
                            </dl>
                        </div>
                    </div>
                </article>
                <!--//실시간 시세-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>