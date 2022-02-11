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

<c:if test="${processKey eq 'Update'}">
//첨부파일 리스트 loding
$(document).ready(function(){
	loadAttachFiles('${pseq}','KR');
	loadAttachFiles('${pseq}','EN');
	loadAttachFiles('${pseq}','CN');
	loadAttachFiles('${pseq}','MoKR');
	loadAttachFiles('${pseq}','MoEN');
	loadAttachFiles('${pseq}','MoCN');
});
</c:if>

//값이 비어 있는지 체크
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
					<c:if test="${(muse.isntYn eq 'Y') && (muse.seq>0)}">
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
	if(isBlank(f.museYear)) {
		alert( "뮤즈 년도를 설정해주세요.");
		f.museYear.focus();
		return;
	}
	
	var langKey;
	var ck = true;
	// 체크된 체크박스의 value 값을 가지고 온다.
	$('input:checkbox[name=langArr]:checked').each(function() { 
     	langKey = this.value; //KR,EN,CN
     		
     	if($("#name"+langKey).val()=="") {
			alert( langKey + " 뮤즈 이름을 입력해주세요.");
			$("#name"+langKey).focus();
			ck = false;
			return false;
		}
     	if($("#cate"+langKey).val()=="") {
			alert( langKey + " 뮤즈 카테고리를 입력해주세요.");
			$("#cate"+langKey).focus();
			ck = false;
			return false;
		}

		if($("#files_isKey_"+langKey).val()=="") {
			alert( langKey + "이미지를 설정해주세요.");
			$("#cate"+langKey).focus();
			ck = false;
			return false;
		}
    });
    
	if(ck) {
		f.action = "proc";
		f.submit();
	}
}  

//전체 삭제 
function Jt_delete(seq){
	if (confirm("삭제하시겠습니까?\n한번 삭제되면 복구가 어렵습니다.")){
		var f = document.processForm;
		f.cpage.value = 1;
		f.action="del";
		f.submit();
	}
}

//파일 개별 삭제 
function Jt_fileDelete(seq,key){
	if (confirm("파일이 삭제됩니다. 삭제하시겠습니까?")){
		var formData = new FormData();
		formData.append("seq",seq);
		formData.append("${_csrf.parameterName}","${_csrf.token}");
		$.ajax({
			type: "POST",
			data:formData,
			processData: false,
		    contentType: false,
			url:"/jtadm/jtcommon/uploadFileDel",
			dataType:"json",
			success:function(data){

				if (data.rs == "Y"){
					loadAttachFiles('${pseq}',key);
				}
			},
			error:function(xhr, status, errorThrown){
				//alert(status);
			}
		});
	}
}

//파일 뿌려주기
function loadAttachFiles(pseq,key)
{
	//alert("/jtadm/jtcommon/getAttachFiles?pseq="+pseq+"&gubun=${gubun}&key="+key);
	
	$.ajax({
		type: "GET",
		url:"/jtadm/jtcommon/getAttachFiles?pseq="+pseq+"&gubun=${gubun}&key="+key,
		dataType:"json",
		success:function(data){
			
			var files_html = "";
			var files_isKey = "";

			$.each(data.list, function(k,v) {
				files_html += '<div id="viewInfo">';
				files_html += '<span class="name">' + v.filename + '</span>';
				files_html += '<span class="size">(' + Math.ceil(v.file_size/1024).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + 'KB)</span>';
				files_html += '<span class="seq"><a href="#" onclick="Jt_fileDelete('+v.seq+',&quot;'+key+'&quot;)"><img src="/jtadm/images/admin/icon_file_del.svg" title="첨부파일 삭제"></a></span>';
				files_html += '</div>';
				files_isKey = "fileIsOK";
			});

			
        	
			if (files_isKey == ""){
				files_html ="<div class='viewInfo'><span class='name'>첨부된 파일이 없습니다.</span><span class='size'></span></div>";
            }

			$("#files_panel_"+key).html(files_html);
			$("#files_isKey_"+key).val(files_isKey);
		},
		error:function(xhr, status, errorThrown){
			//alert(status);
		}
	});
}

