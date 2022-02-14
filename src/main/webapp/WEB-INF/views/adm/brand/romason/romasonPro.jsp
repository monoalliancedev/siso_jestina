<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/adm/jtcommon/html.head.jsp" %>  
<script>
//등록 및 수정 
function Jt_submit(seq) {
	var f = document.moveForm;
	if(seq < 1) { //등록
		f.cpage.value = 1;
		f.key.value = "";
		f.keyword.value = "";
		f.keyIsnt.value = "";
		f.pg_rows.value = 10;
	}	
	f.seq.value = seq;
	f.action = "romasonProView";
	f.submit();
}
//삭제 
function Jt_delete(seq){
	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		var f = document.moveForm;
		f.seq.value = seq;
		f.cpage.value = 1;
		f.action="romasonProDel";
		f.submit();
	}
}

//게시여부
function Jt_isntYN(seq,isntYN){
	$.ajax({ //게시여부Y가 2개 이상인지 확인
        type : "GET",
        url : "IsntYCount",
        dataType : "json",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
        	var f = document.moveForm;
        	if (isntYN==="N") {
				f.isntYN.value = "Y";
			} else {
				f.isntYN.value = "N";
				if(data<2) {
					alert("로만손 제품 관리 게시글은 1개 이상 등록되어야 합니다");
					return;
				}
			}
        	f.seq.value = seq;
			f.action="IsntYN";
			f.submit();
		}
    });
}


//페이징 이동
function goPage(cpage){
	var f = document.searchForm;
	f.cpage.value = cpage;
	f.action = "romasonPro";
	f.submit();
}
//뿌려지는 목록 갯수
function goRrows(obj) {
	var f = document.searchForm;
	f.pg_rows.value = $(obj).val();
	f.action = "romasonPro";
	f.submit();
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
</head>
<body>
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/headerAndMenu.jsp" %>
        <div id="container" class="brandMgmt romansonMgmt productList">
            <!--상단-->
            <section class="topCntn">
                <ul class="result">
                    <li>총 <span><fmt:formatNumber value="${totalCount}" pattern="#,###" /></span>건</li>
                    <c:if test="${totalCount > page.total_rows}">
                    <li>검색결과 <span><fmt:formatNumber value="${page.total_rows}" pattern="#,###" /></span>건</li>
                    </c:if>
                </ul>
                <!--검색-->
<form name="searchForm" id="searchForm" method="get" action="" class="searchWrap">
<input type="hidden" name="seq" />
<input type="hidden" name="cpage" value="1" />
               
                    <select class="select" name="keyValue1" id="SignCategory">
                        <option value="">카테고리 전체</option>
                        <c:forEach var="categoryList" items="${categoryList}" varStatus="status">
	                    <option value="${categoryList.seq}" <c:if test="${page.keyValue1 eq categoryList.seq}">selected</c:if>>${categoryList.cateName}</option>
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
                    <div class="viewNbtn">
                        <select class="select" name="pg_rows" onchange="goRrows(this)">
                            <option value="10" <c:if test="${page.pg_rows eq '10'}">selected</c:if>>10개씩</option>
							<option value="15" <c:if test="${page.pg_rows eq '15'}">selected</c:if>>15개씩</option>
							<option value="20" <c:if test="${page.pg_rows eq '20'}">selected</c:if>>20개씩</option>
							<option value="50" <c:if test="${page.pg_rows eq '50'}">selected</c:if>>50개씩</option>
                        </select>
                        <a href="#" onclick="Jt_submit(0)" class="commBtn black">제품등록</a>
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
                                <col width="100">
                                <col width="15%">
                                <col width="*">
                                <col width="10%">
                                <col width="12%">
                                <col width="12%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>카테고리</th>
                                    <th>제품</th>
                                    <th>게시여부</th>
                                    <th>등록일</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <!--//Cell Header-->
                    <!--Cell Body-->
                    <div class="cellBody">
                        <table>
                            <tbody>
                                <c:forEach var="list" items="${list}" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${list.cateName}</td>
                                    <td><a href="#" onclick="Jt_submit(${list.seq})">${list.proName}</a></td>
                                    <td><a href="#" onclick="Jt_isntYN('${list.seq}','${list.isntYn}')">
                                    	<span <c:if test="${list.isntYn eq 'Y'}"> class="colorBlue" </c:if>>${list.isntYn}</span></a>
                                    </td><!-- 게시여부 -->
                                    <td>${list.regdate}</td>
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
            <!--카테고리 추가-->
            <div class="layerPopup categoryAdd">
                <div class="popData">
                    <h5>카테고리 추가<span class="close"><img src="../images/admin/icon_popup_close.svg"/></span></h5>
                    <div class="tb">
                        <table>
                            <colgroup>
                                <col width="215">
                                <col width="*">
                            </colgroup>
                            <tr>
                                <th>카테고리 추가</th>
                                <td><input type="text" class="enterText" placeholder="카테고리를 입력해주세요."/></td>
                            </tr>
                        </table>
                    </div>
                    <div class="button">
                        <a href="#" class="commBtn white cancle">취소</a>
                        <a href="#" class="commBtn black save">추가</a>
                    </div>
                </div>
            </div>
            <!--//카테고리 추가-->
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
<input type="hidden" name="key" value="${page.key}">
<input type="hidden" name="keyword" value="${page.keyword}">
<input type="hidden" name="keyIsnt" value="${page.keyIsnt}" />
<input type="hidden" name="pg_rows" value="${page.pg_rows}" />
<input type="hidden" name="total_rows" value="${page.total_rows}" />
</form>


