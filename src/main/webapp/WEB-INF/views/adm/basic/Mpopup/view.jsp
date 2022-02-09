<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/adm/jtcommon/html.head.jsp" %>  
<script type="text/javascript">
        $(function(){
            //첨부파일삭제
            $('.fileField .addFile .delBtn').click(function () { 
                if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")) {
                    $(this).prev('.viewInfo').removeClass('infile');
                    $(this).prev('.viewInfo').find('.name').html('첨부된 파일이 없습니다.');
                    $(this).prev('.viewInfo').find('.size').html('');
                    $(this).parents('.fileField').find('.action').val('');
                    $(this).hide();
                }
            });
        });
    </script>
    
<script type="text/javascript">
//화일 확장자 체크
function fileExtCheck(file) {
	let fileVal = file.value;

	var lastDot = fileVal.lastIndexOf('.');
	var fileLength = fileVal.length;
	var fileType = fileVal.substring(lastDot+1, fileLength).toLowerCase(); //소문자로 변경
	
	// 확장자 체크
    if($.inArray(fileType, ['png','jpg','jpeg','bmp','gif']) == -1) {
    	alert('첨부파일은 이미지 파일만 첨부 가능합니다.');
    	file.value="";
    	return;
    }
}
function isBlank(input) {
	
	if((input.value =="") ||(input.value ==null)) {
		return true;
	}
	return false;
}
function isNumber() {
	if(event.keyCode<48 || event.keyCode>57) {
		event.returnValue = false ;
	}
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
					<c:if test="${(popup.isntYn eq 'Y') && (popup.seq>0)}">
						isntYnKey = false;
					</c:if>
	    		}
			}
			if(isntYnKey) {
		    	Jt_submit2();
			}else{
				alert("팝업관리 게시글은 1개 이상 등록되어야 합니다.");
			} 
		}
    });
    return false;
}


//수정,등록 Proc
function Jt_submit2() { 
	var f = document.processForm;

	if(isBlank(f.title)) {
		alert( "팝업제목을 입력해주세요.");
		f.title.focus();
		return;
	}
	if(isBlank(f.fromDate)) {
		alert( "게시기간을 설정해주세요.");
		f.fromDate.focus();
		return;
	}
	if(isBlank(f.toDate)) {
		alert( "게시기간을 설정해주세요.");
		f.toDate.focus();
		return;
	}
	/*
	if(isBlank(f.winWidth) || f.winWidth.value<=0) {
		alert( "창크기를 설정해주세요.");
		f.winWidth.focus();
		return;
	}
	if(isBlank(f.winHeight) || f.winHeight.value<=0) {
		alert( "창크기를 설정해주세요.");
		f.winHeight.focus();
		return;
	}
	if(isBlank(f.winLeft) || f.winLeft.value<0) {
		alert( "창위치를 설정해주세요.");
		f.winLeft.focus();
		return;
	}
	if(isBlank(f.winTop) || f.winTop.value<0) {
		alert( "창위치를 설정해주세요.");
		f.winTop.focus();
		return;
	}
	*/

	var ck = true;
	// 체크된 체크박스의 value 값을 가지고 온다.
	$('input:checkbox[name=langArr]:checked').each(function() { 
     	langKey = this.value; //KR,EN,CN
     		
     	if($("#title"+langKey).val()=="") {
			alert( langKey + " 제목을 입력해주세요.");
			$("#title"+langKey).focus();
			ck = false;
			return false;
		}
     	if($("#uploadFile"+langKey).val()=="" && $("#fileViewSeq"+langKey).val()==0) {
			alert( langKey + " 팝업이미지를 넣어주세요.");
			ck = false;
			return false;
		}
    });
    
	if(ck) {
		f.action = "Proc";
		f.submit();
	}
}  
//삭제 
function Jt_delete(seq){
	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		var f = document.processForm;
		f.cpage.value = 1;
		f.action="Del";
		f.submit();
	}
}
//파일 개별 삭제 
function Jt_fileDelete(seq,key){
	if (confirm("파일이 삭제됩니다. 삭제하시겠습니까?")){

		//ajax통신으로 서버에서 파일을 삭제하고 DB삭제,DB수정함
        var url = "/jtadm/basic/Mpopup/fileDel?bseq=${popup.seq}&fseq="+seq+"&key="+key;

        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
            	//통신데이터 값
            	$('#SignName'+data.key).html("첨부된 파일이 없습니다."); //val()
            	$('#SignSize'+data.key).html("");
            	$('#SignSeq'+data.key).html("");
            }
        });
		
	}
}
</script>
</head>
<body>
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/headerAndMenu.jsp" %>

