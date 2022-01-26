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
function deleteHtml(htmlTxt)
{
	//이미지만 제외하고 
	htmlTxt =  htmlTxt.replace(/<img/ig, "img"); // <img 를 img로 변경
    // HTML 태그제거 정규표현식 사용
    htmlTxt =  htmlTxt.replace(/<(\/)?([a-zA-Z0-9]*)(\s[a-zA-Z0-9]*=[^>]*)?(\s)*(\/)?>/ig, "");
   	return  htmlTxt;
}
//수정,등록 Proc
function Jt_submit(key) { 
	var f = eval("document.processForm"+key);

	dataCheck(); // 에디터의 내용이 textarea에 적용됩니다.
	
	if(isBlank(f.uploadFile[0]) && f.fileViewSeq[0].value==0) {
		alert( "PC 이미지를 넣어주세요 ");
		return;
	}	

	newText = deleteHtml($("#ir"+key).val());
	if(newText.length<=0) {
		alert( " 내용을 입력해주세요.");
		return;
	}	
	
	f.action = "BrandBannerProc";
	f.submit();
}  
//파일 개별 삭제 
//등록후 확인해보자.
function Jt_fileDelete(bseq,fseq,key,gubun){

	if (confirm("파일이 삭제됩니다. 삭제하시겠습니까?")){

		//ajax통신으로 서버에서 파일을 삭제하고 DB삭제,DB수정함
        var url = "/jtadm/brand/banner/fileDel?bseq="+bseq+"&fseq="+fseq+"&key="+key+"&gubun="+gubun;

		$.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){

				//통신데이터 값
            	$('#SignName'+ data.key + data.gubun).html("첨부된 파일이 없습니다."); //val()
            	$('#SignSize'+ data.key + data.gubun).html("");
            	$('#SignSeq'+ data.key + data.gubun).html("");
            }
            
        });
        
		
	}
}
</script>
</head>
<body>
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/headerAndMenu.jsp" %>
        
		<div id="container" class="brandMgmt brandBannerMgmt ${lang}">
        
<c:forEach var="banner" items="${banner}" varStatus="status">

<form name="processForm${status.count}" id="processForm" enctype="multipart/form-data"  method="post"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq" value="${banner.seq}"/>
<input type="hidden" name="gubun" value="${arrGubun[status.count-1]}"/>
<input type="hidden" name="lang" value="${lang}"/>    
        
            
            <!--J.ESTINA Jewerly-->
            <section class="topSubCntn">
                <div class="infoText">
                    <h3>${arrTitle[status.count-1]}</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : PC 최소 (1920x1080) px / Mobile 최소 (1920x1080) px</span>
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
                        <tr>
                            <th>링크주소</th>
                            <td colspan="3" class="url">
                                <select class="select" name="linkKrOutYn">
                                    <option value="N" <c:if test="${banner.linkKrOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${banner.linkKrOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${banner.linkKrOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkKr" value="${banner.linkKr}" class="enterText" placeholder="링크주소 URL을 입력해주세요."/>
                            </td>
                        </tr>
                        <tr>
                            <th>PC 이미지<span class="colorRed">*</span></th>
                            <td class="file">
                                <div class="fileField">
                                    <input type="hidden" name="fileViewSeq" value="${banner.fileViewSeq[0]}">
                        			<input type="file" name="uploadFile" multiple="multiple" class="action"  onchange="fileExtCheck(this)"/>
                                    <div class="addFile">
                                        <c:choose>
                                        <c:when test="${banner.fileViewName[0] ne '' and banner.fileViewName[0] ne null}">
                                        	<div class="viewInfo">
	                                        <span class="name" id="SignName0${arrGubun[status.count-1]}"> ${banner.fileViewName[0]} </span> 
	                                        <span class="size" id="SignSize0${arrGubun[status.count-1]}">(${banner.fileViewSize[0]} KB)</span>
	                                        <span class="seq" id="SignSeq0${arrGubun[status.count-1]}"><a href='#' onclick="Jt_fileDelete('${banner.seq}','${banner.fileViewSeq[0]}','0','${arrGubun[status.count-1]}')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
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
                            <th>MO 이미지 </th>
                            <td>
                                <div class="fileField">
                                    <input type="hidden" name="fileViewSeq" value="${banner.fileViewSeq[1]}">
                        			<input type="file" name="uploadFile" multiple="multiple" class="action"  onchange="fileExtCheck(this)"/>
                                    <div class="addFile">
                                        <c:choose>
                                        <c:when test="${banner.fileViewName[1] ne '' and banner.fileViewName[1] ne null}">
                                        	<div class="viewInfo">
	                                        <span class="name" id="SignName1${arrGubun[status.count-1]}"> ${banner.fileViewName[1]} </span> 
	                                        <span class="size" id="SignSize1${arrGubun[status.count-1]}">(${banner.fileViewSize[1]} KB)</span>
	                                        <span class="seq" id="SignSeq1${arrGubun[status.count-1]}"><a href='#' onclick="Jt_fileDelete('${banner.seq}','${banner.fileViewSeq[1]}','1','${arrGubun[status.count-1]}')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
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
                        <tr>
                            <td colspan="4" class="editor">
								<textarea name="contents" id="ir${status.count}" rows="10" cols="70" style="width:100%; height:200px; display:none;">${banner.contents}</textarea>
							</td>
                        </tr>
                    </table>
                </article>
            </section>
            <!--//J.ESTINA Jewerly-->
            
</form>            
            </c:forEach>            
            
                    
        <%@ include file="/WEB-INF/views/adm/jtcommon/html.footer.jsp" %>  
   
    </div>
</body>
</html>
<script type="text/javascript" src="/editor/SE/js/HuskyEZCreator.js" charset="utf-8"></script>
<script language="javascript">
var oEditors = [];
$(document).ready(function(){
	
	contentsLoding("ir1");
	contentsLoding("ir2");
	contentsLoding("ir3");
	
});
function contentsLoding(id){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: id,
		sSkinURI: "/editor/SE/SmartEditor2Skin.html",
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
			}
		}, 
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
}

function dataCheck(f){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	oEditors.getById["ir2"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	oEditors.getById["ir3"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	return true;
}
</script>