<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/adm/jtcommon/html.head.jsp" %>  
<script>
$(document).ready(function() {
});
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
function dataCheck(){
	var f = document.dataForm;
	if (f.attach_files.value == ""){
		alert("파일을 선택하세요.");
		return false;
	}
	f.submit();
}

</script>
</head>
<body style="padding:20px;">


<form name="dataForm" method="post" action="uploadFileProc" enctype='multipart/form-data'>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" name="gubun" value="${gubun}">
<input type="hidden" name="pseq" value="${pseq}">
<input type="hidden" name="key" value="${key}">
<div>
			<!--상단-->
            <section class="topSubCntn">
                <div class="infoText">
                    <h3>파일 등록</h3>
                </div>
                <a href="#" onclick="dataCheck()" class="commBtn black">파일업로드</a>
	            <a href="#" onclick="window.close();" class="commBtn white">취소</a>
            </section>
			<section class="regBodyCntn">
                <article class="hasLeftTH">
                    <table>
                        <colgroup>
                            <col width="100"/>
                            <col width="*"/>
                        </colgroup>
                        <tr>
                            <th>이미지<span class="colorRed">*</span></th>
                            <td>
                                <div class="fileField">
	                               <input type="file" id="attach_files" name="attach_files" multiple="multiple" class="action" onchange="fileExtCheck(this)"/>
	                               <div class="addFile">
                                        <div class="viewInfo">
                                        <span class="name">첨부된 파일이 없습니다.</span> 
                                        <span class="size"></span>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </article>
            </section>    
            
          
            
 
	

</form>



</body>
</html>
