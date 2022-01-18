<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %>
<script>
function goPage(cpage){
	var f = document.searchForm;
	f.cpage.value = cpage;
	f.action = "recruit??code=${code}";
	f.submit();
}
</script></head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/recruit.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/commBoard.css" />
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
                    <article class="tab">
                        <ul>
                            <li><a href="recruit" class="on">전체(<fmt:formatNumber value="${totCntA}" pattern="#,###" />)</a></li>
                            <li><a href="recruit?code=Y">경력(<fmt:formatNumber value="${totCntY}" pattern="#,###" />)</a></li>
                            <li><a href="recruit?code=N">신입(<fmt:formatNumber value="${totCntN}" pattern="#,###" />)</a></li>
                        </ul>
                    </article>
            <!--//Top Common-->
            <section class="content">
                <!--목록-->
                <article class="listWrap">
                    <ul>
                        <c:forEach var="list" items="${recruitList}" varStatus="status">
                        <li>
                            <a href="recruitView?code=${list.seq}">
                                <ol>
                                    <c:if test="${list.careerIsnt eq 'Y'}"><li><i class="career">경력</i></li></c:if>
                                    <c:if test="${list.careerIsnt eq 'N'}"><li><i class="new">신입</i></li></c:if>
                                    <li class="tit">${list.jobField}</li>
                                    <li class="part">사업부문 : ${list.business} </li>
                                </ol>
                                <span class="date">
								${list.recruitFromDate} ~
                                <c:if test="${list.recruitEnd eq 'checked'}">마감시까지</c:if>
                                <c:if test="${list.recruitEnd ne ''}">
	                                ${list.recruitToDate}
	                                <c:if test="${toDay>list.recruitToDate}"><i>완료</i></c:if>
	                                <c:if test="${toDay<list.recruitToDate}">
	                                	<fmt:parseDate var="strPlanDate" value="${toDay}"  pattern="yyyy-MM-dd"/>
										<fmt:parseNumber var="strDate" value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" ></fmt:parseNumber>
										<fmt:parseDate var="endPlanDate" value="${list.recruitToDate}"  pattern="yyyy-MM-dd"/>
										<fmt:parseNumber var="endDate" value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" ></fmt:parseNumber>
										<i>D-${endDate-strDate}</i>
	                                </c:if>
                                </c:if>        
                                </span>
                            </a>
                        </li>
                        </c:forEach>
                    </ul>
                </article>
                <!--//목록-->
                <!--FAQ-->
                <article class="faqWrap">
                    <h3>제이에스티나 채용 FAQ</h3>
                    <table>
                        
                        <c:forEach var="list" items="${faqList}" varStatus="status">
                        <tr>
                            <td>
                                <dl>
                                    <dt>${list.question}</dt>
                                    <dd>
                                       ${list.answer}
                                    </dd>
                                </dl>
                            </td>
                        </tr>
                        </c:forEach>
                        
                        
                        
                    </table>
                    <!--Paging-->
                    <div class="paging">
                        ${paging}
                    </div>
                    <!--//Paging-->
                </article>
                <!--//FAQ-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>