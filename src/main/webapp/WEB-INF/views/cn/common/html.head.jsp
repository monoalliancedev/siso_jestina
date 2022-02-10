<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="CurNow" class="java.util.Date" />
<fmt:parseDate value="202202180000" pattern="yyyyMMddHHmm" var="openStartDate" />
<fmt:parseDate value="202202202359" pattern="yyyyMMddHHmm" var="openEndDate" />
 
<fmt:formatDate value="${CurNow}" pattern="yyyyMMddhhmm" var="CurNowDate" />           <%-- 오늘날짜 --%>
<fmt:formatDate value="${openStartDate}" pattern="yyyyMMddHHmm" var="openDate"/>       <%-- 시작날짜 --%>
<fmt:formatDate value="${openEndDate}" pattern="yyyyMMddHHmm" var="closeDate"/>        <%-- 마감날짜 --%>
<c:if test="${openDate <= CurNowDate && closeDate >= CurNowDate}">
    <c:redirect url="/openning"/>
</c:if>

<title>J.ESTINA</title>
<meta charset="utf-8" />
<meta name="description" content="뮤즈 아이유가 선택한 로맨틱 무드 윈터 주얼리">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    
    <!-- 오픈 그래프 -->
	<meta property="og:type" content="website"> 
	<meta property="og:title" content="J.ESTINA">
	<meta property="og:description" content="뮤즈 아이유가 선택한 로맨틱 무드 윈터 주얼리">
	<meta property="og:image" content="http://romanson12.cafe24.com/myimage.jpg">
	<meta property="og:url" content="http://romanson12.cafe24.com">
	<meta name="twitter:card" content="summary">
	<meta name="twitter:title" content="J.ESTINA">
	<meta name="twitter:description" content="뮤즈 아이유가 선택한 로맨틱 무드 윈터 주얼리">
	<meta name="twitter:image" content="http://romanson12.cafe24.com/myimage.jpg">
	<meta name="twitter:domain" content="http://romanson12.cafe24.com">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-VNFFPD6DLT"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	  gtag('config', 'G-VNFFPD6DLT');
	</script>

    <!-- favicon -->
	<link href="/images/jtfavicon.ico" rel="icon" type="image/x-icon">
	
	
	<!-- J.ESTINA -->
	<link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/rem.css" />
    <link rel="stylesheet" type="text/css" href="/css/font/NotoSansKR.css" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@500&display=swap">
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/css/lang/Chinese.css" />
    <script type="text/javascript" src="/scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/scripts/common.js"></script>
    
    
    
    