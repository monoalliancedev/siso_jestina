<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %>
<script type="text/javascript">
//화일 확장자 체크
function fileExtCheck(file) {
	let fileVal = file.value;

	var lastDot = fileVal.lastIndexOf('.');
	var fileLength = fileVal.length;
	var fileType = fileVal.substring(lastDot+1, fileLength).toLowerCase(); //소문자로 변경

	// 확장자 체크
    if($.inArray(fileType, ['doc','docx','xlsx','xls','ppt','pptx','pdf']) == -1) {
    	alert('워드,엑셀,PPT,PDF 파일만 첨부 가능합니다.');
    	file.value="";
    	return;
    }
}
//값이 비어 있는지 체크
function isBlank(input) {
	
	if((input.value =="") ||(input.value ==null)) {
		return true;
	}
	return false;
}  
function deleteHtml(htmlTxt)
{
	//이미지만 제외하고 
	htmlTxt =  htmlTxt.replace(/<img/ig, "img"); // <img 를 img로 변경
    // HTML 태그제거 정규표현식 사용
    htmlTxt =  htmlTxt.replace(/<(\/)?([a-zA-Z0-9]*)(\s[a-zA-Z0-9]*=[^>]*)?(\s)*(\/)?>/ig, "");
   	return  htmlTxt;
}
//폼전송
function Jt_submit() { 
	var f = document.processForm;

	/*
	if($("input:checkbox[id=terms1]").is(":checked")==false) {
		alert("개인정보의 수집및 이용에 동의해주세요.");
		$('#terms1').focus();
		return false;
	} 

	if($("input:checkbox[id=terms2]").is(":checked")==false) {
		alert("인재채용을 위한 인재풀 등록에 동의해주세요.");
		$('#terms2').focus();
		return false;
	}

	if(isBlank(f.recruit)) {
		alert( "모집부분을 선택해주세요.");
		f.recruit.focus();
		return;
	}
	if(isBlank(f.name)) {
		alert( "이름을 입력해주세요.");
		f.name.focus();
		return;
	}
	if(isBlank(f.hp)) {
		alert( "핸드폰 번호를 입력해주세요.");
		f.hp.focus();
		return;
	}
	if(isBlank(f.email)) {
		alert( "이메일 주소를 입력해주세요.");
		f.email.focus();
		return;
	}else{
		//이메일 정규식 체크
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if(!reg_email.test(f.email.value)) {
			alert("이메일 형식에 맞지 않습니다.");
			f.email.focus();
			return;	     
		}
	}
	

	if(confirm("지원 하시겠습니까?")) {
		f.action = "MailSend";
		f.submit();
	}*/
	f.action = "MailSend";
	f.submit();

}  
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/recruit.js"></script>
        <script type="text/javascript" src="/scripts/jquery.MultiFile.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/recruit.css" />
        
        <div id="container" class="sub recruit application">
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
            <!--//Top Common-->
            <section class="content">
                
                
                
                
