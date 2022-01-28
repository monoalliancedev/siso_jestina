<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/views/en/common/html.head.jsp" %>
<script>
//페이징 이동
function goPage(cpage){
	var f = document.searchForm;
	f.cpage.value = cpage;
	f.action = "overseas";
	f.submit();
}
//대륙선택 국가 view
function Jt_continent_change(obj) {
	var f = document.searchForm;
	//$(obj).val(); => 대륙의 키값
	
	//ajax통신으로 대륙에 해당하는 국가 정보를 받아온다.
    var url = "Country?code=" + $(obj).val();

	//alert(url);
	$.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
				var code = data.code;
				var name = data.name;
				
				const arrcode = code.split(",");
				const arrname = name.split(",");
				
				$("#SignCountry").empty();
				$("#SignCountry").append("<option value=''>Select region</option>");
				for(i=1; i<arrcode.length; i++) {
					
					$("#SignCountry").append("<option value='"+arrcode[i]+"'>"+arrname[i]+"</option>");
				}
            }
    });
}
</script>    
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/en/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/language/subEN.js"></script>
        <script type="text/javascript" src="/scripts/store.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/commBoard.css" />
        <link rel="stylesheet" type="text/css" href="/css/store.css" />
        <div id="container" class="sub store overseas">
            <!--Top Common-->
            <section class="subTop">
                <article>
                    <ul class="location">
                        <li><a href="/en">HOME</a></li>
                        <li class="dep1"></li>
                        <li class="depmenu"><span class="now">&nbsp;</span><div class="dep2List"></div></li>
                    </ul>
                    <h3 class="pageTitle"></h3>
                </article>
            </section>
            <ul class="storeTab">
                <li><a href="domestic">South Korea</a></li>
                <li><a href="#" class="on">International</a></li>
            </ul>
            <!--//Top Common-->
            <section class="content">
                <article>
<form name="searchForm" id="searchForm" method="get" class="boardSearch">
<input type="hidden" name="seq" />
<input type="hidden" name="cpage" value="1" />
                        <span class="total">TOTAL <b><fmt:formatNumber value="${totalCount}" pattern="#,###" /></b></span>
                        <select class="select shop" name="keyValue1" onchange="Jt_continent_change(this)">
                            <option value="">Store type</option>
                            <c:forEach var="continent" items="${continentList}">
							<option value="${continent[0]}" <c:if test="${page.keyValue1 eq continent[0]}">selected</c:if>>${continent[1]}</option>
							</c:forEach>
                        </select>
                        <select class="select area" name="keyValue2" id="SignCountry">
                            <option value="">Select region</option>
                            <c:forEach var="country" items="${countryCodeList}" varStatus="status">
							<option value="${country}" <c:if test="${page.keyValue2 eq country}">selected</c:if>>${countryNameList[status.index]}</option>
							</c:forEach>
                        </select>
                        <div class="searchWord">
                            <input type="text" name="keyword" value="${page.keyword}" placeholder="Enter search word"/>
                            <button type="submit"><img src="/images/common/icon_search_zoom.svg" alt="Search"/></button>
                        </div>
</form>
                </article>
                <article class="commBoardList">
                    <table>
                        <colgroup>
                            <col width="14.4%">
                            <col width="18.9%">
                            <col width="26.3%">
                            <col width="*">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>Continent</th>
                                <th>Country</th>
                                <th>Branch</th>
                                <th>Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" items="${list}" varStatus="status">
                            <tr>
                                <td class="area">${list.value1}</td>
                                <td class="nation">${list.value2}</td>
                                <td class="name">
                                	<c:choose>
			                            <c:when test="${list.value3 ne ''}">
			                                <a href="mailto:${list.value3}">${list.storeEn}</a>
			                            </c:when>
			                            <c:otherwise>
			                            	${list.storeEn}
			                            </c:otherwise>
	                            	</c:choose>
                                </td>
                                <td class="address">${list.addr1En} ${list.addr2En}</td>
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
        <%@ include file="/WEB-INF/views/en/common/html.footer.jsp" %>
    </div>
</body>
</html>
















                            
