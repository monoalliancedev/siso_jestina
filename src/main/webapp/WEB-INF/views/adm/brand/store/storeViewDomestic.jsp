<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/adm/jtcommon/html.head.jsp" %>  
<script type="text/javascript">
//값이 비어 있는지 체크
function isBlank(input) {
	
	if((input.value =="") ||(input.value ==null)) {
		return true;
	}
	return false;
}

//수정,등록 Proc
function Jt_submit() { 
	var f = document.processForm;
	if(isBlank(f.value1)) {
		alert( "지역을 설정해주세요.");
		f.value1.focus();
		return;
	}
	if(isBlank(f.value2)) {
		alert( "브랜드를 설정해주세요.");
		f.value2.focus();
		return;
	}
	if(isBlank(f.value3)) {
		alert( "매장구분을 설정해주세요.");
		f.value3.focus();
		return;
	}	
	if(isBlank(f.tel)) {
		alert( "전화번호를 입력해주세요.");
		f.tel.focus();
		return;
	}	

	var langKey;
	var ck = true;
	// 체크된 체크박스의 value 값을 가지고 온다.
	$('input:checkbox[name=langArr]:checked').each(function() { 
     	langKey = this.value; //KR,EN,CN
     		
     	if($("#store"+langKey).val()=="") {
			alert( langKey + " 매장명을 입력해주세요.");
			$("#store"+langKey).focus();
			ck = false;
			return false;
		}
     	if($("#addr1"+langKey).val()=="") {
			alert( langKey + " 주소를 입력해주세요.");
			$("#addr1"+langKey).focus();
			ck = false;
			return false;
		}
     	if($("#addr2"+langKey).val()=="") {
			alert( langKey + " 나머지주소를 입력해주세요.");
			$("#addr2"+langKey).focus();
			ck = false;
			return false;
		}
    });
    
	if(ck) {
		f.action = "proc${gubun}";
		f.submit();
	}
}  
//삭제 
function Jt_delete(seq){
	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		var f = document.processForm;
		f.cpage.value = 1;
		f.action="del${gubun}";
		f.submit();
	}
}
</script>
</head>
<body>
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/headerAndMenu.jsp" %>

