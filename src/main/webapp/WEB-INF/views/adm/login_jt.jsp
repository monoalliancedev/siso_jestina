<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>J.ESTINA</title>
    <link rel="stylesheet" type="text/css" href="/jtadm/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/jtadm/css/font/NotoSansKR.css" />
    <link rel="stylesheet" type="text/css" href="/jtadm/css/jquery-ui-custom.css" />
    <link rel="stylesheet" type="text/css" href="/jtadm/css/admin/admin.css" />
    <script type="text/javascript" src="/jtadm/scripts/jquery-1.10.2.min.js"></script>
    
    
<script>
$(document).ready(function () {
	
	var cookieID = getCookie("ncookie");
	
	if (cookieID) { //쿠키있어요.
		document.loginForm.username.value = cookieID;
		$("input:checkbox[id='saveID']").prop("checked", true);
	}
	
	<c:if test="${errorMsg eq 'Fail'}">
	alert("로그인 정보가 잘못되었습니다.\n다시 확인해주세요.");
	</c:if>
	
	$("#username").focus();
});

//쿠키 가져오기 함수
function getCookie(cName) {
	
	cName = cName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cName);
	var cValue = '';
	if(start != -1) {
		start += cName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1) end = cookieData.length;
		cValue = cookieData.substring(start, end);
	}
	return unescape(cValue);
}

//쿠키설정
function setCookie( name, value, expiredays ){ 
	var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function dataCheck(f){
	
	if (f.username.value==""){
		alert("아이디를 입력하세요.");
		f.username.focus();
		return false;
	}
	if (f.password.value==""){
		alert("비밀번호를 입력하세요.");
		f.password.focus();
		return false;
	}	

	if ($("input:checkbox[id='saveID']").is(":checked")) {
		setCookie( "ncookie", document.loginForm.username.value , 1 ); 
	}else{
		setCookie( "ncookie", "" , 1 ); 
	}
}

</script>
</head>

<body>
<form name="loginForm" method="post" onSubmit="return dataCheck(this)" class="loginWrap">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 					
        <h3 class="logLogo"><img src="/jtadm/images/admin/logo.svg"/></h3>
        <ul>
            <li><input type="text" name="username" id="username" value=""  class="logEnter id" placeholder="아이디를 입력해주세요."/></li>
            <li><input type="password" name="password" id="password" value=""  class="logEnter pw" placeholder="비밀번호를 입력해주세요."/></li>
            <li>*아이디, 비밀번호 분실시 관리자에 문의해주세요.</li>
        </ul>
        <button type="submit" class="logButton">LOGIN</button>
        <div class="bottom">
            <div class="checkBox hasLabel">
                <input type="checkbox" id="saveID"/>
                <i>&nbsp;</i>
                <label for="saveID"><a href="#" onclick="jt_login()">아이디 저장</a></label>
            </div>
            <span>02-2190-7089 / <a href="mailto:platform@jestina. com">platform@jestina.com</a></span>
        </div>
    </form>
    <div class="logFooter">COPYRIGHT © 2022.J.ESTINA RESERVED.</div>
    
    
</body>
</html>