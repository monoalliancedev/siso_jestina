<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
function myDataCheck(f){

	//idCheck();

	var f = dataForm; 

	if (f.pop_pw.value != f.pop_pw_comfirm.value){
		alert("비밀번호를 확인해주세요.");
		f.pop_pw_comfirm.focus();
		return false;
	}

	var url = "/jtadm/manager/myPageProc";
	var params = $("#dataForm").serialize(); 
	$.ajax({
		type: "POST",
		data:params,
		url:url,
		dataType:"json",
		success:function(data){			
			if(data.rs == "Y"){
				alert("정상적으로 수정되었습니다.");
				document.location.reload();
			}else if(data.rs == "C"){
				alert("비밀번호가 서로 다릅니다. 확인해주세요."); 
			}else{
				alert("정보수정중 오류가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다.");
			}
		},
		error:function(xhr, status, errorThrown){
		}
	});

	return false;
}

//회원정보변경 폼
function jt_topMemEdit() {

	$('.layerPopup.infoChange').fadeIn();
    var popupSizeWD = $('.infoChange .popData').outerWidth();
    var popupSizeHT = $('.infoChange .popData').outerHeight();
    $('.infoChange .popData').css({
        'margin-left': - popupSizeWD / 2,
        'margin-top': - popupSizeHT / 2
    })
    var params = $("#dataForm").serialize();

    $.ajax({
		type: "GET",
		data:params,
		url:"/jtadm/manager/myPageView",
		dataType:"json",
		success:function(data){			
			if(data){
				$('#topDepartment').val(data.department);
				$('#topHp').val(data.hp);
			}else{
				alert("정보수정중 오류가 발생하였습니다. 잠시 후 다시 시도해주시기 바랍니다.");
			}
		},
		error:function(xhr, status, errorThrown){
		}
	});
    return false;
}

function top_close() {
	$('.layerPopup.infoChange').fadeOut();
	return false;
}

function headerDeleteHtml(htmlTxt)
{
	htmlTxt = htmlTxt.replace(/<img/ig, "img"); // <img 를 img로 변경 //이미지만 제외
	htmlTxt = htmlTxt.replace(/(<([^>]+)>)/ig,"");
    htmlTxt = htmlTxt.replace(/&nbsp;/gi,"");//공백제거
    htmlTxt = htmlTxt.replace(/ /gi,"");//공백제거
    //alert("내용 :#####" + htmlTxt +"######");
    //alert("길이 : " + htmlTxt.length);
    return  htmlTxt;
}
</script>		
<!--Header-->
        <header>
            <div class="ctrl"><a href="#"><img src="/jtadm/images/admin/icon_menu_ctrl.svg"/></a></div>
            <div class="cntn">
                <h1 class="logo"><a href="/jtadm/"><img src="/jtadm/images/admin/logo_s.svg"/></a></h1>
                <ul class="location"></ul>
                <ul class="util">
                    <li><i><img src="/jtadm/images/admin/icon_person_white.svg"/></i><span>${authAdm.adm_name}</span>님</li>
                    <li><a href="#" onclick="jt_topMemEdit()">회원정보변경</a></li>
                    <li><a href="/jtadm/logout" class="logOut"><img src="/jtadm/images/admin/icon_logout.svg.png"/></a></li>
                </ul>
            </div>
            <!--회원정보변경-->

 
            <div class="layerPopup infoChange">
                <div class="popData">
<form name="dataForm" id="dataForm" method="get">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" name="act" value="edit">
<input type="hidden" name="admId" value="${authAdm.adm_id}">
                    <h5>회원 정보 변경<span class="close"><a href="#" onclick="top_close()"><img src="/jtadm/images/admin/icon_popup_close.svg"/></a></span></h5>
                    <div class="tb">
                        <table>
                            <colgroup>
                                <col width="215">
                                <col width="*">
                            </colgroup>
                            <tr>
                                <th>부서명<span class="colorRed">*</span></th>
                                <td><input type="text" name="department" id="topDepartment" class="enterText" placeholder="부서명 입력"/></td>
                            </tr>
                            <tr>
                                <th>연락처<span class="colorRed">*</span></th>
                                <td><input type="text" name="hp" id="topHp" class="enterText" placeholder="연락처 입력"/></td>
                            </tr>
                            <tr>
                                <th>담당자</th>
                                <td>${authAdm.adm_name}</td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td>${authAdm.adm_id}</td>
                            </tr>
                            <tr>
                                <th>비밀번호 변경<span class="colorRed">*</span></th>
                                <td>
                                    <ul>
                                        <li><input type="password" class="enterText" placeholder="변경할 비밀번호" name="pop_pw" /></li>
                                        <li><input type="password" class="enterText" placeholder="변경할 비밀번호 확인" name="pop_pw_comfirm" /></li>
                                        <li class="text">- 10~15자의 영문소문자와 대문자, 숫자, 특수문자를<br/> 혼용하여 사용 가능합니다.</li>
                                        <li class="text">- 특수문자는 ‘~’, ‘!’, ‘@’, ‘#’, ‘$’, ‘*’, ‘(’, ‘)’, ‘=’, ‘_’, ‘.’, ‘|’ 만 사용 가능합니다.영문소문자와 대문자, 숫자,특수문자 중2가지 이상 문자 조합하여 사용하시기 바랍니다.</li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="button">
                        <a href="#" onclick="top_close()" class="commBtn white cancle">취소</a>
                        <a href="javascript:myDataCheck(this)" class="commBtn black save">저장</a>
                    </div>
