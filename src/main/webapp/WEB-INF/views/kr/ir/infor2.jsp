<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %>
<script>
//view 
function Jt_submit(seq) {
	window.open("https://dart.fss.or.kr/dsaf001/main.do?rcpNo=" + seq);
	return false;
}
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/ir.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/commBoard.css" />
        <link rel="stylesheet" type="text/css" href="/css/ir.css" />
        <div id="container" class="sub ir disclosure">
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
                <article>
                    <form class="boardSearch">
                        <span class="total">TOTAL <b><fmt:formatNumber value="${page.total_rows}" pattern="#,###" /></b></span>
                        <select class="select">
                            <option>전체</option>
                        </select>
                        <div class="searchWord">
                            <input type="text" placeholder="검색어를 입력하세요"/>
                            <button type="button"><img src="/images/common/icon_search_zoom.svg" alt="검색"/></button>
                        </div>
                    </form>
                </article>
                <article class="commBoardList">
                    <table>
                        <colgroup>
                            <col width="5.4%">
                            <col width="16%">
                            <col width="*">
                            <col width="16%">
                            <col width="12.5%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>공시대상회사</th>
                                <th>보고서명</th>
                                <th>제출인</th>
                                <th>접수일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" items="${apiList}" varStatus="status">
                            <fmt:parseDate value="${list.rcept_dt}" var="dataValue" pattern="yyyyMMdd"/>
                            <tr>
                                <td class="no">${status.index+1}</td>
                                <td class="cmpy"><span>${list.corp_name}</span></td>
                                <td class="name alLeft"><a href="" onclick="Jt_submit(${list.rcept_no})">${list.report_nm}</a></td>
                                <td class="submit"><span>${list.flr_nm}</span></td>
                                <td class="dete"><fmt:formatDate value="${dataValue}" pattern="yyyy/MM/dd"/></td>
                            </tr>
                            </c:forEach>	
                        </tbody>
                    </table>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>