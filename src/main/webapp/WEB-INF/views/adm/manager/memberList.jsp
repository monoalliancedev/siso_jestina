<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/adm/jtcommon/html.head.jsp" %>  


<script>
$(document).ready(function () {

	<c:if test="${msg eq 'insertOK'}">
	alert("회원 정보가 등록 되었습니다.");
	</c:if>
	<c:if test="${msg eq 'updateOK'}">
	alert("회원 정보가 수정 되었습니다.");
	</c:if>
	<c:if test="${msg eq 'deleteOK'}">
	alert("회원 정보가 삭제 되었습니다.");
	</c:if>
	<c:if test="${msg eq 'deleteNon'}">
	alert("총괄 관리자는 삭제 할수 없습니다.");
	</c:if>
	
	

	//회원등록/수정 팝업크기
    function memberRegPopupDataSize() {
        var windowHT = $(window).height();
        $('.layerPopup.memberReg .popData').css({
            'height': windowHT - 50,
            'width': 1200,
        });
    }
    //회원등록/수정 팝업위치
    function memberRegPopupSize() {
        var popupDateWD = $('.layerPopup.memberReg .popData').outerWidth();
        var popupDateHT = $('.layerPopup.memberReg .popData').outerHeight();
        $('.layerPopup.memberReg .popData').css({
            'margin-left': - popupDateWD / 2,
            'margin-top': - popupDateHT / 2
        });
    }
    //권한관리 테이블 크기
    function authorityTableFun() {
        var popupDateHT = $('.layerPopup.memberReg .popData').outerHeight();
        var topFixHT = $('.layerPopup.memberReg .hasLeftTH').outerHeight();
        var titleFirHT = $('.layerPopup.memberReg h5:first-child').outerHeight();
        var titleSecHT = $('.layerPopup.memberReg h5:nth-child(3)').outerHeight();
        var buttonHT = $('.layerPopup.memberReg .button').outerHeight();
        $('.layerPopup.memberReg .popData > div.tb').css({
            'height': popupDateHT - topFixHT - titleFirHT - titleSecHT - buttonHT
        });
    }
    function authorityCellBodySize() {
        var authorityTableHT = $('.layerPopup.memberReg .popData > div.tb').outerHeight();
        $('.layerPopup.memberReg .cellBody').css({
            'max-height': authorityTableHT - 54
        })
    }

 	//#### 회원 등록 팝업호출
    $('.adminMgmt .reg').click(function () {
        
        $('.layerPopup.memberReg').show();
        $('tr.memID , tr.passwordChg').hide();
        $('tr.memIDReg , tr.password').css('display', 'table-row');
        $('.layerPopup.memberReg h5:first-child span.text').text('회원 정보등록');
        
        $("#inputName1").text("등록");
        $("#inputName2").text("취소");
        
        memberRegPopupSize();
        authorityTableFun();
        authorityCellBodySize();

      	//processKey 필드를 값을 넣어준다.
        $('#processKey').val('insert'); 

        return false;
    });
    
  
    //### 회원 수정 팝업호출 //리스트를 클릭했을경우 //ajax통신으로 서버에서 (회원정보)값 받아오기
    $('.adminMgmt .cellBody td a').click(function() {
        
    	$('.layerPopup.memberReg').fadeIn();
        $('tr.memID , tr.passwordChg').css('display', 'table-row');
        $('tr.memIDReg , tr.password').hide();
        $('.layerPopup.memberReg h5:first-child span.text').text('회원 정보수정');

        $("#inputName1").text("저장");
        $("#inputName2").text("목록");
        
		memberRegPopupSize();
		authorityTableFun();
		authorityCellBodySize();
        
		//processKey 필드를 값을 넣어준다.
        $('#processKey').val('update'); 

		//리스트를 클릭했을때 id 값을 받아왔어요^^.
    	var selectedId = $(this).attr("data-id");
    	
        //ajax통신으로 서버에서 (회원정보)값 받아오기(selectedId)
        var url = "/jtadm/manager/memberInfo?id=" + selectedId;

        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){

            	//통신데이터 값
                $('#signRegdate').val(data.admREGDATE); 
				$('#signId').html(data.admID);
				$('#signUpdateID').val(selectedId);
				$('#signHp').val(data.admHP);
				$('#signName').val(data.admNAME);
				$('#signDepartment').val(data.admDEPART);

				//alert(data.MbannerChk+"//"+data.MpopupChk+"//"+data.MBbannerChk+"//"+data.bannerChk+"//" + data.managerChk)
				if(data.managerChk == "checked") {
					//관리자 권한관리
					$("input:checkbox[id='signChkManager']").prop("checked", true);
				}else{
					$('#inputName3').html("<a href='#' onclick='Jt_delete()' class='commBtn black save'>삭제</a>");
				}
				
				//기본설정 권한관리
				var sum = 0;
				if((data.MbannerChk=="checked") && (data.MpopupChk=="checked")&& (data.MBbannerChk=="checked")) {
					$("input:checkbox[id='signChkBasic']").prop("checked", true);
					sum++;
				}
				if(data.MbannerChk=="checked") $("input:checkbox[id='signChkMbanner']").prop("checked", true);
				if(data.MpopupChk=="checked") $("input:checkbox[id='signChkMpopup']").prop("checked", true);
				if(data.MBbannerChk=="checked") $("input:checkbox[id='signChkMBbanner']").prop("checked", true);
			
				//브랜드관리 권한관리
				if((data.bannerChk=="checked") && (data.romanChk=="checked")&& (data.museChk=="checked")&& (data.storeChk=="checked")) {
					$("input:checkbox[id='signChkBrand']").prop("checked", true);
					sum++;
				}
				if(data.bannerChk=="checked") $("input:checkbox[id='signChkBanner']").prop("checked", true);
				if(data.romanChk=="checked") $("input:checkbox[id='signChkRoman']").prop("checked", true);
				if(data.museChk=="checked") $("input:checkbox[id='signChkMuse']").prop("checked", true);
				if(data.storeChk=="checked") $("input:checkbox[id='signChkStore']").prop("checked", true);

				//게시판 관리 권한관리
				if((data.noticeChk=="checked") && (data.alimChk=="checked")&& (data.newsChk=="checked")) {
					$("input:checkbox[id='signChkBoard']").prop("checked", true);
					sum++;
				}
				if(data.noticeChk=="checked") $("input:checkbox[id='signChkNotice']").prop("checked", true);
				if(data.alimChk=="checked") $("input:checkbox[id='signChkAlim']").prop("checked", true);
				if(data.newsChk=="checked") $("input:checkbox[id='signChkNews']").prop("checked", true);

				//채용 관리 권한관리
				if((data.recruitChk=="checked") && (data.faqChk=="checked")) {
					$("input:checkbox[id='signChkRecruitment']").prop("checked", true);
					sum++;
				}
				if(data.recruitChk=="checked") $("input:checkbox[id='signChkRecruit']").prop("checked", true);
				if(data.faqChk=="checked") $("input:checkbox[id='signChkFaq']").prop("checked", true);

				//전체 checkbox checked
				if(sum==4) $("input:checkbox[id='signChkAll']").prop("checked", true);

				$('#signName').focus();
            }
        });

        return false;
    });
    
  //#### 팝업창에서 아이디 중복검사
  $('.layerPopup.memberReg a.idcheck').click(function () {
    	
    	var f = document.processForm;
    	var url = "/jtadm/manager/idCheck?id=" + f.adm_id.value;
		$.ajax({
			
	        type : "GET",
            url : url,
            dataType : "json",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data)
            {
            	if(data>0) {
                	alert('아이디가 이미 등록 되어 있습니다.');
                	f.adm_idKey.value='';
                	f.adm_id.value='';
                	f.adm_id.focus();
            	}else { 
                	alert('아이디 등록이 가능해요');
                	f.adm_idKey.value='checked';
            	}	
            }
        });
        return false;
    });	    	
    
    //팝업닫기
    $('.layerPopup.memberReg .close , .layerPopup.memberReg a.cancle').click(function () {
        $('.layerPopup.memberReg').hide();
        $('.authAllCheck input').prop('checked', false);
        $('.authAllCheck input').removeAttr('checked', '');
        $('.checkBox.solo.partAll input').prop('checked', false);
        $('.checkBox.solo.partAll input').removeAttr('checked', '');
        $('.checkBox.solo.each input').prop('checked', false);
        $('.checkBox.solo.each input').removeAttr('checked', '');

        $('#signRegdate').val(''); 
		$('#signId').html('');
		$('#signUpdateID').val('');
		$('#signHp').val('');
		$('#signName').val('');
		$('#signDepartment').val('');
		$('#signChkManager').prop('checked', false);
		$('#inputName3').html("");
		
        return false;
    });
    
    memberRegPopupDataSize();
    
    $(window).resize(function () {
        memberRegPopupDataSize();
        memberRegPopupSize();
        authorityTableFun();
        authorityCellBodySize();
    });
    
    
    //권한관리(전체선택)
    $('.memberReg .authAllCheck input').change(function () {
        if (this.checked) {
            $('.checkBox.solo.each input').prop('checked', true);
            $('.checkBox.solo.each input').attr('checked', 'checked');
            $('.checkBox.solo.partAll input').prop('checked', true);
            $('.checkBox.solo.partAll input').attr('checked', 'checked');
        } else {
            $('.checkBox.solo.each input').prop('checked', false);
            $('.checkBox.solo.each input').removeAttr('checked', '');
            $('.checkBox.solo.partAll input').prop('checked', false);
            $('.checkBox.solo.partAll input').removeAttr('checked', '');
        }
    });
    
        
    //권한관리(대메뉴전체)
    $('.memberReg .checkBox.partAll input').change(function () {
        var objAttrName = $(this).attr('name');	//partAll 이름값 받아온다.
        var partAllCheckBoxEA = $('.checkBox.partAll').length
        var partAllCheckedEA = $('.checkBox.partAll input:checked').length
        
        if (partAllCheckBoxEA == partAllCheckedEA) {
            $('.memberReg .authAllCheck input').prop('checked', true);
            $('.memberReg .authAllCheck input').attr('checked', 'checked');
        } else {
            $('.memberReg .authAllCheck input').prop('checked', false);
            $('.memberReg .authAllCheck input').removeAttr('checked', '');
        }
        if (this.checked) {
            $('.checkBox.each input[name="' + objAttrName + '"]').prop('checked', true);
            $('.checkBox.each input[name="' + objAttrName + '"]').attr('checked', 'checked');
        } else {
            $('.checkBox.each input[name="' + objAttrName + '"]').prop('checked', false);
            $('.checkBox.each input[name="' + objAttrName + '"]').removeAttr('checked', '');
        }
    });
    
    
    
    //권한관리(개별)
    $('.memberReg .checkBox.each input').change(function () {
        var eachCheckBoxEA = $('.checkBox.each').length
        var eachCheckedEA = $('.checkBox.each input:checked').length
        var objAttrName = $(this).attr('name')
        var thisCheckBoxEA = $('.checkBox.each input[name="' + objAttrName + '"]').length
        var thisCheckedEA = $('.checkBox.each input[name="' + objAttrName + '"]:checked').length
        if (thisCheckBoxEA == thisCheckedEA) {
            $('.checkBox.partAll input[name="' + objAttrName + '"]').prop('checked', true);
            $('.checkBox.partAll input[name="' + objAttrName + '"]').attr('checked', 'checked');
        } else {
            $('.checkBox.partAll input[name="' + objAttrName + '"]').prop('checked', false);
            $('.checkBox.partAll input[name="' + objAttrName + '"]').removeAttr('checked', '');
        }
        if (eachCheckBoxEA == eachCheckedEA) {
            $('.memberReg .authAllCheck input').prop('checked', true);
            $('.memberReg .authAllCheck input').attr('checked', 'checked');
        } else {
            $('.memberReg .authAllCheck input').prop('checked', false);
            $('.memberReg .authAllCheck input').removeAttr('checked', '');
        }
    });
});
</script>

