<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/adm/jtcommon/html.head.jsp" %>  
<script type="text/javascript">
$(document).ready(function(){
	//모집기간
    $('.deadline label').click(function(){
	    if($(this).parent('div.deadline').find('input[type="checkbox"]').is(':checked') == false){
	    	$(this).parent('div.deadline').prev('.termDate').find('input.end').val('')
	    	$(this).parent('div.deadline').prev('.termDate').find('input.end').attr("disabled", true); //비활성화
	    	//$(this).parent('div.deadline').prev('.termDate').find('input.end').val('마감 시까지')
		}else{
			$(this).parent('div.deadline').prev('.termDate').find('input.end').val('')
	    	$(this).parent('div.deadline').prev('.termDate').find('input.end').attr("disabled", false); //활성화
		}
	});
	$('.termDate input.end').change(function(){
		$(this).parents('div.termDate').next('.deadline').find('input[type="checkbox"]').removeAttr('checked','checked')
	})
});
//값이 비어 있는지 체크
function isBlank(input) {
	
	if((input.value =="") ||(input.value ==null)) {
		return true;
	}
	return false;
}  
function deleteHtml(htmlTxt)
{
	htmlTxt = htmlTxt.replace(/<img/ig, "img"); // <img 를 img로 변경 //이미지만 제외
	htmlTxt = htmlTxt.replace(/(<([^>]+)>)/ig,"");
    htmlTxt = htmlTxt.replace(/&nbsp;/gi,"");//공백제거
	return  htmlTxt;
}
//게시여부 체크후에 폼전송한다. 
function Jt_submit(){
	$.ajax({ //게시여부Y가 2개 이상인지 확인
        type : "GET",
        url : "IsntYCount",
        dataType : "json",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){
			var isntYnKey = true;
			if($('input[name=isntYn]:checked').val()=="N") {
				if(data<1){ //Y값이 하나도 없을때
					isntYnKey = false;
    			}if(data==1){ //Y값 하나가 내것이면서 수정일때
					<c:if test="${(recruit.isntYn eq 'Y') && (recruit.seq>0)}">
						isntYnKey = false;
					</c:if>
	    		}
			}
			if(isntYnKey) {
		    	Jt_submit2();
			}else{
				alert("채용공고 게시글은 1개 이상 등록되어야 합니다.");
			} 
		}
    });
    return false;
}
//수정,등록 Proc
function Jt_submit2() { 
	var f = document.processForm;
	dataCheck(); // 에디터의 내용이 textarea에 적용됩니다.
	
	if(isBlank(f.jobField)) {
		alert( "모집부분을 입력해주세요.");
		f.jobField.focus();
		return;
	}	
	if(isBlank(f.careerIsnt)) {
		alert( "채용구분을 설정해주세요.");
		f.careerIsnt.focus();
		return;
	}
	if(isBlank(f.business)) {
		alert( "사업부분을 입력해주세요.");
		f.business.focus();
		return;
	}
	if(isBlank(f.recruitFromDate)) {
		alert( "모집기간을 설정해주세요.");
		f.recruitFromDate.focus();
		return;
	}
	if(isBlank(f.recruitToDate) && !f.recruitEnd.checked) {
		alert( "모집기간을 설정해주세요.");
		f.recruitToDate.focus();
		return;
	}
	if(isBlank(f.managerEmail1) && isBlank(f.managerEmail2)) {
		alert( "이메일을 1개 이상 입력해 주세요.");
		f.managerEmail1.focus();
		return;
	}
	//이메일 정규식 체크
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(!isBlank(f.managerEmail1)) {
		if(!reg_email.test(f.managerEmail1.value)) {
			alert("이메일 형식에 맞지 않습니다.");
			f.managerEmail1.focus();
			return;	     
		}	
	}
	if(!isBlank(f.managerEmail2)) {
		if(!reg_email.test(f.managerEmail2.value)) {
			alert("이메일 형식에 맞지 않습니다.");
			f.managerEmail2.focus();
			return;	     
		}
	}
	//내용있는지 체크
	newText = headerDeleteHtml(document.getElementById("ir1").value)
	if(newText.length<=0) {
		alert( "내용을 입력해주세요.");
		return;
	}	
	
	f.action = "recruitProc${processKey}";
	f.submit();
}  
//채용공고 삭제 
function Jt_delete(seq){
	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		var f = document.processForm;
		f.cpage.value = 1;
		f.action="recruitDel";
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
<input type="hidden" name="seq" value="${recruit.seq}"/>
<input type="hidden" name="cpage" value="${search.cpage}" />
<input type="hidden" name="pg_rows" value="${search.pg_rows}" />
<input type="hidden" name="keyIsnt" value="${search.keyIsnt}" />
<input type="hidden" name="key" value="${search.key}" />
<input type="hidden" name="keyword" value="${search.keyword}" />
<input type="hidden" name="total_rows" value="${search.total_rows}" />


		<div id="container" class="recruitMgmt recruitReg">
            <!--상단-->
            <section class="topSubCntn">
                
                <c:if test="${processKey eq 'Insert'}">
                <div class="infoText">
                    <h3>채용공고 등록</h3>
                </div>
                <a href="#" onclick="Jt_submit()" class="commBtn black">등록</a>
                </c:if>
                
                <c:if test="${processKey eq 'Update'}">
                <div class="infoText">
                    <h3>채용공고 수정</h3>
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
                            <th>등록일</th>
                            <td>
                                <div class="datepicker oneDay">
                                    <input name="regdate" value="${recruit.regdate}" type="text" class="selectDate" onKeyup="directDate(this);" placeholder="등록일 yyyy-mm-dd"/>
                                </div>
                            </td>
                            <th>게시여부</th>
                            <td>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="Y" id="openY" <c:if test="${recruit.isntYn eq 'Y'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="openY">Y</label>
                                </div>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="N" id="openN" <c:if test="${recruit.isntYn eq 'N'}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="openN">N</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>모집부문 <span class="colorRed">*</span></th>
                            <td colspan="3"><input type="text" name="jobField" value="${recruit.jobField}" class="enterText" placeholder="모집부문을 입력해주세요."/></td>
                        </tr>
                        <tr>
                            <th>채용구분 <span class="colorRed">*</span></th>
                            <td>
                                <select name="careerIsnt" class="select w100">
                                    <option value="">채용구분</option>
                                    <option value="N" <c:if test="${recruit.careerIsnt eq 'N'}">selected</c:if>>신입</option>
                                    <option value="Y" <c:if test="${recruit.careerIsnt eq 'Y'}">selected</c:if>>경력</option>
                                </select>
                            </td>
                                <th>사업부문 <span class="colorRed">*</span></th>
                            <td><input type="text" name="business" value="${recruit.business}" class="enterText" placeholder="사업부문"/></td>
                        </tr>
                        <tr>
                            <th>모집기간 <span class="colorRed">*</span></th>
                            <td colspan="3">
                                <div class="termDate">
                                    <div class="datepicker startDate">
                                        <input type="text" name="recruitFromDate" value="${recruit.recruitFromDate}" class="selectDate start" onKeyup="directDate(this);" placeholder="게시기간 yyyy-mm-dd"/>
                                    </div>
                                    <span class="mark">~</span>
                                    <div class="datepicker endDate">
                                        <input type="text" name="recruitToDate" id="recruitToDate" value="${recruit.recruitToDate}" class="selectDate end" onKeyup="directDate(this);" placeholder="게시기간 yyyy-mm-dd"/>
                                    </div>
                                </div>
                                <div class="checkBox hasLabel deadline">
                                    <input type="checkbox" name="recruitEnd" value="checked" id="deadline" <c:if test="${recruit.recruitEnd eq 'checked'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="deadline">마감 시까지</label>
                                    <c:if test="${recruit.recruitEnd eq 'checked'}">
									<script>
									$('#recruitToDate').val('')
									$('#recruitToDate').attr("disabled", true); //마감 체크시 비활성화
									</script>						
									</c:if>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>채용담당자 이메일 <span class="colorRed">*</span><br/><span class="s_text">(이메일 1개 이상 등록 필수) </span></th>
                            <td colspan="3" class="email">
                                <input type="text" name="managerEmail1" value="${recruit.managerEmail1}" class="enterText" placeholder="채용담당자 이메일를 입력해주세요."/>
                                <input type="text" name="managerEmail2" value="${recruit.managerEmail2}" class="enterText" placeholder="채용담당자 이메일를 입력해주세요."/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" class="editor">
                            <textarea name="contents" id="ir1" rows="10" cols="100" style="width:90%; height:200px; display:none;">${recruit.contents}</textarea>
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


<script type="text/javascript" src="/editor/SE/js/HuskyEZCreator.js" charset="utf-8"></script>
<script language="javascript">
var oEditors = [];
$(document).ready(function(){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: "/editor/SE/SmartEditor2Skin.html",
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//oEditors.getById["ir1"].exec("PASTE_HTML", [$("#ir1").val()]);
		},
		fCreator: "createSEditor2"
	});

});

function dataCheck(f){
	//theForm.compay_desc1.value = SubmitHTML();
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	return true;
}
</script>





