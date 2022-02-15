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
					<c:if test="${(romason.isntYn eq 'Y') && (romason.seq>0)}">
						isntYnKey = false;
					</c:if>
	    		}
			}
			if(isntYnKey) {
		    	Jt_submit2();
			}else{
				alert("로만손 제품 관리 게시글은 1개 이상 등록되어야 합니다.");
			} 
		}
    });
    return false;
}

//수정,등록 Proc
function Jt_submit2() { 

	var f = document.processForm;

	if($("select[name=categorySeq]").val()=="0") {
		alert( "카테고리 설정해주세요.");
		f.categorySeq.focus();
		return;
	}
	if(isBlank(f.proName)) {
		alert( "제품명을 입력해주세요.");
		f.proName.focus();
		return;
	}
	if(isBlank(f.uploadFile[0]) && f.fileViewSeq[0].value==0) {
		alert( "제품 이미지를 설정해주세요.");
		return;
	}	

	f.action = "romasonProProc";
	f.submit();
}  
//삭제 
function Jt_delete(seq){
	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		var f = document.processForm;
		f.cpage.value = 1;
		f.action="romasonProDel";
		f.submit();
	}
}
//파일 개별 삭제 
function Jt_fileDelete(seq,key){
	if (confirm("파일이 삭제됩니다. 삭제하시겠습니까?")){

		//ajax통신으로 서버에서 파일을 삭제하고 DB삭제,DB수정함
        var url = "/jtadm/brand/romason/romasonProFileDel?bseq=${romason.seq}&fseq="+seq+"&key="+key;

        //alert(url);

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

//ajax통신으로 카테고리 등록
function Jt_cateProc(){

	//카테고리명을 입력해 주세요.
    var f = document.cateForm;
    var url = "/jtadm/brand/romason/romasonCateProc?cateName=" + f.cateName.value;
    
    //alert(url);

    $.ajax({
        type : "GET",
        url : url,
        dataType : "json",
        error : function(){
            alert('통신실패!!');
        },
        success : function(data){

        	var code = data.code;
			var name = data.name;
			
			const arrcode = code.split("#####");
			const arrname = name.split("#####");
			
			$("#SignCategory").empty();
			$("#SignCategory").append("<option value='0'>카테고리 전체</option>");
			for(i=1; i<arrcode.length; i++) {
				$("#SignCategory").append("<option value='"+arrcode[i]+"'>"+arrname[i]+"</option>");
			}
			$('#cateName').val(''); 
			$('.layerPopup.categoryAdd').fadeOut();

			alert("카테고리가 새로 등록되었습니다.");
        }
    });
    return false;
}
</script>
</head>
<body>
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/headerAndMenu.jsp" %>

<form name="processForm" id="processForm" enctype="multipart/form-data"  method="post"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq" value="${romason.seq}"/>
<input type="hidden" name="cpage" value="${search.cpage}" />
<input type="hidden" name="pg_rows" value="${search.pg_rows}" />
<input type="hidden" name="keyIsnt" value="${search.keyIsnt}" />
<input type="hidden" name="key" value="${search.key}" />
<input type="hidden" name="keyword" value="${search.keyword}" />
<input type="hidden" name="total_rows" value="${search.total_rows}" />



		<div id="container" class="brandMgmt romansonMgmt productReg">
		    <!--로만손 제품 등록-->
            <section class="topSubCntn">
                <c:if test="${processKey eq 'Insert'}">
                <div class="infoText">
                    <h3>로만손 제품 등록</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : PC 최소 (400x400) px / Mobile 최소 (300x300) px</span>
                </div>
                <a href="#" onclick="Jt_submit()" class="commBtn black">등록</a>
                </c:if>
                <c:if test="${processKey eq 'Update'}">
                <div class="infoText">
                    <h3>로만손 제품 수정</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : PC 최소 (400x400) px / Mobile 최소 (300x300) px</span>
                </div>
                <a href="#" onclick="Jt_delete()" class="commBtn white"><img src="/jtadm/images/admin/icon_btn_del.svg"/>삭제</a>
                <a href="#" onclick="javascript:history.back()" class="commBtn white">목록</a>
                <a href="#" onclick="Jt_submit()" class="commBtn black">저장</a>
                </c:if>
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
                            <th>등록일</th>
                            <td>
                                <div class="datepicker oneDay">
                                    <input name="regdate" value="${romason.regdate}" type="text" class="selectDate" onKeyup="directDate(this);" placeholder="등록일 yyyy-mm-dd"/>
                                </div>
                            </td>
                            <th>NEW ARRIVALS 노출 여부</th>
                            <td>
                                <div class="radioButton">
                                    <input type="radio" name="viewYn" value="Y" id="arrilvalsOpenY" <c:if test="${romason.viewYn eq 'Y'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="openY">Y</label>
                                </div>
                                <div class="radioButton">
                                    <input type="radio" name="viewYn" value="N" id="arrilvalsOpenN" <c:if test="${romason.viewYn eq 'N'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="openN">N</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>카테고리 <span class="colorRed">*</span></th>
                            <td class="cate">
                                <select class="select" name="categorySeq" id="SignCategory">
			                        <option value="0">카테고리 전체</option>
						            <c:forEach var="categoryList" items="${categoryList}" varStatus="status">
				                    <option value="${categoryList.seq}" <c:if test="${romason.categorySeq eq categoryList.seq}">selected</c:if>>${categoryList.cateName}</option>
				                    </c:forEach>
	                            </select>
                                <button class="cateBtn">카테고리 추가</button>
                            </td>
                            <th>게시여부</th>
                            <td>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="Y" id="openY" <c:if test="${romason.isntYn eq 'Y'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="openY">Y</label>
                                </div>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="N" id="openN" <c:if test="${romason.isntYn eq 'N'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="openN">N</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>제품명 <span class="colorRed">*</span></th>
                            <td colspan="3">
                                <input type="text" name="proName" value="${romason.proName}" class="enterText" placeholder="제품명을 입력해주세요."/>
                            </td>
                        </tr>
                        
                        <c:forEach var="i" begin="0" end="4" step="1">
                        	
                        	<c:if test = "${i eq 0}"><tr></c:if>
                        	<c:if test = "${(i eq 2) || (i eq 4)}"></tr><tr></c:if>
                        	
                        	<th>제품 이미지 ${i+1} 
	                        	<c:if test = "${i eq 0}"><span class="colorRed">*</span><br/><span class="s_text">(메인썸네일이미지)</span></c:if>
	                        </th>
		                    <td class="file">
	                            <div class="fileField">
		                            <input type="hidden" name="fileViewSeq" value="${romason.fileViewSeq[i]}">
	                        		<input type="file" name="uploadFile" multiple="multiple" class="action"  onchange="fileExtCheck(this)"/>
	                        		<div class="addFile">
		                            	<c:choose>
		                                	<c:when test="${romason.fileViewName[i] ne '' and romason.fileViewName[i] ne null}">
		                                    	<div class="viewInfo">
			                                        <span class="name" id="SignName${i}"> ${romason.fileViewName[i]} </span> 
			                                        <span class="size" id="SignSize${i}">(<i>${romason.fileViewSize[i]}</i>byte)</span>
			                                        <span class="seq" id="SignSeq${i}"><a href='#' onclick="Jt_fileDelete('${romason.fileViewSeq[i]}','${i}')"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>
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
	                        
	                        <c:if test = "${i eq 4}"><th>&nbsp;</th><td>&nbsp;</td></tr></c:if>
	                        
                        </c:forEach>
                    </table>
                </article>
            </section>
            <!--//로만손 제품 등록-->

            <!--로만손 상세정보-->
            <section class="topSubCntn">
                <div class="infoText">
                    <h3>로만손 상세정보</h3>
                </div>
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
                            <th>Size</th>
                            <td>
                                <input type="text" name="proSize" value="${romason.proSize}" class="enterText" placeholder="Size"/>
                            </td>
                            <th>Material</th>
                            <td>
                                <input type="text" name="proMeterial" value="${romason.proMeterial}" class="enterText" placeholder="Material"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Glass</th>
                            <td>
                                <input type="text" name="proGlass" value="${romason.proGlass}" class="enterText" placeholder="Glass"/>
                            </td>
                            <th>Band</th>
                            <td>
                                <input type="text" name="proBand" value="${romason.proBand}" class="enterText" placeholder="Band"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Water Resistance</th>
                            <td colspan="3">
                                <input type="text" name="proWater" value="${romason.proWater}" class="enterText" placeholder="Water Resistance"/>
                            </td>
                        </tr>
                    </table>
                </article>
            </section>
</form>
            <!--//로만손 상세정보-->

            <!--카테고리 추가-->
<form name="cateForm" id="cateForm" method="get"> 
            <div class="layerPopup categoryAdd">
                <div class="popData">
                    <h5>카테고리 추가<span class="close"><img src="/jtadm/images/admin/icon_popup_close.svg"/></span></h5>
                    <div class="tb">
                        <table>
                            <colgroup>
                                <col width="215">
                                <col width="*">
                            </colgroup>
                            <tr>
                                <th>카테고리 추가</th>
                                <td><input type="text" name="cateName" id="cateName" class="enterText" placeholder="카테고리를 입력해주세요."/></td>
                            </tr>
                        </table>
                    </div>
                    <div class="button">
                        <a href="#" class="commBtn white cancle">취소</a>
                        <a href="#" onclick="Jt_cateProc()" class="commBtn black save">추가</a>
                    </div>
                </div>
            </div>
</form>
            <!--//카테고리 추가-->
        </div>


        <%@ include file="/WEB-INF/views/adm/jtcommon/html.footer.jsp" %>  
   
    </div>
</body>
</html>










