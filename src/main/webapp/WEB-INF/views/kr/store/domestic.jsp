<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %>
<script>
//페이징 이동
function goPage(cpage){
	var f = document.searchForm;
	f.cpage.value = cpage;
	f.action = "domestic";
	f.submit();
}
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/store.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/commBoard.css" />
        <link rel="stylesheet" type="text/css" href="/css/store.css" />
        <div id="container" class="sub store domestic">
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
            <ul class="storeTab">
                <li><a href="#" class="on">국내</a></li>
                <li><a href="overseas">해외</a></li>
            </ul>
            <!--//Top Common-->
            <section class="content">
                <article>
<form name="searchForm" id="searchForm" method="get" class="boardSearch">
<input type="hidden" name="seq" />
<input type="hidden" name="cpage" value="1" />

                        <span class="total">TOTAL <b><fmt:formatNumber value="${totalCount}" pattern="#,###" /></b></span>
                        <select class="select shop" name="keyValue3">
                            <option value="">매장구분</option>
                            <c:forEach var="store" items="${storeList}">
							<option value="${store[0]}" <c:if test="${page.keyValue3 eq store[0]}">selected</c:if>>${store[1]}</option>
							</c:forEach>
                        </select>
                        <select class="select area" name="keyValue1">
                           	<option value="">지역선택</option>
                            <c:forEach var="area" items="${areaList}">
							<option value="${area[0]}" <c:if test="${page.keyValue1 eq area[0]}">selected</c:if>>${area[1]}</option>
							</c:forEach>
                        </select>
                        <div class="searchWord">
                            <input type="text" name="keyword" value="${page.keyword}" placeholder="검색어를 입력하세요"/>
                            <button type="submit"><img src="/images/common/icon_search_zoom.svg" alt="검색"/></button>
                        </div>
                    </form>
                </article>
                <article class="commBoardList">
                    <table>
                        <colgroup>
                            <col width="5.72%">
                            <col width="17.2%">
                            <col width="9.9%">
                            <col width="19.59%">
                            <col width="*">
                            <col width="13.12%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>지역</th>
                                <th>브랜드</th>
                                <th>매장구분</th>
                                <th>매장명</th>
                                <th>주소</th>
                                <th>전화번호</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" items="${list}" varStatus="status">
                            <tr>
                                <td class="area">${list.value1}</td>
                                <td class="brand">${list.value2}</td>
                                <td class="shop">${list.value3}</td>
                                <td class="name">${list.storeKr}<span></span></td>
                                <td class="address">${list.addr1Kr} ${list.addr2Kr}</td>
                                <td class="tel"><a href="tel:${list.tel}">${list.tel}</a></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="paging">
                        ${paging}
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>