</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/adm/jtcommon/headerAndMenu.jsp" %>
        <div id="container" class="adminMgmt">
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
<input type="hidden" name="cpage" value="1" />          
                    <select class="select" name="key">
                        <option value="all" <c:if test="${page.key eq 'all'}">selected</c:if>>전체</option>
                        <option value="adm_name" <c:if test="${page.key eq 'adm_name'}">selected</c:if>>이름</option>
                        <option value="adm_id" <c:if test="${page.key eq 'adm_id'}">selected</c:if>>계정</option>
                        <option value="department" <c:if test="${page.key eq 'department'}">selected</c:if>>부서명</option>
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
							<option value="25" <c:if test="${page.pg_rows eq '25'}">selected</c:if>>25개씩</option>
                        </select>
                        <a href="#" class="commBtn black reg">회원등록</a>
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
                                <col width="15%">
                                <col width="15%">
                                <col width="*">
                                <col width="15%">
                                <col width="200">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>부서명</th>
                                    <th>담당자</th>
                                    <th>계정</th>
                                    <th>연락처</th>
                                    <th>등록일(${fn:length(list)})</th>
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
                                    <td>${page.total_rows - page.pg_start - status.count + 1}</td>
                                    <td>${list.department}</td>
                                    <td><a href="#" data-id="${list.adm_id}" >${list.adm_name}</a></td>
                                    <td><a href="#" data-id="${list.adm_id}">${list.adm_id}</a></td>
                                    <td>${list.hp}</td>
                                    <td>${fn:substring(list.regdate,0,10)}</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!--//Cell Body-->
                    <!--Paging-->
                    <div class="paging">
                        ${paging}       
                        <!-- 
                        <a href="#" class="first" title="첫페이지">첫페이지</a>
                        <a href="#" class="prev" title="이전페이지">이전페이지</a>
                        <ul>
                            <li><span class="now">1</span></li>
                            <li><a href="#">2</a></li>
                        </ul>
                        <a href="#" class="next" title="다음페이지">다음페이지</a>
                        <a href="#" class="last" title="마지막페이지">마지막페이지</a>
                         -->
                    </div>
                    <!--//Paging-->
                </article>
                <!--//목록-->
            </section>
            <!--//데이터-->
            
