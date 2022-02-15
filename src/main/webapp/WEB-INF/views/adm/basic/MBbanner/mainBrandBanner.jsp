<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
//수정,등록 Proc
function Jt_submit(key) { 
	var f = eval("document.processForm"+key);

	if(isBlank(f.uploadFile[0]) && f.fileViewSeq[0].value==0) {
		alert( "PC 이미지 (KR)을 넣어주세요.");
		return;
	}
	if(isBlank(f.uploadFile[2]) && f.fileViewSeq[2].value==0) {
		alert( "PC 이미지 (EN)을 넣어주세요.");
		return;
	}
	if(isBlank(f.uploadFile[4]) && f.fileViewSeq[4].value==0) {
		alert( "PC 이미지 (CN)을 넣어주세요.");
		return;
	}

	f.action = "mainBrandBannerProc";
	f.submit();
}  
//파일 개별 삭제 
function Jt_fileDelete(bseq,fseq,key,gubun){

	if (confirm("파일이 삭제됩니다. 삭제하시겠습니까?")){

		//ajax통신으로 서버에서 파일을 삭제하고 DB삭제,DB수정함
        var url = "/jtadm/basic/fileDel?bseq="+bseq+"&fseq="+fseq+"&key="+key+"&gubun="+gubun;

		//alert(url);
			
        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){

				//alert('#SignName'+ data.gubun + data.key);
            	//통신데이터 값
            	$('#SignName'+ data.gubun + data.key).html("첨부된 파일이 없습니다."); //val()
            	$('#SignSize'+ data.gubun + data.key).html("");
            	$('#SignSeq'+ data.gubun + data.key).html("");
            }
        });
		
	}
}
</script>
</head>
<body>
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/headerAndMenu.jsp" %>
        
		<div id="container" class="basicMgmt mainBrandMgmt">
           
			<c:forEach var="banner" items="${banner}" varStatus="status">
			
<form name="processForm${status.count}" id="processForm" enctype="multipart/form-data"  method="post"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq" value="${banner.seq}"/>
<input type="hidden" name="gubun" value="${arrGubun[status.count-1]}"/>


            <!-- 대배너-->
            <section class="topSubCntn">
                <div class="infoText">
                    <h3>${arrTitle[status.count-1]}</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : PC 최소 (910x446) px / Mobile 최소 (720x426) px </span>
                </div>
                <a href="#" onclick="Jt_submit('${status.count}')" class="commBtn black">저장</a>
            </section>
            <section class="regBodyCntn">
                <article class="hasLeftTH">
                    <table>
                        <colgroup>
                            <col width="214"/>
                            <col width="*"/>
                            <col width="214"/>
                            <col width="*"/>
                        </colgroup>
                        <!-- 
                        <tr>
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
                        <tr>
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
                        <tr>
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
                         -->
                        <c:forEach var="i" begin="0" end="4" step="2">
                        	
                        	<c:if test = "${i eq 0}"><c:set var="langName" value="KR" /></c:if>
                        	<c:if test = "${i eq 2}"><c:set var="langName" value="EN" /></c:if>
                        	<c:if test = "${i eq 4}"><c:set var="langName" value="CN" /></c:if>
                        	
                        <tr>
                            <th>PC 이미지 (${langName}) <span class="colorRed">*</span></th>
                            <td class="file">
                                <div class="fileField">
                                    <input type="hidden" name="fileViewSeq" value="${banner.fileViewSeq[i]}">
                        			<input type="file" name="uploadFile" multiple="multiple" accept="image/gif, image/jpeg, image/png" class="action" onchange="fileExtCheck(this)"/>
                                    <div class="addFile">
                                        <c:choose>
                                        <c:when test="${banner.fileViewName[i] ne '' and banner.fileViewName[i] ne null}">
                                        	<div class="viewInfo">
	                                        <span class="name" id="SignName${arrGubun[status.count-1]}${i}"> ${banner.fileViewName[i]} </span> 
	                                        <span class="size" id="SignSize${arrGubun[status.count-1]}${i}">(<i>${banner.fileViewSize[i]}</i>byte)</span>
	                                        <span class="seq" id="SignSeq${arrGubun[status.count-1]}${i}"><a href='#' onclick="Jt_fileDelete('${banner.seq}','${banner.fileViewSeq[i]}','${i}','${arrGubun[status.count-1]}')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
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
	                                        <span class="name" id="SignName${arrGubun[status.count-1]}${i+1}"> ${banner.fileViewName[i+1]} </span> 
	                                        <span class="size" id="SignSize${arrGubun[status.count-1]}${i+1}">(<i>${banner.fileViewSize[i+1]}</i>byte)</span>
	                                        <span class="seq" id="SignSeq${arrGubun[status.count-1]}${i+1}"><a href='#' onclick="Jt_fileDelete('${banner.seq}','${banner.fileViewSeq[i+1]}','${i+1}','${arrGubun[status.count-1]}')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
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
            <!--// - 대배너-->
</form>            
            </c:forEach>

        </div>
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/html.footer.jsp" %>  
   
    </div>
</body>
</html>
<form name="delForm" id="delForm" method="get" action="Del2">
<input type="hidden" name="seq" value="" />
</form>