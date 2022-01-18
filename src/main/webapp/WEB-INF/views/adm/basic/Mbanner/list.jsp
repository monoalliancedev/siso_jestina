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
//게시여부
function Jt_isntYN(seq,isntYN){
	$.ajax({ //게시여부Y가 2개 이상인지 확인
        type : "GET",
        url : "IsntYCount?gubun=${page.keyGubun}",

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
					alert("메인배너관리 게시글은 1개 이상 등록되어야 합니다.");
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
	f.action = "list";
	f.submit();
}
//뿌려지는 목록 갯수
function goRrows(obj) {
	var f = document.searchForm;
	f.pg_rows.value = $(obj).val();
	f.action = "list";
	f.submit();
}
//등록(0) 및 수정(>0) 
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
	f.action = "view";
	f.submit();
}
//삭제 
function Jt_delete(seq){
	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		var f = document.moveForm;
		f.seq.value = seq;
		f.cpage.value = 1;
		f.action="Del";
		f.submit();
	}
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
        
		<div id="container" class="basicMgmt mainBannerMgmt">
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
                    <select class="select" name="keyIsnt">
                        <option value="">언어전체</option>
                        <option value="KR" <c:if test="${page.keyIsnt eq 'KR'}">selected</c:if>>KR</option>
                        <option value="EN" <c:if test="${page.keyIsnt eq 'EN'}">selected</c:if>>EN</option>
                        <option value="CN" <c:if test="${page.keyIsnt eq 'CN'}">selected</c:if>>CN</option>
                    </select>
                    <select class="select" name="key">
                        <option value="all" <c:if test="${page.key eq 'all'}">selected</c:if>>전체</option>
                        <option value="title" <c:if test="${page.key eq 'title'}">selected</c:if>>제목</option>
                        <option value="contents" <c:if test="${page.key eq 'contents'}">selected</c:if>>내용</option>
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
                        <a href="#" onclick="Jt_submit(0)" class="commBtn black">배너추가</a>
                    </div>
</form>
                </article>
                <!--//컨트롤-->
                <!--목록-->
                <article class="hasTopTH">
                    <!--Cell Header-->
                    <div class="cellHeader">
                        <table>
                            <colgroup>
                                <col width="100">
                                <col width="6%">
                                <col width="12%">
                                <col width="*">
                                <col width="100">
                                <col width="12%">
                                <col width="12%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>선택</th>
                                    <th>No</th>
                                    <th>언어</th>
                                    <th>배너명</th>
                                    <th>게시여부</th>
                                    <th>등록일자</th>
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
                        <table  id="researchList">
                            <tbody>
                                <c:forEach var="list" items="${list}" varStatus="status">
                                <tr>
                                    <td>
                                        <div class="checkBox solo">
                                            <input name=sortKey type="checkbox" value="${list.seq}"/><i>&nbsp;</i>
                                        </div>
                                    </td>
                                    <td>${page.total_rows - page.pg_start - status.count + 1}</td>
                                    <td>${list.lang}</td>
                                    <td class="tit alLeft"><a href="#" onclick="Jt_submit(${list.seq})">${list.title}</a></td>
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
<input type="hidden" name="keyGubun" value="${page.keyGubun}" />
<input type="hidden" name="total_rows" value="${page.total_rows}" />

<input type="hidden" name="sortIdx" />
<input type="hidden" name="changeSeq"/>
<input type="hidden" name="changeKey"/>


</form>