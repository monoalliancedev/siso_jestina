<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script>
//등록(0) 및 수정(>0) 
function Jt_submit(seq) {
	var f = document.moveForm;
	if(seq < 1) { //등록
		f.cpage.value = 1;
		f.keyword.value = "";
		f.keyIsnt.value = "";
		f.keyValue1.value = "";
		f.keyValue2.value = "";
		f.keyValue3.value = "";
		f.pg_rows.value = 10;
	}	
	f.seq.value = seq;
	f.action = "view${gubun}";
	f.submit();
}
//삭제 
function Jt_delete(seq){
	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		var f = document.moveForm;
		f.seq.value = seq;
		f.cpage.value = 1;
		f.action="del${gubun}";
		f.submit();
	}
}
//페이징 이동
function goPage(cpage){
	var f = document.searchForm;
	f.cpage.value = cpage;
	f.action = "list${gubun}";
	f.submit();
}
//뿌려지는 목록 갯수
function goRrows(obj) {
	var f = document.searchForm;
	f.pg_rows.value = $(obj).val();
	f.action = "list${gubun}";
	f.submit();
}
//대륙선택 국가 view
function Jt_continent_change(obj) {
	var f = document.searchForm;
	//$(obj).val(); => 대륙의 키값
	
	//ajax통신으로 대륙에 해당하는 국가 정보를 받아온다.
    var url = "/jtadm/brand/store/Country?code=" + $(obj).val();

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
				$("#SignCountry").append("<option value=''>국가 전체</option>");
				for(i=1; i<arrcode.length; i++) {
					$("#SignCountry").append("<option value='"+arrcode[i]+"'>"+arrname[i]+"</option>");
				}
            }
    });
}

<c:if test="${msg eq 'insertOK'}">
	alert("등록 되었습니다.");
</c:if>
<c:if test="${msg eq 'updateOK'}">
	alert("수정 되었습니다.");
</c:if>
<c:if test="${msg eq 'deleteOK'}">
	alert("삭제 되었습니다.");
</c:if>
</script>
<%@ include file="/WEB-INF/views/adm/jtcommon/html.head.jsp" %>  
</head>
<body>
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/headerAndMenu.jsp" %>
        
		<div id="container" class="brandMgmt shopMgmt overseas">
            <!--상단-->
            <section class="topCntn">
                <ul class="result">
                    <li>총 <span><fmt:formatNumber value="${totalCount}" pattern="#,###" /></span>건</li>
                    <c:if test="${totalCount > page.total_rows}">
                    <li>검색결과 <span><fmt:formatNumber value="${page.total_rows}" pattern="#,###" /></span>건</li>
                    </c:if>
                </ul>
                <!--검색-->
<form name="searchForm" id="searchForm" method="get" class="searchWrap">
<input type="hidden" name="seq" />
<input type="hidden" name="cpage" value="1" />

                    <select class="select" name="keyIsnt">
                        <option value="">언어전체</option>
                        <option value="KR" <c:if test="${page.keyIsnt eq 'KR'}">selected</c:if>>KR</option>
                        <option value="EN" <c:if test="${page.keyIsnt eq 'EN'}">selected</c:if>>EN</option>
                        <option value="CN" <c:if test="${page.keyIsnt eq 'CN'}">selected</c:if>>CN</option>
                    </select>
                    <select class="select" name="keyValue1" onchange="Jt_continent_change(this)">
                        <option value="">대륙 전체</option>
                        <c:forEach var="continent" items="${continentList}">
						<option value="${continent[0]}" <c:if test="${page.keyValue1 eq continent[0]}">selected</c:if>>${continent[1]}</option>
						</c:forEach>
                    </select>
                    <select class="select" name="keyValue2" id="SignCountry">
                        <option value="">국가 전체</option>
                        <c:forEach var="country" items="${countryCodeList}" varStatus="status">
						<option value="${country}" <c:if test="${page.keyValue2 eq country}">selected</c:if>>${countryNameList[status.index]}</option>
						</c:forEach>
                    </select>
                    <fieldset class="searchText">
                        <input type="text" name="keyword" value="${page.keyword}" />
                        <button type="submit">검색</button>
                    </fieldset>
                <!--//검색-->
            </section>
            <!--//상단-->
            <!--데이터-->
            <section class="bodyCntn">
                <!--컨트롤-->
                <article class="boardCtrl">
                    <button type="button" class="order" id="btnDown" value="down">아래로 <img src="/jtadm/images/admin/icon_arrow_down.svg"/></button>
                    <button type="button" class="order" id="btnUp" value="up">위로 <img src="/jtadm/images/admin/icon_arrow_up.svg"/></button>
                    <div class="viewNbtn">
                        <select class="select" name="pg_rows" onchange="goRrows(this)">
                            <option value="10" <c:if test="${page.pg_rows eq '10'}">selected</c:if>>10개씩</option>
							<option value="15" <c:if test="${page.pg_rows eq '15'}">selected</c:if>>15개씩</option>
							<option value="20" <c:if test="${page.pg_rows eq '20'}">selected</c:if>>20개씩</option>
							<option value="50" <c:if test="${page.pg_rows eq '50'}">selected</c:if>>50개씩</option>
                        </select>
                        <a href="#" onclick="Jt_submit(0)" class="commBtn black">해외 매장 등록</a>
                    </div>
                </article>
                <!--//컨트롤-->