<form name="processForm" id="processForm" enctype="multipart/form-data"  method="post"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                    <table>
                        <tr>
                            <th>개인정보 수집 및<br/>이용 동의</th>
                            <td class="terms">
                                <div class="roll">
                                    <h5>입사 지원을 위한 개인정보 수집 및 이용동의 안내</h5>
                                    <div class="text">
                                        제이에스티나 채용홈페이지를 활용하여 채용을 실시하는 제이에스티나는 지원자의 개인정보를 중요시하며,<br/>
                                        개인정보보호에 관한 법률을 준수하고 있습니다.<br/>
                                        회사의 본 홈페이지를 통해 입사지원 서비스를 이용하시고자 할 경우 지원자로부터 아래와 같이 최소한의 범위로 개인정보를 수집하고 있습니다.<br/> 
                                        지원자께서는 아래의 내용을 자세히 읽어 보시고, 모든 내용을 이해하신 후에 동의 여부를 결정해 주시기 바랍니다.
                                    </div>
                                    <h5>1. 개인정보 수집 및 이용주체</h5>
                                    <div class="text">
                                        제이에스티나 채용홈페이지의 인재풀 등록 통해 제출하는 지원서 및 각종 증빙서류는 지원자께서 지원서를 제출하는 회사에서 직접 수집/관리하며, 향후 지원서 관리책임은 채용회사에 있습니다.
                                    </div>
                                    <h5>2. 동의를 거부할 권리 및 동의 거부에 따른 불이익</h5>
                                    <div class="text">
                                        지원자는 아래 개인정보 제공 등에 관해 동의하지 않을 권리가 있습니다.<br/>
                                        다만, 지원서를 통해 제공받는 정보는 회사의 채용 전형에 필수적인 항목으로 해당 정보를 제공받지 못할 경우 회사는 공정한 선발전형을 진행할 수 없습니다.<br/>
                                        따라서 아래 개인정보 제공에 대해 동의하지 않는 경우 채용 전형에 지원이 제한될 수 있습니다.
                                    </div>
                                    <h5>3. 수집하는 개인정보 항목 및 수집/이용 목적</h5>
                                    <table>
                                        <tr>
                                            <th>구분</th>
                                            <th>수집항목</th>
                                            <th>수집&middot;이용 목적</th>
                                        </tr>
                                        <tr>
                                            <td class="th" rowspan="2">필수</td>
                                            <td>사진, 성명, 생년월일</td>
                                            <td>인력풀 등록 서비스 이용에 따른 본인 식별 절차에 사용</td>
                                        </tr>
                                        <tr>
                                            <td>성명, 주소, 전화번호(휴대폰), 이메일</td>
                                            <td>채용관련 고지사항 전달 및 결과안내 등 의사소통 경로의 확보 등</td>
                                        </tr>
                                        <tr>
                                            <td class="th" rowspan="2">선택</td>
                                            <td>최종학력(학교명), 최종경력(직장명), 이직사유, 직전/희망연봉, 자기소개 관련정보 등</td>
                                            <td>상시채용 발생 시 채용적합성 판단 및 채용전형 시 근거자료 등 인력풀 활용</td>
                                        </tr>
                                        <tr>
                                            <td>외국어 사항, 자격사항, 포상(수상)내역, 보훈여부(보훈대상자 채용 우대를 위한 정보 수집) 등</td>
                                            <td>상시채용 발생 시 채용적합성 판단 및 채용전형 시 근거자료 등 인력풀 활용</td>
                                        </tr>
                                    </table>
                                    <h5>4. 개인정보의 보유 및 이용기간</h5>
                                    <ul>
                                        <li>
                                            <p>(1) 회사는 귀하의 동의를 받아 귀하의 개인정보를 귀하께 서비스를 제공한 기간 동안에 보유 및 이용합니다.<br/>그 보유 및 이용기간은 다음과 같습니다.</p>
                                            <ol>
                                                <li>
                                                    <p>가. 입사지원서 및 각종 증빙서류</p>
                                                    <span> - 인력풀 등록 및 채용공고 지원자(채용자) : 등록일로부터 1년 경과시까지 (향후 채용가능 자원 관리)</span>
                                                    <span> - 채용공고 지원자(미채용자) : 채용전형 종료일까지</span>
                                                </li>
                                            </ol>
                                        </li>
                                        <li>
                                            <p>(2) 즉시 삭제요청 시 수집된 개인의 정보가 열람 또는 이용될 수 없도록 파기 처리 됩니다. 다만 서비스 이용과 관련된 민원/분쟁이 계속될 경우에는 민원/분쟁 해결 시까지 보유되고, 관계 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관됩니다.</p>
                                        </li>
                                    </ul>
                                </div>
                                <div class="checkBox"><input type="checkbox" id="terms1"/><i>&nbsp;</i><label for="terms1"><b>[선택]</b> 개인정보의 수집 및 이용에 동의하십니까?</label></div>
                                <div class="checkBox"><input type="checkbox" id="terms2"/><i>&nbsp;</i><label for="terms2"><b>[선택]</b> 인재채용을 위한 인재풀 등록에 동의하십니까?</label></div>
                            </td>
                        </tr>
                        <tr>
                            <th>지원자 정보 입력</th>
                            <td>
                                <dl>
                                    <dt>모집부분<span>*</span></dt>
                                    <dd>
                                    	<c:choose>
									    	<c:when test = "${recruitJobField ne ''}">
									        	<select class="select" name="recruit">
	                                            <option value="">모집분야 선택</option>
	                                            <option value="${code}" selected>${recruitJobField}</option>
	                                            </select>
	                                        	
									        </c:when>
									        <c:otherwise>
									        	<select class="select" name="recruit">
	                                            <option value="모집분야">모집분야 선택</option>
	                                            <c:forEach var="list" items="${recruitList}" varStatus="status">
	                                            	<c:if test="${(list.recruitEnd eq 'checked') || (toDay<=list.recruitToDate)}">
	                                            		<option value="${list.seq}">${list.jobField}</option>
	                                            	</c:if>
	                                            </c:forEach>
	                                        	</select>
									        </c:otherwise>
									     </c:choose>
                                    </dd>
                                    <dt>이름<span>*</span></dt>
                                    <dd><input type="text" name="name" value="김은정" class="enterField" placeholder="이름"/></dd>
                                    <dt>핸드폰 번호<span>*</span></dt>
                                    <dd><input type="text" name="hp" value="010-9264-6071" class="enterField" placeholder="ex) 000-0000-0000"/></dd>
                                    <dt>이메일 주소<span>*</span></dt>
                                    <dd><input type="text" name="email" value="kejgogogo@naver.com" class="enterField" placeholder="ex) email@email.com"/></dd>
                                    <dt>첨부파일<span>*</span></dt>
                                    <dd class="addFile">
                                        <div class="addWrap">
                                            <div class="fileField">
                                                <input type="file" name="uploadFile" multiple="multiple" onchange="fileExtCheck(this)" accept=".doc, .docx, .xls, .xlsx, .ppt, .pptx, .pdf, application/msword, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/pdf"/>
                                                <button type="button">파일첨부</button>
                                            </div>
                                        </div>
                                        <a href="#" class="docDown">입사지원서 다운로드</a>
                                        <div class="viewWrap"></div>
                                        <p class="ment">※ 첨부파일은 워드, 엑셀, PPT, PDF 파일만 첨부 가능합니다.</p>
                                    </dd>
                                    <dt>지원사유</dt>
                                    <dd><textarea placeholder="지원사유" name="contents">지원사유지원사유지원사유지원사유지원사유</textarea></dd>
                                </dl>
                            </td>
                        </tr>
                    </table>
                    <div class="bottom_btn"><a href="#" onclick="Jt_submit()">지원하기</a></div>
                </form>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>