//파일 업로드 팝업창
function Jt_openFile(key){

	cw=700;
	ch=300;

	sw=screen.availWidth;
	sh=screen.availHeight;

	px=(sw-cw)/2;
	py=(sh-ch)/2;

	opt = "top="+py+",left="+px+",width="+cw+",height="+ch+",toolbar=no,menubar=no,status=no,scrollbars=yes,resizable=yes";
	window.open("/jtadm/jtcommon/uploadFileForm?gubun=${gubun}&pseq=${pseq}&key="+key,"uploadFile",opt);
}
</script>                                   
</head>
<body>
    <div id="wrap">
        
        <%@ include file="/WEB-INF/views/adm/jtcommon/headerAndMenu.jsp" %>

<form name="processForm" id="processForm" method="post"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq" value="${muse.seq}"/>
<input type="hidden" name="pseq" value="${pseq}"/>
<input type="hidden" name="cpage" value="${search.cpage}" />
<input type="hidden" name="pg_rows" value="${search.pg_rows}" />
<input type="hidden" name="keyIsnt" value="${search.keyIsnt}" />
<input type="hidden" name="key" value="${search.key}" />
<input type="hidden" name="keyword" value="${search.keyword}" />
<input type="hidden" name="total_rows" value="${search.total_rows}" />

		<div id="container" class="brandMgmt museReg">
		    <!--상단-->
            <section class="topSubCntn">
                <c:if test="${processKey eq 'Insert'}">
                <div class="infoText">
                    <h3>뮤즈관리 등록</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : PC 최소 (1920x990) px / Mobile 최소 (720x1170) px</span>
                </div>
                <a href="#" onclick="Jt_submit()" class="commBtn black">등록</a>
                </c:if>
                <c:if test="${processKey eq 'Update'}">
                <div class="infoText">
                    <h3>뮤즈관리 수정</h3>
                    <span class="colorRed">*이미지 등록 사이즈 : PC 최소 (1920x990) px / Mobile 최소 (720x1170) px</span>
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
                                    <input type="checkbox" name="langArr" id="langKR" onclick="Jt_langCheck('KR')" value="KR" <c:if test = "${fn:contains(muse.lang, 'KR')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langKR">KR</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" id="langEN" onclick="Jt_langCheck('EN')" value="EN" <c:if test = "${fn:contains(muse.lang, 'EN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langEN">EN</label>
                                </div>
                                <div class="checkBox hasLabel">
                                    <input type="checkbox" name="langArr" id="langCN" onclick="Jt_langCheck('CN')" value="CN" <c:if test = "${fn:contains(muse.lang, 'CN')}">checked</c:if> />
                                    <i>&nbsp;</i>
                                    <label for="langCN">CN</label>
                                </div>
                            </td>
                            <th>등록일</th>
                            <td>
                                <div class="datepicker oneDay">
                                    <input name="regdate" value="${muse.regdate}" type="text" class="selectDate" onKeyup="directDate(this);" placeholder="등록일 yyyy-mm-dd"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>텍스트 정렬</th>
                            <td colspan=3>
                            	<input type="radio" name="textLocation" id="textLocation" value="Left"  <c:if test="${muse.textLocation eq 'Left'}">checked</c:if>  /> 왼쪽
                            	<input type="radio" name="textLocation" id="textLocation" value="Right" <c:if test="${muse.textLocation eq 'Right'}">checked</c:if> /> 오른쪽
                            </td>
                        </tr>
                        <tr>
                            <th>뮤즈년도 <span class="colorRed">*</span></th>
                            <td>
                            	<select class="select year" name="museYear">
                                    <option value="">년도</option>
                                    <c:forEach var="i" begin="0" end="${loopCnt}">
                                    <option value="${curYear-i}" <c:if test="${muse.museYear eq (curYear-i)}">selected</c:if>>${curYear-i}</option>
                                    </c:forEach>
                            	</select>
                            </td>
                            <th>게시여부</th>
                            <td>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="Y" id="openY" <c:if test="${muse.isntYn eq 'Y'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="openY">Y</label>
                                </div>
                                <div class="radioButton">
                                    <input type="radio" name="isntYn" value="N" id="openN" <c:if test="${muse.isntYn eq 'N'}">checked</c:if>/>
                                    <i>&nbsp;</i>
                                    <label for="openN">N</label>
                                </div>
                            </td>
                        </tr>
                        <tr id=nameTrKR>
                            <th>뮤즈 이름 (KR) <span class="colorRed">*</span></th> 
                            <td><input type="text" name="nameKr" id="nameKR" value="${muse.nameKr}" class="enterText" placeholder="뮤즈 이름 (KR)을 입력해주세요."/></td>
                            <th>뮤즈 카테고리 (KR) <span class="colorRed">*</span></th>
                            <td><input type="text" name="cateKr" id="cateKR" value="${muse.cateKr}" class="enterText" placeholder="뮤즈 카테고리 (KR)를 입력해주세요."/></td>
                        </tr>
                        <tr id=nameTrEN>
                            <th>뮤즈 이름 (EN) <span class="colorRed">*</span></th>
                            <td><input type="text" name="nameEn" id="nameEN" value="${muse.nameEn}" class="enterText" placeholder="뮤즈 이름 (EN)을 입력해주세요."/></td>
                            <th>뮤즈 카테고리 (EN) <span class="colorRed">*</span></th>
                            <td><input type="text" name="cateEn" id="cateEN" value="${muse.cateEn}" class="enterText" placeholder="뮤즈 카테고리 (EN)를 입력해주세요."/></td>
                        </tr>
                        <tr id=nameTrCN>
                            <th>뮤즈 이름 (CN) <span class="colorRed">*</span></th>
                            <td><input type="text" name="nameCn" id="nameCN" value="${muse.nameCn}" class="enterText" placeholder="뮤즈 이름 (CN)을 입력해주세요."/></td>
                            <th>뮤즈 카테고리 (CN) <span class="colorRed">*</span></th>
                            <td><input type="text" name="cateCn" id="cateCN" value="${muse.cateCn}" class="enterText" placeholder="뮤즈 카테고리 (CN)를 입력해주세요."/></td>
                        </tr>
                        <tr id=linkTrKR>
                            <th>링크주소 (KR)</th>
                            <td class="url" colspan=3>
                                <select class="select" name="linkKrOutYn">
                                    <option value="N" <c:if test="${muse.linkKrOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${muse.linkKrOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${muse.linkKrOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkKr" value="${muse.linkKr}" class="enterText" placeholder="링크주소(KR) URL을 입력해주세요."/>
                            </td>
                        </tr>
                        <tr id=linkTrEN>
                            <th>링크주소 (EN)</th>
                            <td class="url" colspan=3>
                                <select class="select" name="linkEnOutYn">
                                    <option value="N" <c:if test="${muse.linkEnOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${muse.linkEnOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${muse.linkEnOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkEn" value="${muse.linkEn}" class="enterText" placeholder="링크주소(EN) URL을 입력해주세요."/>
                            </td>
                        </tr>
                        <tr id=linkTrCN>
                            <th>링크주소 (CN)</th>
                            <td class="url" colspan=3>
                                <select class="select" name="linkCnOutYn">
                                    <option value="N" <c:if test="${muse.linkCnOutYn eq 'N'}">selected</c:if>>없음</option>
                                    <option value="C" <c:if test="${muse.linkCnOutYn eq 'C'}">selected</c:if>>현재창</option>
                                    <option value="Y" <c:if test="${muse.linkCnOutYn eq 'Y'}">selected</c:if>>새창</option>
                                </select>
                                <input type="text" name="linkCn" value="${muse.linkCn}" class="enterText" placeholder="링크주소(CN) URL을 입력해주세요."/>
                            </td>
                        </tr>
                        <tr id=FileTrKR>
                            <th>이미지 (KR) <span class="colorRed">*</span></th>
                            <td class="file" colspan=3>
                                <div class="fileField">
	                                <a href="#" onclick="Jt_openFile('KR')" class="action">파일선택</a>
	                                <input type="hidden" id="files_isKey_KR" value="">
                                    <div id="files_panel_KR" class="addFile">
										<div class="viewInfo">
                                        <span class="name">첨부된 파일이 없습니다.</span> 
                                        <span class="size"></span>
                                        </div>	
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr id=FileTrEN>
                            <th>이미지 (EN) <span class="colorRed">*</span></th>
                            <td class="file" colspan=3>
                                <div class="fileField">
                                    <a href="#" onclick="Jt_openFile('EN')" class="action">파일선택</a>
                                    <input type="hidden" id="files_isKey_EN" value="">
                                    <div id="files_panel_EN" class="addFile">
										<div class="viewInfo">
                                        <span class="name">첨부된 파일이 없습니다.</span> 
                                        <span class="size"></span>
                                        </div>			
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr id=FileTrCN>
                            <th>이미지 (CN) <span class="colorRed">*</span></th>
                            <td class="file" colspan=3>
                                <div class="fileField">
                                    <a href="#" onclick="Jt_openFile('CN')" class="action">파일선택</a>
                                    <input type="hidden" id="files_isKey_CN" value="">
                                    <div id="files_panel_CN" class="addFile">
										<div class="viewInfo">
                                        <span class="name">첨부된 파일이 없습니다.</span> 
                                        <span class="size"></span>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr id=MoFileTrKR>
                            <th>MO 이미지 (KR) <span class="colorRed">*</span></th>
                            <td class="file" colspan=3>
                                <div class="fileField">
	                                <a href="#" onclick="Jt_openFile('MoKR')" class="action">파일선택</a>
	                                <input type="hidden" id="files_isKey_MoKR" value="">
                                    <div id="files_panel_MoKR" class="addFile">
										<div class="viewInfo">
                                        <span class="name">첨부된 파일이 없습니다.</span> 
                                        <span class="size"></span>
                                        </div>	
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr id=MoFileTrEN>
                            <th>MO 이미지 (EN) <span class="colorRed">*</span></th>
                            <td class="file" colspan=3>
                                <div class="fileField">
                                    <a href="#" onclick="Jt_openFile('MoEN')" class="action">파일선택</a>
                                    <input type="hidden" id="files_isKey_MoEN" value="">
                                    <div id="files_panel_MoEN" class="addFile">
										<div class="viewInfo">
                                        <span class="name">첨부된 파일이 없습니다.</span> 
                                        <span class="size"></span>
                                        </div>			
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr id=MoFileTrCN>
                            <th>MO 이미지 (CN) <span class="colorRed">*</span></th>
                            <td class="file" colspan=3>
                                <div class="fileField">
                                    <a href="#" onclick="Jt_openFile('MoCN')" class="action">파일선택</a>
                                    <input type="hidden" id="files_isKey_MoCN" value="">
                                    <div id="files_panel_MoCN" class="addFile">
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
		$('#MoFileTr'+key).attr('style', "display:'';");  //나타내기
		$('#nameTr'+key).attr('style', "display:'';");  //나타내기
		
	}else{
		$('#linkTr'+key).attr('style', "display:none;");  //숨기기
		$('#FileTr'+key).attr('style', "display:none;");  //숨기기
		$('#MoFileTr'+key).attr('style', "display:none;");  //숨기기
		$('#nameTr'+key).attr('style', "display:none;");  //숨기기
	}
}
Jt_langCheck('KR');
Jt_langCheck('EN');
Jt_langCheck('CN');
</script> 