</form>                
                <!--목록-->
                <article class="hasTopTH">
                    <!--Cell Header-->
                    <div class="cellHeader">
                        <table>
                            <colgroup>
                                <col width="60">
                                <col width="9%">
                                <col width="5%">
                                <col width="10%">
                                <col width="15%">
                                <col width="*">
                                <col width="10%">
                                <col width="10%">
                                <col width="8%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>선택</th>
                                    <th>언어</th>
                                    <th>대륙</th>
                                    <th>국가</th>
                                    <th>매장명</th> 
                                    <th>주소</th>
                                    <th>이메일</th>
                                    <th>전화번호</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <!--//Cell Header-->
                    <!--Cell Body-->
                    <script>
							//위로버튼
	       					$("#btnUp").click(function(){
	       						if($("#researchList input:checked").size()==0){
	       				            alert('선택을 먼저 해주세요');
	       				        }else if($("#researchList input:checked").size() > 1){
	       				            alert('한개씩만 선택해주세요.');
	       				        }else{
	       				    		if ($( "input[name=sortKey]:checkbox")[0].checked == false ) { //첫번째 값이 아닐때
				       					var mf = document.moveForm;
				       				 	mf.changeSeq.value = $("#researchList input:checked").val(); //현재 선택된 값
				       				 	mf.changeKey.value = "Up";
				       				 	mf.action = "sortProcEN";
				       				 	mf.submit();
			       					}    
		       				        return false;
	       				        }
		       				});

	       					//한칸 아래로
	       				    $("#btnDown").click(function(){

	       				    	if($("#researchList input:checked").size()==0){
	       				            alert('선택을 먼저 해주세요');
	       				        }else if($("#researchList input:checked").size() > 1){
	       				            alert('한개씩만 선택해주세요.');
	       				        }else{
	       				        	var chkLength = $("input[name=sortKey]:checkbox" ).length-1;
		       				    	if ($( "input[name=sortKey]:checkbox")[chkLength].checked == false ) { //마지막 값이 아닐때    
			       				        var mf = document.moveForm;
			       				 		mf.changeSeq.value = $("#researchList input:checked").val(); //현재 선택된 값
			       				 		mf.changeKey.value = "Down";
			       				 		mf.action = "sortProcEN";
			       				 		mf.submit();
		       				        }
		       				       	return false;
		       				    }
	       				    });
	       				    </script>
	       				    <div class="cellBody">
                        <table id="researchList">
                            <tbody>
                                <c:forEach var="list" items="${list}" varStatus="status">
                                <tr>
                                    <td>
                                        <div class="checkBox solo">
                                            <input name=sortKey type="checkbox" value="${list.seq}"/><i>&nbsp;</i>
                                        </div>
                                    </td>
                                    <td>${list.lang}</td>
                                    <td>${list.value1}</td>
                                    <td>${list.value2}</td>
                                    <td class="tit alLeft">
                                    	<a href="#" onclick="Jt_submit(${list.seq})" class="inBtn modify">
                                    	<c:if test = "${fn:contains(list.lang, 'KR')}">KR : ${list.storeKr}</br></c:if>
	                                    <c:if test = "${fn:contains(list.lang, 'EN')}">EN : ${list.storeEn}</br></c:if>
	                                    <c:if test = "${fn:contains(list.lang, 'CN')}">CN : ${list.storeCn}</br></c:if>
	                                    </a>
                                    </td>
                                    <td class="tit alLeft">
                                    	<a href="#" onclick="Jt_submit(${list.seq})" class="inBtn modify">
                                    	<c:if test = "${fn:contains(list.lang, 'KR')}">KR : ${list.addr1Kr} ${list.addr2Kr}</br></c:if>
	                                    <c:if test = "${fn:contains(list.lang, 'EN')}">EN : ${list.addr1En} ${list.addr2En}</br></c:if>
	                                    <c:if test = "${fn:contains(list.lang, 'CN')}">CN : ${list.addr1Cn} ${list.addr2Cn}</br></c:if>
	                                    </a>
                                    </td>
                                    <td>${list.value3}</td>
                                    <td>${list.tel}</td>
                                    <td>
                                        <a href="#" onclick="Jt_submit(${list.seq})" class="inBtn modify"><img src="/jtadm/images/admin/icon_modify.svg"/></a>
                                        <a href="#" onclick="Jt_delete(${list.seq})" class="inBtn del"><img src="/jtadm/images/admin/icon_del.svg"/></a>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!--//Cell Body-->
                    <!--Paging-->
                    <div class="paging">
                        ${paging}
                    </div>
                    <!--//Paging-->
                </article>
                <!--//목록-->
            </section>
            <!--//데이터-->
        </div>
        
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/html.footer.jsp" %>  
   
    </div>
</body>
</html>
<form name="moveForm" id="moveForm" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq"/>
<input type="hidden" name="isntYN"/>

<input type="hidden" name="cpage" value="${page.cpage}" />
<input type="hidden" name="keyword" value="${page.keyword}">
<input type="hidden" name="keyIsnt" value="${page.keyIsnt}" />
<input type="hidden" name="keyValue1" value="${page.keyValue1}" />
<input type="hidden" name="keyValue2" value="${page.keyValue2}" />
<input type="hidden" name="keyValue3" value="${page.keyValue3}" />
<input type="hidden" name="pg_rows" value="${page.pg_rows}" />
<input type="hidden" name="total_rows" value="${page.total_rows}" />

<input type="hidden" name="sortIdx" />
<input type="hidden" name="changeSeq"/>
<input type="hidden" name="changeKey"/>
</form>

                    
                    