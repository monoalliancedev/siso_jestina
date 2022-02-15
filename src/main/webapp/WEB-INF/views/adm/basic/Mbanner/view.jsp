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
    	alert('이미지 파일만 첨부 가능합니다.');
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

//게시여부 체크후에 폼전송한다. 
function Jt_submit(){
	$.ajax({ //게시여부Y가 2개 이상인지 확인
        type : "GET",
        url : "IsntYCount?gubun=${search.keyGubun}",
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
					<c:if test="${(banner.isntYn eq 'Y') && (banner.seq>0)}">
						isntYnKey = false;
					</c:if>
	    		}
			}
			if(isntYnKey) {
		    	Jt_submit2();
			}else{
				alert("메인배너관리 게시글은 1개 이상 등록되어야 합니다.");
			} 
		}
    });
    return false;
}

//수정,등록 Proc
function Jt_submit2() { 
	var f = document.processForm;
	if(isBlank(f.title)) {
		alert( "배너명을 입력해주세요.");
		f.title.focus();
		return;
	}

	var ck = true;
	// 체크된 체크박스의 value 값을 가지고 온다.
	$('input:checkbox[name=langArr]:checked').each(function() { 
     	langKey = this.value; //KR,EN,CN
     		
		if($("#uploadFile"+langKey).val()=="" && $("#fileViewSeq"+langKey).val()==0) {
			alert( "("+ langKey +") PC이미지 또는 동영상을 넣어주세요.");
			ck = false;
			return false;
		}
	});
    
	if(ck) {
		f.action = "Proc${processKey}";
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
        var url = "/jtadm/basic/fileDel?bseq=${banner.seq}&fseq="+seq+"&key="+key+"&gubun=${gubun}";

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

		<div id="container" class="basicMgmt mainBannerReg">

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq" value="${banner.seq}"/>
<input type="hidden" name="cpage" value="${search.cpage}" />
<input type="hidden" name="pg_rows" value="${search.pg_rows}" />
<input type="hidden" name="keyIsnt" value="${search.keyIsnt}" />
<input type="hidden" name="key" value="${search.key}" />
<input type="hidden" name="keyword" value="${search.keyword}" />
<input type="hidden" name="keyGubun" value="${page.keyGubun}" />
<input type="hidden" name="total_rows" value="${search.total_rows}" />

		    <!--상단-->
            <section class="topSubCntn">
                <c:if test="${processKey eq 'Insert'}">
                <div class="infoText">
                    <h3>메인배너 등록</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : PC 최소 (1920x990) px / Mobile 최소 (720x1134) px </span>
                </div>
                <a href="#" onclick="Jt_submit()" class="commBtn black">등록</a>
                </c:if>
                <c:if test="${processKey eq 'Update'}">
                <div class="infoText">
                    <h3>메인배너 수정</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : PC 최소 (1920x990) px / Mobile 최소 (720x1134) px </span>
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
                                    <input type="checkbox" name="langArr" onclick="Jt_langCheck('KR')" id="langKR" value="KR" <c:if test = "${fn:contains(banner.lang, 'KR')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langKR">KR</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" onclick="Jt_langCheck('EN')" id="langEN" value="EN" <c:if test = "${fn:contains(banner.lang, 'EN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langEN">EN</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" onclick="Jt_langCheck('CN')" id="langCN" value="CN" <c:if test = "${fn:contains(banner.lang, 'CN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langCN">CN</label>
                                </div>
                            </td>
                            <th>등록일</th>
                            <td>
                                <div class="datepicker oneDay">
                                    <input name="regdate" value="${banner.regdate}" type="text" class="selectDate" onKeyup="directDate(this);" placeholder="등록일 yyyy-mm-dd"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>배너명 <span class="colorRed">*</span></th>
                            <td><input type="text" name="title" value="${banner.title}" class="enterText" placeholder="배너명"/></td>
                            <th>게시여부</th>
                            <td>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="Y" id="openY" <c:if test="${banner.isntYn eq 'Y'}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="openY">Y</label>
                                </div>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="N" id="openN" <c:if test="${banner.isntYn eq 'N'}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="openN">N</label>
                                </div>
                            </td>
                        </tr>
                        <tr id=linkTrKR>
                            <th>링크주소 (KR)</th>
                            <td colspan="3" class="url">
                                <select class="select" name="linkKrOutYn">
                                    <option value="N" <c:if test="${banner.linkKrOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${banner.linkKrOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${banner.linkKrOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkKr" value="${banner.linkKr}" class="enterText" placeholder="링크주소(KR) URL을 입력해주세요."/>
                            </td>
                        </tr>
                        <tr id=linkTrEN>
                            <th>링크주소 (EN)</th>
                            <td colspan="3" class="url">
                                <select class="select" name="linkEnOutYn">
                                    <option value="N" <c:if test="${banner.linkEnOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${banner.linkEnOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${banner.linkEnOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkEn" value="${banner.linkEn}" class="enterText" placeholder="링크주소(EN) URL을 입력해주세요."/>
                            </td>
                        </tr>
                        <tr id=linkTrCN>
                            <th>링크주소 (CN)</th>
                            <td colspan="3" class="url">
                                <select class="select" name="linkCnOutYn">
                                    <option value="N" <c:if test="${banner.linkCnOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${banner.linkCnOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${banner.linkCnOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkCn" value="${banner.linkCn}" class="enterText" placeholder="링크주소(CN) URL을 입력해주세요."/>
                            </td>
                        </tr>
                        
                        
                        
                        
                        <c:forEach var="i" begin="0" end="4" step="2">
                        	
                        	<c:if test = "${i eq 0}">
                        		<c:set var="langName" value="KR" />
                        		<c:set var="fileType">${banner.fileKRType}</c:set>
                        	</c:if>
                        	<c:if test = "${i eq 2}">
                        		<c:set var="langName" value="EN" />
                        		<c:set var="fileType">${banner.fileENType}</c:set>
                        	</c:if>
                        	<c:if test = "${i eq 4}">
                        		<c:set var="langName" value="CN" />
                        		<c:set var="fileType">${banner.fileCNType}</c:set>
                        	</c:if>
                        	
                        <tr id=FileTr${langName}>
                            <th>PC 이미지 (동영상) (${langName}) <span class="colorRed">*</span><br/>
                            <span class="s_text">(동영상은 링크가 연결되지 않습니다.)</span></th>
                            <td class="file">
                                <select class="select" name="file${langName}Type">
                                    <option value="image" <c:if test="${fileType eq 'image'}">selected</c:if>>이미지</option>
                                    <option value="video" <c:if test="${fileType eq 'video'}">selected</c:if>>영상</option>
                                </select>
                                <div class="fileField">
									<input type="hidden" name="fileViewSeq" id="fileViewSeq${langName}" value="${banner.fileViewSeq[i]}">
                        			<input type="file" name="uploadFile" id="uploadFile${langName}" multiple="multiple" class="action"/>
                                    <div class="addFile">
                                        <c:choose>
                                        <c:when test="${banner.fileViewName[i] ne '' and banner.fileViewName[i] ne null}">
                                        	<div class="viewInfo">
	                                        <span class="name" id="SignName${i}"> ${banner.fileViewName[i]} </span> 
	                                        <span class="size" id="SignSize${i}">(<i>${banner.fileViewSize[i]}</i>byte)</span>
	                                        <span class="seq" id="SignSeq${i}"><a href='#' onclick="Jt_fileDelete('${banner.fileViewSeq[i]}','${i}')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
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
                            <th>MO 이미지 (${langName})</th>
                            <td>
                                <div class="fileField">
                                    <input type="hidden" name="fileViewSeq" value="${banner.fileViewSeq[i+1]}" >
                        			<input type="file" name="uploadFile" multiple="multiple" accept="image/gif, image/jpeg, image/png" class="action" onchange="fileExtCheck(this)"/>
                        			<div class="addFile">
                                        <c:choose>
                                        <c:when test="${banner.fileViewName[i+1] ne '' and banner.fileViewName[i+1] ne null}">
                                        	<div class="viewInfo">
	                                        <span class="name" id="SignName${i+1}"> ${banner.fileViewName[i+1]} </span> 
	                                        <span class="size" id="SignSize${i+1}">(<i>${banner.fileViewSize[i+1]}</i>byte)</span>
	                                        <span class="seq" id="SignSeq${i+1}"><a href='#' onclick="Jt_fileDelete('${banner.fileViewSeq[i+1]}','${i+1}')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
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
                        
                        <tr>
                            <th>배너 노출문구</th>
                            <td colspan="3">
                                <textarea class="textArea" placeholder="Text..." name="contents">${banner.contents}</textarea>
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









