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
					<c:if test="${(board.isntYn eq 'Y') && (board.seq>0)}">
						isntYnKey = false;
					</c:if>
	    		}
			}
			if(isntYnKey) {
		    	Jt_submit2();
			}else{
				alert("뉴스 게시글은 1개 이상 등록되어야 합니다.");
			} 
		}
    });
    return false;
}
//수정,등록 Proc
function Jt_submit2() { 
	var f = document.processForm;
	var langKey;
	dataCheck(); // 에디터의 내용이 textarea에 적용됩니다.

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

     	newText = deleteHtml($("#ir"+langKey).val())
		if(newText.length<=0) {
			alert( langKey + " 내용을 입력해주세요.");
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
        var url = "/jtadm/board/fileDel?bseq=${board.seq}&fseq="+seq+"&key="+key+"&gubun=${gubun}";

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
<input type="hidden" name="seq" value="${board.seq}"/>
<input type="hidden" name="cpage" value="${search.cpage}" />
<input type="hidden" name="pg_rows" value="${search.pg_rows}" />
<input type="hidden" name="keyIsnt" value="${search.keyIsnt}" />
<input type="hidden" name="key" value="${search.key}" />
<input type="hidden" name="keyword" value="${search.keyword}" />
<input type="hidden" name="total_rows" value="${search.total_rows}" />

		<div id="container" class="bbsMgmt newsReg">
		    <!--상단-->
            <section class="topSubCntn">
                <c:if test="${processKey eq 'Insert'}">
                <div class="infoText">
                    <h3>${gubun} 뉴스 등록</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : 최소 (1920x1080) px</span>
                </div>
                <a href="#" onclick="Jt_submit()" class="commBtn black">등록</a>
                </c:if>
                <c:if test="${processKey eq 'Update'}">
                <div class="infoText">
                    <h3>뉴스 수정</h3>
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
                                    <input type="checkbox" name="langArr" id="langKR" onclick="Jt_langCheck('KR')" value="KR" <c:if test = "${fn:contains(board.lang, 'KR')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langKR">KR</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" id="langEN" onclick="Jt_langCheck('EN')" value="EN" <c:if test = "${fn:contains(board.lang, 'EN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langEN">EN</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" id="langCN" onclick="Jt_langCheck('CN')" value="CN" <c:if test = "${fn:contains(board.lang, 'CN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langCN">CN</label>
                                </div>
                            </td>
                            <th>등록일</th>
                            <td>
                                <div class="datepicker oneDay">
                                    <input name="regdate" value="${board.regdate}" type="text" class="selectDate" onKeyup="directDate(this);" placeholder="등록일 yyyy-mm-dd"/>
                                </div>
                            </td>
                        </tr>
                        <tr id=nameTrKR>
                            <th>제목 (KR) <span class="colorRed">*</span></th>
                            <td colspan="3"><input type="text" name="titleKr" id="titleKR" value="${board.titleKr}" class="enterText" placeholder="제목 (KR)"/></td>
                        </tr>
                        <tr id=nameTrEN>
                            <th>제목 (EN) <span class="colorRed">*</span></th>
                            <td colspan="3"><input type="text" name="titleEn" id="titleEN" value="${board.titleEn}" class="enterText" placeholder="제목 (EN)"/></td>
                        </tr>
                        <tr id=nameTrCN>
                            <th>제목 (CN) <span class="colorRed">*</span></th>
                            <td colspan="3"><input type="text" name="titleCn" id="titleCN" value="${board.titleCn}" class="enterText" placeholder="제목 (CN)"/></td>
                        </tr>
                        <tr>
                            <th>게시여부</th>
                            <td>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="Y" id="openY" <c:if test="${board.isntYn eq 'Y'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="openY">Y</label>
                                </div>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="N" id="openN" <c:if test="${board.isntYn eq 'N'}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="openN">N</label>
                                </div>
                            </td>
                            <th>메인노출여부</th>
                            <td>
                                <div class="radioButton">
                                    <input type="radio" name="mainYn" value="Y" id="mainOpenY" <c:if test="${board.mainYn eq 'Y'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="mainOpenY">Y</label>
                                </div>
                                <div class="radioButton">
                                    <input type="radio" name="mainYn" value="N" id="mainOpenN" <c:if test="${board.mainYn eq 'N'}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="mainOpenN">N</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>썸네일 이미지</th>
                            <td colspan="3">
                                <div class="fileField">
                                    <input type="hidden" name="fileViewSeq" value="${board.fileViewSeq[0]}">
                        			<input type="file" name="uploadFile" multiple="multiple" class="action" onchange="fileExtCheck(this)"/>
                                    <div class="addFile">
                                        <c:choose>
                                        <c:when test="${board.fileViewName[0] ne '' and board.fileViewName[0] ne null}">
                                        	<div class="viewInfo">
	                                        <span class="name" id="SignName${0}"> ${board.fileViewName[0]} </span> 
	                                        <span class="size" id="SignSize${0}">(${board.fileViewSize[0]} KB)</span>
	                                        <span class="seq" id="SignSeq${0}"><a href='#' onclick="Jt_fileDelete('${board.fileViewSeq[0]}','0')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
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
                            <th>첨부파일<br/><span class="s_text">(이미지파일만 첨부가능)</span></th>
                            <td class="file" colspan="3">
                                <c:forEach var="i" begin="1" end="4">
                                <input type="hidden" name="fileViewSeq" value="${board.fileViewSeq[i]}">
                                <div class="fileField">
                                    <input type="file" name="uploadFile" multiple="multiple" class="action" onchange="fileExtCheck(this)"/>
                                    <div class="addFile">
                                        <c:choose>
                                        <c:when test="${board.fileViewName[i] ne '' and board.fileViewName[i] ne null}">
                                        	<div class="viewInfo">
	                                        <span class="name" id="SignName${i}"> ${board.fileViewName[i]} </span> 
	                                        <span class="size" id="SignSize${i}">(${board.fileViewSize[i]} KB)</span>
	                                        <span class="seq" id="SignSeq${i}"><a href='#' onclick="Jt_fileDelete('${board.fileViewSeq[i]}','${i}')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
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
                                </c:forEach>
                            </td>
                        </tr>
                        <tr id=contentsTrKR>
                            <th>내용 (KR) 필수 <span class="colorRed">*</span></th>
                            <td class="editor" colspan="3">
                            <textarea name="contentsKr" id="irKR" rows="10" cols="70" style="width:100%; height:200px; display:none;">${board.contentsKr}</textarea>
							</td>
                        </tr>
                        <tr id=contentsTrEN>
                            <th>내용 (EN) 필수 <span class="colorRed">*</span></th>
                            <td class="editor" colspan="3">
                            <textarea name="contentsEn" id="irEN" rows="10" cols="70" style="width:100%; height:200px; display:none;">${board.contentsEn}</textarea>
							</td>
                        </tr>
                        <tr id=contentsTrCN>
                            <th>내용 (CN) 필수 <span class="colorRed">*</span></th>
                            <td class="editor" colspan="3">
                            <textarea name="contentsCn" id="irCN" rows="10" cols="70" style="width:100%; height:200px; display:none;">${board.contentsCn}</textarea>
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
		$('#nameTr'+key).attr('style', "display:'';");  //나타내기
		$('#contentsTr'+key).show();
		
	}else{
		$('#nameTr'+key).attr('style', "display:none;");  //숨기기
		$('#contentsTr'+key).hide();
	}
}
</script> 
<script type="text/javascript" src="/editor/SE/js/HuskyEZCreator.js" charset="utf-8"></script>
<script language="javascript">
var oEditors = [];

$(document).ready(function(){
	contentsLoding("irKR");
	contentsLoding("irEN");
	contentsLoding("irCN");
	
	var timer = setInterval(function() {
		console.log("=============================setInterval"); 
		Jt_langCheck('KR');
		Jt_langCheck('EN');
		Jt_langCheck('CN');
		clearInterval(timer);
	}, 1000);	
});

function contentsLoding(id){
	ir = nhn.husky.EZCreator.createInIFrame({
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
	return ir;
}

function dataCheck(f){

	oEditors.getById["irKR"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	oEditors.getById["irEN"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	oEditors.getById["irCN"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	return true;
}
</script>







