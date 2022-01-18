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
//삭제 
function Jt_delete(seq){
	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		var f = document.moveForm;
		f.seq.value = seq;
		f.cpage.value = 1;
		f.action="categoryDel";
		f.submit();
	}
}
//게시여부
function Jt_viewYN(seq,viewYN){
	var f = document.moveForm;
	if (viewYN==="N")
		f.viewYn.value = "Y";
	else 
		f.viewYn.value = "N";	

	f.seq.value = seq;
	f.action="viewYN";
	f.submit();
}


//카테고리 등록폼 OPEN
function Jt_cateAdd(seq,cateName,sortIdx) {
	
    $('.layerPopup.categoryAdd').fadeIn();
    var popupSizeWD = $('.categoryAdd .popData').outerWidth();
    var popupSizeHT = $('.categoryAdd .popData').outerHeight();
    $('.categoryAdd .popData').css({
        'margin-left': - popupSizeWD / 2,
        'margin-top': - popupSizeHT / 2
    })
    
    if(seq>0) {
    	$("#inputName1").text("수정");
    	$("#inputName2").text("수정");
    	$("#inputName3").text("수정");
    }else{
    	$("#inputName1").text("추가");
    	$("#inputName2").text("추가");
    	$("#inputName3").text("추가");
    }
    
    var f = document.cateForm;
	f.seq.value = seq;
	f.sortIdx.value = sortIdx;
	f.cateName.value = cateName;
     
    return false;
}

//카테고리 등록,수정 Process
function Jt_cateProc(){

	var f = document.cateForm;
	if(f.cateName.value=="") {
		alert("카테고리명을 입력해주세요.");
		return false;
	}
	//alert(f.seq.value+"///////////");
	if(f.seq.value>0) {
		//카테고리 수정
		var mf = document.moveForm;
		mf.seq.value = f.seq.value;
		mf.sortIdx.value = f.sortIdx.value;
		mf.cateName.value = f.cateName.value;
		mf.action = "categoryProc";
		mf.submit();
	}else{
		//alert("111111");
		//카테고리 등록
		f.action = "categoryProc";
		f.submit();
	}
	
	
	
}

//페이징 이동
function goPage(cpage){
	var f = document.searchForm;
	f.cpage.value = cpage;
	f.action = "romasonCate";
	f.submit();
}
//뿌려지는 목록 갯수
function goRrows(obj) {
	var f = document.searchForm;
	f.pg_rows.value = $(obj).val();
	f.action = "romasonCate";
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
        
		<div id="container" class="brandMgmt romansonMgmt category">
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
                    <button type="button" class="order" id="btnDown" value="down">아래로 <img src="/jtadm/images/admin/icon_arrow_down.svg"/></button>
                    <button type="button" class="order" id="btnUp" value="up">위로 <img src="/jtadm/images/admin/icon_arrow_up.svg"/></button>
                    
                    <div class="viewNbtn">
                        <select class="select" name="pg_rows" onchange="goRrows(this)">
                            <option value="10" <c:if test="${page.pg_rows eq '10'}">selected</c:if>>10개씩</option>
							<option value="15" <c:if test="${page.pg_rows eq '15'}">selected</c:if>>15개씩</option>
							<option value="20" <c:if test="${page.pg_rows eq '20'}">selected</c:if>>20개씩</option>
							<option value="50" <c:if test="${page.pg_rows eq '50'}">selected</c:if>>50개씩</option>
                        </select>
                        <a href="#" onclick="Jt_cateAdd(0,'')" class="commBtn black">카테고리 등록</a>
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
                                <col width="6%">
                                <col width="*">
                                <col width="20%">
                                <col width="12%">
                                <col width="12%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>선택</th>
                                    <th>No</th>
                                    <th>카테고리</th>
                                    <th>NEW ARRIVALS 노출여부</th>
                                    <th>등록일</th>
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
				       				 	mf.action = "sortProc";
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
			       				 		mf.action = "sortProc";
			       				 		mf.submit();
		       				        }
		       				       	return false;
		       				    }
	       				    });
	       				    </script>
                                                    
                    <div class="cellBody">
                        <table id="researchList">
                            <tbody>
                                <tr>
                                    <c:forEach var="list" items="${list}" varStatus="status">
                                    <td>
                                        <div class="checkBox solo">
                                            <input name=sortKey type="checkbox" value="${list.seq}"/><i>&nbsp;</i>
                                        </div>
                                    </td>
                                    <td>${page.total_rows - page.pg_start - status.count + 1}</td>
                                    <td><a href="#" onclick="Jt_cateAdd(${list.seq},'${list.cateName}','${list.sortIdx}')" class="inBtn modify">${list.cateName}</a></td>
                                    <td><a href="#" onclick="Jt_viewYN('${list.seq}','${list.viewYn}')">
                                    	<span <c:if test="${list.viewYn eq 'Y'}"> class="colorBlue" </c:if>>${list.viewYn}</span></a>
                                    </td><!-- NEW ARRIVALS 노출여부 -->
                                    <td>${list.regdate}</td>
                                    <td>
                                        <a href="#" onclick="Jt_cateAdd(${list.seq},'${list.cateName}','${list.sortIdx}')" class="inBtn modify"><img src="/jtadm/images/admin/icon_modify.svg"/></a>
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
<form name="cateForm" id="cateForm" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="sortIdx" />
<input type="hidden" name="seq"/> 

            <div class="layerPopup categoryAdd">
                <div class="popData">
                    <h5>카테고리 <span id="inputName1">추가</span><span class="close"><img src="/jtadm/images/admin/icon_popup_close.svg"/></span></h5>
                    <div class="tb">
                        <table>
                            <colgroup>
                                <col width="215">
                                <col width="*">
                            </colgroup>
                            <tr>
                                <th>카테고리 <span id="inputName2">추가</span></th>
                                <td><input type="text" name="cateName" id="cateName" class="enterText" placeholder="카테고리를 입력해주세요."/></td>
                            </tr>
                        </table>
                    </div>
                    <div class="button">
                        <a href="#" class="commBtn white cancle">취소</a>
                        <a href="#" onclick="Jt_cateProc()" class="commBtn black save"><span id="inputName3">추가</span></a>
                    </div>
                </div>
            </div>
</form>
            <!--//카테고리 추가-->
        </div>
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/html.footer.jsp" %>  
   
    </div>
</body>
</html>
<form name="moveForm" id="moveForm" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq"/>
<input type="hidden" name="sortIdx"/>
<input type="hidden" name="cateName"/>
<input type="hidden" name="viewYn"/>

<input type="hidden" name="cpage" value="${page.cpage}" />
<input type="hidden" name="key" value="${page.key}">
<input type="hidden" name="keyword" value="${page.keyword}">
<input type="hidden" name="keyValue1" value="${page.keyValue1}" />
<input type="hidden" name="pg_rows" value="${page.pg_rows}" />
<input type="hidden" name="total_rows" value="${page.total_rows}" />

<input type="hidden" name="changeSeq"/>
<input type="hidden" name="changeKey"/>

</form>