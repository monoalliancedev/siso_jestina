<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%-- 오픈준비중 화면으로 이동  --%>
<jsp:useBean id="CurNow" class="java.util.Date" />
<fmt:parseDate value="202202181100" pattern="yyyyMMddHHmm" var="openStartDate" />
<fmt:parseDate value="202202211000" pattern="yyyyMMddHHmm" var="openEndDate" />
<fmt:formatDate value="${CurNow}" pattern="yyyyMMddHHmm" var="CurNowDate" />           <%-- 오늘날짜 --%>
<fmt:formatDate value="${openStartDate}" pattern="yyyyMMddHHmm" var="openDate"/>       <%-- 시작날짜 --%>
<fmt:formatDate value="${openEndDate}" pattern="yyyyMMddHHmm" var="closeDate"/>        <%-- 마감날짜 --%>

<%-- 도메인 주소받아욤  --%>
<c:set var="url">${pageContext.request.requestURL}</c:set>
<c:set var="Domain" value="${fn:replace(url, fn:substring(pageContext.request.requestURI, 0, fn:length(pageContext.request.requestURI)), pageContext.request.contextPath)}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>J.ESTINA</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />

    <meta name="title" content="J.ESTINA OFFICIAL" />
    <meta name="description" content="GLOBAL LIFESTYLE CREATOR J.ESTINA" />
    <meta name="keywords" content="J.ESTINA OFFICIAL" />
    <meta name="keyword" content="J.ESTINA OFFICIAL" />
    <meta name="image" content="${Domain}/images/common/logo.svg" />
    <meta name="author" content="J.ESTINA OFFICIAL">
    
    <!-- 오픈 그래프 -->
	<meta property="og:url" content="http://www.jestina.com" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="J.ESTINA OFFICIAL" />
    <meta property="og:description" content="GLOBAL LIFESTYLE CREATOR J.ESTINA" />
    <meta property="og:image" content="${Domain}/images/common/logo.svg" />
    <meta property="og:site_name" content="J.ESTINA OFFICIAL" />
    <meta property="og:locale" content="ko_KR" />
    <meta property="product:image" content="${Domain}/images/common/logo.svg" />
	

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
</head>
<body>
<img src="/images/coming_soon.png"/>
</body>
</html>