<form name="processForm" id="processForm" method="post"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq" value="${store.seq}"/>
<input type="hidden" name="sortIdx" value="${store.sortIdx}" />
<input type="hidden" name="cpage" value="${search.cpage}" />
<input type="hidden" name="pg_rows" value="${search.pg_rows}" />
<input type="hidden" name="keyIsnt" value="${search.keyIsnt}" />
<input type="hidden" name="keyword" value="${search.keyword}" />
<input type="hidden" name="keyValue1" value="${search.keyValue1}" />
<input type="hidden" name="keyValue2" value="${search.keyValue2}" />
<input type="hidden" name="keyValue3" value="${search.keyValue3}" />




		<div id="container" class="brandMgmt shopMgmt domesticReg">
            <!--상단-->
            <section class="topSubCntn">
                <c:if test="${processKey eq 'Insert'}">
                <div class="infoText">
                    <h3>매장관리 국내등록</h3>
                </div>
                <a href="#" onclick="Jt_submit()" class="commBtn black">등록</a>
                </c:if>
                
                <c:if test="${processKey eq 'Update'}">
                <div class="infoText">
                    <h3>매장관리 국내수정</h3>
                </div>
                <a href="#" onclick="Jt_delete()" class="commBtn white"><img src="/jtadm/images/admin/icon_btn_del.svg"/>삭제</a>
                <a href="#" onclick="javascript:history.back()" class="commBtn white">목록</a>
                <a href="#" onclick="Jt_submit()" class="commBtn black">저장</a>
                </c:if>
            </section>
            <!--//상단-->
            <!--데이터-->
            <section class="regBodyCntn">
                <article class="hasLeftTH">
                    <table>
                        <colgroup>
                            <col width="214"/>
                            <col width="*"/>
                            <col width="214"/>
                            <col width="*"/>
                        </colgroup>
                        <tr>
                            <th>언어</th>
                            <td>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" id="langKR" onclick="Jt_langCheck('KR')" value="KR" <c:if test = "${fn:contains(store.lang, 'KR')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langKR">KR</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" id="langEN" onclick="Jt_langCheck('EN')" value="EN" <c:if test = "${fn:contains(store.lang, 'EN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langEN">EN</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" id="langCN" onclick="Jt_langCheck('CN')" value="CN" <c:if test = "${fn:contains(store.lang, 'CN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langCN">CN</label>
                                </div>
                            </td>
                            <th>등록일</th>
                            <td>
                                <div class="datepicker oneDay">
                                    <input name="regdate" value="${store.regdate}" type="text" class="selectDate" onKeyup="directDate(this);" placeholder="등록일 yyyy-mm-dd"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>지역 <span class="colorRed">*</span></th>
                            <td>
                                <select class="select w100" name="value1">
                                    <option value="">지역전체</option>
                                    <c:forEach var="area" items="${areaList}">
										<option value="${area[0]}" <c:if test="${store.value1 eq area[0]}">selected</c:if>>${area[1]}</option>
									</c:forEach>
                                </select>
                            </td>
                            <th>브랜드 <span class="colorRed">*</span></th>
                            <td>
                                <select class="select w100" name="value2">
                                <c:forEach var="brand" items="${brandList}">
									<option value="${brand[0]}" <c:if test="${store.value2 eq brand[0]}">selected</c:if>>${brand[1]}</option>
								</c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>매장구분 <span class="colorRed">*</span></th>
                            <td>
                                <select class="select w100" name="value3">
                                    <option value="">매장전체</option>
			                        <c:forEach var="storeGubun" items="${storeList}">
									<option value="${storeGubun[0]}" <c:if test="${store.value3 eq storeGubun[0]}">selected</c:if>>${storeGubun[1]}</option>
									</c:forEach>
                                </select>
                            </td>
                            <th>전화번호 <span class="colorRed">*</span></th>
                            <td><input type="text" name="tel" value="${store.tel}" class="enterText" placeholder="전화번호"/></td>
                        </tr>
                        <tr id=nameTrKR>
                            <th>매장명 (KR) <span class="colorRed">*</span></th>
                            <td colspan="3"><input type="text" name="storeKr" id="storeKR" value="${store.storeKr}" class="enterText" placeholder="매장명 (KR)을 입력해주세요."/></td>
                        </tr>
                        <tr id=nameTrEN>
                            <th>매장명 (EN) <span class="colorRed">*</span></th>
                            <td colspan="3"><input type="text" name="storeEn" id="storeEN" value="${store.storeEn}" class="enterText" placeholder="매장명 (EN)을 입력해주세요."/></td>
                        </tr>
                        <tr id=nameTrCN>
                            <th>매장명 (CN) <span class="colorRed">*</span></th>
                            <td colspan="3"><input type="text" name="storeCn" id="storeCN" value="${store.storeCn}" class="enterText" placeholder="매장명 (CN)을 입력해주세요."/></td>
                        </tr>
                        <tr id=addrTrKR class="address">
                            <th>주소 (KR) <span class="colorRed">*</span></th>
                            <td colspan="3">
                                <input type="text" name="addr1Kr" id="addr1KR" value="${store.addr1Kr}" class="enterText" placeholder="상세주소 (KR)를 입력해주세요."/>
                                <input type="text" name="addr2Kr" id="addr2KR" value="${store.addr2Kr}" class="enterText" placeholder="나머지 주소 (KR)를 입력해주세요."/>
                            </td>
                        </tr>
                        <tr id=addrTrEN class="address">
                            <th>주소 (EN) <span class="colorRed">*</span></th>
                            <td colspan="3">
                                <input type="text" name="addr1En" id="addr1EN" value="${store.addr1En}" class="enterText" placeholder="상세주소 (EN)를 입력해주세요."/>
                                <input type="text" name="addr2En" id="addr2EN" value="${store.addr2En}" class="enterText" placeholder="나머지 주소 (EN)를 입력해주세요."/>
                            </td>
                        </tr>
                        <tr id=addrTrCN class="address">
                            <th>주소 (CN) <span class="colorRed">*</span></th>
                            <td colspan="3">
                                <input type="text" name="addr1Cn" id="addr1CN" value="${store.addr1Cn}" class="enterText" placeholder="상세주소 (CN)를 입력해주세요."/>
                                <input type="text" name="addr2Cn" id="addr2CN" value="${store.addr2Cn}" class="enterText" placeholder="나머지 주소 (CN)를 입력해주세요."/>
                            </td>
                        </tr>
                    </table>
                </article>
            </section>
            <!--//데이터-->
                               
            
        </div>
</form>

        <%@ include file="/WEB-INF/views/adm/jtcommon/html.footer.jsp" %>  
   
    </div>
</body>
</html>
<form name="delForm" id="delForm" method="get" action="delKR">
<input type="hidden" name="seq" value="${store.seq}" />
</form>


<script>
//언어 선택이 되면 => 주소,이미지 tr을 보여줌
function Jt_langCheck(key) {
	if($('#lang'+key).is(':checked')){
		$('#nameTr'+key).attr('style', "display:'';");  //나타내기
		$('#addrTr'+key).attr('style', "display:'';");  //나타내기
	}else{
		$('#nameTr'+key).attr('style', "display:none;");  //숨기기
		$('#addrTr'+key).attr('style', "display:none;");  //숨기기
	}
}
Jt_langCheck('KR');
Jt_langCheck('EN');
Jt_langCheck('CN');
</script> 