</form>
                </div>
            </div>

            
            <!--//회원정보변경-->
        </header>
        <!--//Header-->
        <!--Menu-->
        <nav>
            <ul class="depth1">
                <li class="dep1-1"><a href=".dep2-1"><span>기본설정</span></a></li>
                <li class="dep1-2"><a href=".dep2-2"><span>브랜드관리</span></a></li>
                <li class="dep1-3"><a href=".dep2-3"><span>게시판관리</span></a></li>
                <li class="dep1-4"><a href=".dep2-4"><span>채용</span></a></li>
                <li class="dep1-5"><a href=".dep2-5"><span>관리자관리</span></a></li>
            </ul>
            <div class="depth2">
                <!--기본설정 하위-->
                <dl class="dep2-1">
                    <dt><img src="/jtadm/images/admin/icon_menu_01_dep2.svg"/>기본설정</dt>
                    <dd>
                        <a href="/jtadm/basic/Mbanner/list">메인 배너관리</a>
                        <a href="/jtadm/basic/MBbanner/mainBrandBanner">메인브랜드 배너관리</a>
                        <a href="/jtadm/basic/Mpopup/list">팝업관리</a>
                    </dd>
                </dl>
                <!--//기본설정 하위-->
                <!--브랜드배너관리-->
                <dl class="dep2-2">
                    <dt><img src="/jtadm/images/admin/icon_menu_02_dep2.svg"/>브랜드관리</dt>
                    <dd>
                        <a href="#" class="hasDepth">브랜드 배너관리</a>
                        <div class="depth3 dep3-1">
                            <a href="/jtadm/brand/banner/listKR"><span>KR</span></a>
                            <a href="/jtadm/brand/banner/listEN"><span>EN</span></a>
                            <a href="/jtadm/brand/banner/listCN"><span>CN</span></a>
                        </div>
                        <a href="#" class="hasDepth">로만손 제품 관리</a>
                        <div class="depth3 dep3-2">
                            <a href="/jtadm/brand/romason/romasonCate"><span>카테고리 관리</span></a>
                            <a href="/jtadm/brand/romason/romasonPro"><span>제품관리</span></a>
                        </div>
                        <a href="/jtadm/brand/muse/list">뮤즈관리</a>
                        <a href="#" class="hasDepth">매장관리</a>
                        <div class="depth3 dep3-3">
                            <a href="/jtadm/brand/store/listDomestic"><span>국내</span></a>
                            <a href="/jtadm/brand/store/listOverseas"><span>해외</span></a>
                        </div>
                    </dd>
                </dl>
                <!--//브랜드배너관리-->
                <!--게시판관리-->
                <dl class="dep2-3">
                    <dt><img src="/jtadm/images/admin/icon_menu_01_dep2.svg"/>게시판관리</dt>
                    <dd>
                         <a href="/jtadm/board/notice/list">공고</a>
                        <a href="/jtadm/board/alim/list">공지사항</a>
                        <a href="/jtadm/board/news/list">뉴스</a>
                    </dd>
                </dl>
                <!--//게시판관리-->
                <!--채용-->
                <dl class="dep2-4">
                    <dt><img src="/jtadm/images/admin/icon_menu_01_dep2.svg"/>채용</dt>
                    <dd>
                        <a href="/jtadm/recruitment/recruit/recruitList">채용공고</a>
                        <a href="/jtadm/recruitment/faq/faqList">FAQ</a>
                    </dd>
                </dl>
                <!--//채용-->
                <!--관리자관리-->
                <dl class="dep2-5">
                    <dt><img src="/jtadm/images/admin/icon_menu_01_dep2.svg"/>관리자관리</dt>
                    <dd>
                        <a href="/jtadm/manager/memberList">회원관리</a>
                    </dd>
                </dl>
                <!--//관리자관리-->
            </div>
        </nav>
        <!--//Menu-->
        
        
        
        