<form name="processForm" id="processForm" method="post"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="processKey" id="processKey" >
<input type="hidden" name="updateID" id="signUpdateID" > 
<input type="hidden" name="adm_idKey" > 
<input type="hidden" name="cpage" value="${search.cpage}" />
<input type="hidden" name="pg_rows" value="${search.pg_rows}" />
<input type="hidden" name="key" value="${search.key}" />
<input type="hidden" name="keyword" value="${search.keyword}" />
<input type="hidden" name="total_rows" value="${search.total_rows}" />

            <!--회원등록/수정(팝업)-->
            <div class="layerPopup memberReg">
                <div class="popData">
                    <h5><span class="text">회원 정보등록</span><span class="close"><img src="../images/admin/icon_popup_close.svg"/></span></h5>
                    <article class="hasLeftTH">
                        <table>
                            <colgroup>
                                <col width="214"/>
                                <col width="*"/>
                                <col width="214"/>
                                <col width="*"/>
                            </colgroup>
                            <tr>
                                <th>등록일 </th>
                                <td>
                                    <div class="datepicker oneDay">
                                        <input name="regdate" id="signRegdate" type="text" class="selectDate" onKeyup="directDate(this);" placeholder="등록일 yyyy-mm-dd"/>
                                    </div>
                                </td>
                                <th>부서명 <span class="colorRed">*</span></th>
                                <td><input name="department" type="text" id="signDepartment" class="enterText" placeholder="부서명"/></td>
                            </tr>
                            <tr>
                                <th>담당자 <span class="colorRed">*</span></th>
                                <td><input name="adm_name" id="signName" type="text" class="enterText" placeholder="담당자"/></td>
                                <th>담당자 연락처</th>
                                <td><input name="hp" id="signHp" type="text" class="enterText" placeholder="담당자 연락처"/></td>
                            </tr>
                            <!--등록-->
                            <tr class="memIDReg">
                                <th>아이디<span class="colorRed">*</span></th>
                                <td colspan="3"> 
                                    <input name="adm_id" id="signAdmID" type="text" class="enterText" placeholder="아이디"/>
                                    <a href="#" class="commBtn white idcheck">중복확인</a>
                                </td>
                            </tr>
                            <tr class="password">
                                <th>비밀번호 <span class="colorRed">*</span></th>
                                <td colspan="3">
                                    <input name="adm_pw" type="password" class="enterText" placeholder="비밀번호"/>
                                    <ul>
                                        <li>- 10~15자의 영문소문자와 대문자, 숫자, 특수문자를 혼용하여 사용 가능합니다.</li>
                                        <li>- 특수문자는 ‘~’, ‘!’, ‘@’, ‘#’, ‘$’, ‘*’, ‘(’, ‘)’, ‘=’, ‘_’, ‘.’, ‘|’ 만 사용 가능합니다. 영문소문자와 대문자, 숫자,특수문자 중 2가지 이상 문자 조합하여 사용하시기 바랍니다.</li>
                                    </ul>
                                </td>
                            </tr>
                            <!--//등록-->
                            <!--수정-->
                            <tr class="memID">
                                <th>아이디 <span class="colorRed">*</span></th>
                                <td colspan="3"><span id="signId"></span></td>
                            </tr>
                            <tr class="passwordChg">
                                <th>비밀번호 변경 <span class="colorRed">*</span></th>
                                <td colspan="3">
                                    <input name="adm_pw1" id="signPW1" type="password" class="enterText" placeholder="변경할 비밀번호"/>
                                    <input name="adm_pw2" id="signPW2" type="password" class="enterText" placeholder="변경할 비밀번호 확인"/>
                                    <ul>
                                        <li>- 10~15자의 영문소문자와 대문자, 숫자, 특수문자를 혼용하여 사용 가능합니다.</li>
                                        <li>- 특수문자는 ‘~’, ‘!’, ‘@’, ‘#’, ‘$’, ‘*’, ‘(’, ‘)’, ‘=’, ‘_’, ‘.’, ‘|’ 만 사용 가능합니다. 영문소문자와 대문자, 숫자,특수문자 중 2가지 이상 문자 조합하여 사용하시기 바랍니다.</li>
                                    </ul>
                                </td>
                            </tr>
                            <!--//수정-->
                        </table>
                    </article>
                    <h5>권한관리</h5>
                    <div class="tb">
                        <!--Cell Header-->
                        <div class="cellHeader">
                            <table>
                                <colgroup>
                                    <col width="220">
                                    <col width="*">
                                    <col width="140">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>대 메뉴</th>
                                        <th>중 메뉴</th>
                                        <th>권한관리 선택</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <!--//Cell Header-->
                        <!--Cell Body-->
                        <div class="cellBody">
                            <table>
                                <colgroup>
                                    <col width="220">
                                    <col width="*">
                                    <col width="140">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td class="th" >관리자관리</td>
                                        <td>관리자관리 (모든 권한을 가집니다.)</td>
                                        <td>
                                            <div class="checkBox solo">
                                                <input type="checkbox" id="signChkManager"  name="ChkManager" value="manager"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>전체</td>
                                        <td>
                                            <div class="checkBox solo authAllCheck">
                                                <input type="checkbox" id="signChkAll"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="th" rowspan="4">기본설정</td>
                                        <td>전체</td>
                                        <td>
                                            <div class="checkBox solo partAll">
                                                <input type="checkbox" name="basicMgmt" value="" id="signChkBasic"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>메인 배너 관리</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="basicMgmt" value="Mbanner" id="signChkMbanner"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>메인 브랜드 관리</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="basicMgmt" value="MBbanner" id="signChkMBbanner"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>팝업 관리</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="basicMgmt" value="Mpopup" id="signChkMpopup"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="th" rowspan="5">브랜드 관리</td>
                                        <td>전체</td>
                                        <td>
                                            <div class="checkBox solo partAll">
                                                <input type="checkbox" name="brandMgmt" value="" id="signChkBrand"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>브랜드 배너 관리</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="brandMgmt" value="banner" id="signChkBanner"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>로만손 제품 관리</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="brandMgmt" value="roman" id="signChkRoman"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>뮤즈 관리</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="brandMgmt" value="muse" id="signChkMuse"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>매장 관리</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="brandMgmt" value="store" id="signChkStore"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="th" rowspan="4">게시판 관리</td>
                                        <td>전체</td>
                                        <td>
                                            <div class="checkBox solo partAll">
                                                <input type="checkbox" name="brdrMgmt" value="" id="signChkBoard"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>공고</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="brdrMgmt" value="notice" id="signChkNotice"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>공지사항</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="brdrMgmt" value="alim" id="signChkAlim"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>뉴스</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox" name="brdrMgmt" value="news" id="signChkNews"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="th" rowspan="3">채용</td>
                                        <td>전체</td>
                                        <td>
                                            <div class="checkBox solo partAll">
                                                <input type="checkbox" name="recruitMgmt" value="" id="signChkRecruitment"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>채용공고</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox"name="recruitMgmt" value="recruit" id="signChkRecruit"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>FAQ</td>
                                        <td>
                                            <div class="checkBox solo each">
                                                <input type="checkbox"name="recruitMgmt" value="faq" id="signChkFaq"/>
                                                <i>&nbsp;</i>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--//Cell Body-->
                    </div>
                    <div class="button">
                        
                        <a href="#" class="commBtn black save" onclick="Jt_submit()"><span id="inputName1">등록</span></a>
                        <a href="#" class="commBtn white cancle"><span id="inputName2">목록</span></a>
                        <span id="inputName3"></span>
                    </div>
                </div>
            </div>
            <!--//회원등록/수정(팝업)-->
 </form> 
  
        </div>
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/html.footer.jsp" %>  
   
    </div>