<form name="processForm" id="processForm" enctype="multipart/form-data"  method="post"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq" value="${popup.seq}"/>
<input type="hidden" name="cpage" value="${search.cpage}" />
<input type="hidden" name="pg_rows" value="${search.pg_rows}" />
<input type="hidden" name="keyIsnt" value="${search.keyIsnt}" />
<input type="hidden" name="key" value="${search.key}" />
<input type="hidden" name="keyword" value="${search.keyword}" />
<input type="hidden" name="total_rows" value="${search.total_rows}" />

        <div id="container" class="basicMgmt popupReg">
            <!--상단-->
            <section class="topSubCntn">
                <c:if test="${processKey eq 'Insert'}">
                <div class="infoText">
                    <h3>레이어 팝업 등록</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : 최소 (500x500) px</span>
                </div>
                <a href="#" onclick="Jt_submit2()" class="commBtn black">등록</a>
                </c:if>
                <c:if test="${processKey eq 'Update'}">
                <div class="infoText">
                    <h3>레이어 팝업 수정</h3>
                </div>
                <a href="#" onclick="Jt_delete()" class="commBtn white"><img src="/jtadm/images/admin/icon_btn_del.svg"/>삭제</a>
                <a href="#" onclick="javascript:history.back()" class="commBtn white">목록</a>
                <a href="#" onclick="Jt_submit2()" class="commBtn black">저장</a>
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
                                    <input type="checkbox" name="langArr" id="langKR" onclick="Jt_langCheck('KR')" value="KR" <c:if test = "${fn:contains(popup.lang, 'KR')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langKR">KR</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" id="langEN" onclick="Jt_langCheck('EN')" value="EN" <c:if test = "${fn:contains(popup.lang, 'EN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langEN">EN</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" id="langCN" onclick="Jt_langCheck('CN')" value="CN" <c:if test = "${fn:contains(popup.lang, 'CN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langCN">CN</label>
                                </div>
                            </td>
                            <th>등록일</th>
                            <td>
                                <div class="datepicker oneDay">
                                    <input name="regdate" value="${popup.regdate}" type="text" class="selectDate" onKeyup="directDate(this);" placeholder="등록일 yyyy-mm-dd"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>팝업제목 <span class="colorRed">*</span></th>
                            <td colspan="3"><input type="text" name="title" value="${popup.title}" class="enterText" placeholder="팝업제목"/></td>
                        </tr>
                        <tr>
                            <th>게시기간  <span class="colorRed">*</span></th>
                            <td colspan="3">
                                <div class="termDate">
                                    <div class="datepicker startDate">
                                        <input type="text" name="fromDate" value="${popup.fromDate}" class="selectDate start" onKeyup="directDate(this);" placeholder="게시기간 yyyy.mm.dd"/>
                                    </div>
                                    <span class="mark">~</span>
                                    <div class="datepicker endDate">
                                        <input type="text" name="toDate" value="${popup.toDate}" class="selectDate end" onKeyup="directDate(this);" placeholder="게시기간 yyyy.mm.dd"/>
                                    </div>
                                </div>
                                <div class="autoDateBtn">
                                    <a href="#" class="commBtn white oneWeek">일주일</a>
                                    <a href="#" class="commBtn white oneMonth">한달</a>
                                    <a href="#" class="commBtn white twoMonths">두달</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>게시여부</th>
                            <td>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="Y" id="openY" <c:if test="${popup.isntYn eq 'Y'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="openY">Y</label>
                                </div>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="N" id="openN" <c:if test="${popup.isntYn eq 'N'}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="openN">N</label>
                                </div>
                            </td>
                            <th><!-- 팝업창 스크롤 --></th>
                            <td>
                                <!-- 
                                <div class="radioButton">
                                    <input type="radio" name="popscrollYn" value="Y" id="scrollY" <c:if test="${popup.popscrollYn eq 'Y'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="scrollY">Y</label>
                                </div>
                                <div class="radioButton">
                                    <input type="radio" name="popscrollYn" value="N" id="scrollN" <c:if test="${popup.popscrollYn eq 'N'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="scrollN">N</label>
                                </div>
                                 -->
                            </td>
                        </tr>
                        <!-- 
                        <tr>
                            <th>창 크기<span class="colorRed">*</span></th>
                            <td>
                                <div class="sizePos"><b>W</b><input type="text" name="winWidth" value="${popup.winWidth}" onkeypress="isNumber();" class="enterText" placeholder="창 크기 가로"/><b>px</b></div>
                                <div class="sizePos"><b>H</b><input type="text" name="winHeight" value="${popup.winHeight}" onkeypress="isNumber();" class="enterText" placeholder="창 크기 세로"/><b>px</b></div>
                            </td>
                            <th>창 위치<span class="colorRed">*</span></th>
                            <td>
                                <div class="sizePos"><b>X</b><input type="text" name="winLeft" value="${popup.winLeft}" onkeypress="isNumber();" class="enterText" placeholder="좌측 위치"/><b>px</b></div>
                                <div class="sizePos"><b>Y</b><input type="text" name="winTop" value="${popup.winTop}" onkeypress="isNumber();" class="enterText" placeholder="상단 위치"/><b>px</b></div>
                            </td>
                        </tr>
                         -->
                        <tr id=linkTrKR>
                            <th>링크주소 (KR)</th>
                            <td colspan="3" class="url">
                                <select class="select" name="linkKrOutYn">
                                    <option value="N" <c:if test="${popup.linkKrOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${popup.linkKrOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${popup.linkKrOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkKr" value="${popup.linkKr}" class="enterText" placeholder="링크주소(KR) URL을 입력해주세요."/>
                            </td>
                        </tr>
                        <tr id=linkTrEN>
                            <th>링크주소 (EN)</th>
                            <td colspan="3" class="url">
                                <select class="select" name="linkEnOutYn">
                                    <option value="N" <c:if test="${popup.linkEnOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${popup.linkEnOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${popup.linkEnOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkEn" value="${popup.linkEn}" class="enterText" placeholder="링크주소(EN) URL을 입력해주세요."/>
                            </td>
                        </tr>
                        <tr id=linkTrCN>
                            <th>링크주소 (CN)</th>
                            <td colspan="3" class="url">
                                <select class="select" name="linkCnOutYn">
                                    <option value="N" <c:if test="${popup.linkCnOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${popup.linkCnOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${popup.linkCnOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkCn" value="${popup.linkCn}" class="enterText" placeholder="링크주소(CN) URL을 입력해주세요."/>
                            </td>
                        </tr>

                        <c:forEach var="i" begin="0" end="2" step="1">
                        	<c:if test = "${i eq 0}"><c:set var="langName" value="KR" /></c:if>
                        	<c:if test = "${i eq 1}"><c:set var="langName" value="EN" /></c:if>
                        	<c:if test = "${i eq 2}"><c:set var="langName" value="CN" /></c:if>
                        <tr id=FileTr${langName}>
                            <th>팝업이미지 (${langName}) <span class="colorRed">*</span></th>
                            <td class="file" colspan="3">
                                <div class="fileField">
                                    <input type="hidden" name="fileViewSeq" id="fileViewSeq${langName}" value="${popup.fileViewSeq[i]}">
                        			<input type="file" name="uploadFile" id="uploadFile${langName}" multiple="multiple" class="action" onchange="fileExtCheck(this)">
                                   	
                                    <div class="addFile">
                                    	<c:choose>
                                        <c:when test="${popup.fileViewName[i] ne '' and popup.fileViewName[i] ne null}">
                                        	<div class="viewInfo">
	                                        <span class="name" id="SignName${i}"> ${popup.fileViewName[i]} </span> 
	                                        <span class="size" id="SignSize${i}">(${popup.fileViewSize[i]} KB)</span>
	                                        <span class="seq" id="SignSeq${i}"><a href='#' onclick="Jt_fileDelete('${popup.fileViewSeq[i]}','${i}')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
	                                        </div>
	                                    </c:when>
                                        <c:otherwise>
	                                        <div class="viewInfo">
	                                        <span class="name">첨부된 파일이 없습니다.</span> 
	                                        <span class="size"></span>
	                                        </div>
                                        </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                       
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




<script>
//언어 선택이 되면 => 주소,이미지 tr을 보여줌
function Jt_langCheck(key) {
	if($('#lang'+key).is(':checked')){
		$('#linkTr'+key).attr('style', "display:'';");  //나타내기
		$('#FileTr'+key).attr('style', "display:'';");  //나타내기
	}else{
		$('#linkTr'+key).attr('style', "display:none;");  //숨기기
		$('#FileTr'+key).attr('style', "display:none;");  //숨기기
	}
}
Jt_langCheck('KR');
Jt_langCheck('EN');
Jt_langCheck('CN');
</script> 