</body>
</html>



<script>
//페이징 이동
function goPage(cpage){
	var f = document.searchForm;
	f.cpage.value = cpage;
	f.action = "memberList";
	f.submit();
}
//뿌려지는 목록 갯수
function goRrows(obj) {
	var f = document.searchForm;
	f.pg_rows.value = $(obj).val();
	f.action = "memberList";
	f.submit();
}
//값이 비어 있는지 체크
function isBlank(input) {
	
	if((input.value =="") ||(input.value ==null)) {
		return true;
	}
	return false;
}  

//아이디,비밀번호 정규표현식 check => 에러체크 필요
function regExpChk(input) {

	var i=0;
	var checkID = input.value;

	if(checkID.search(/[!~@#$*|()=_.]/g) >= 0) i++;
	if(checkID.search(/[0-9]/g) >= 0) i++;
	if(checkID.search(/[a-zA-Z]/ig) >= 0) i++;

	if(i<2) {
		return false;
	}
	return true;
}  


//#####################################################
//수정,등록 Proc
function Jt_submit() { 
	var f = document.processForm;
	
	if(isBlank(f.department)) {
		alert( "부서명을 입력해주세요");
		f.department.focus();
		return;
	}	
	if(isBlank(f.adm_name)) {
		alert( "담당자를 입력해주세요");
		f.adm_name.focus();
		return;
	}
	//회원 수정
	if(f.processKey.value=="update") {

		if(!isBlank(f.adm_pw1) || !isBlank(f.adm_pw2)) { //하나라도 입력값이 있으면 
			if(f.adm_pw1.value != f.adm_pw2.value) {
				alert("입력한 비밀번호가 일치하지 않습니다.\n다시입력해주세요.");
				return;
			}
		}	

		if(!isBlank(f.adm_pw1) && !isBlank(f.adm_pw2)) { //둘다 입력값이 있을때

			/*
			//비밀번호 길이 check
			if(f.adm_pw1.value.length<10 || f.adm_pw1.value.length>15) {
				alert("비밀번호는 10~15자로 입력해주세요.");
				return;
			}
			//비밀번호 정규표현식 check
			if(!regExpChk(f.adm_pw1)) {
				alert("비밀번호 : 올바른 형식이 아닙니다."); //영문소문자와 대문자, 숫자,특수문자 중 2가지 이상 문자 조합하여 사용하시기 바랍니다.
				return;
			}
			*/
		}
	//회원 등록
	}else{

		//아이디 체크
		if(isBlank(f.adm_id)) {
			alert( "아이디를 입력해 주세요");
			f.adm_id.focus();
			return;
		}
		//중복확인 여부체크
		if(isBlank(f.adm_idKey)) {
			alert( "중복확인을 해주세요.");
			return;
		}
		/*
		//아이디 정규표현식 check
		if(!regExpChk(f.adm_id)) {
			alert("아이디 : 올바른 형식이 아닙니다."); //영문소문자와 대문자, 숫자,특수문자 중 2가지 이상 문자 조합하여 사용하시기 바랍니다.
			return;
		}
		//아이디 길이 check
		if(f.adm_id.value.length<10 || f.adm_id.value.length>15) {
			alert("아이디는 10~15자로 입력해주세요.");
			return;
		}
		//비밀번호 체크
		if(isBlank(f.adm_pw)) {
			alert( "비밀번호를 입력해주세요");
			f.adm_pw.focus();
			return;
		}	
		//비밀번호 정규표현식 check
		if(!regExpChk(f.adm_pw)) {
			alert("비밀번호 : 올바른 형식이 아닙니다."); //영문소문자와 대문자, 숫자,특수문자 중 2가지 이상 문자 조합하여 사용하시기 바랍니다.
			return;
		}
		//비밀번호 길이 check
		if(f.adm_pw.value.length<10 || f.adm_pw.value.length>15) {
			alert("비밀번호는 10~15자로 입력해주세요.");
			return;
		}
		*/

		f.cpage.value = 1;
		f.key.value = "";
		f.keyword.value = "";
		f.pg_rows.value = 10;
	}
	

	f.action = "memberProc";
	f.submit();
}
//회원삭제
function Jt_delete(){

	var f = document.processForm;

	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		f.action = "memberDel";
		f.submit();
	}
}
//#####################################################
</script>


