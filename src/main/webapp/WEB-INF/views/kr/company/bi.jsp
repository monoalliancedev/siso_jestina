<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %> 
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/company.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/company.css" />
        <div id="container" class="sub company identity">
            <!--Top Common-->
            <section class="subTop">
                <article>
                    <ul class="location">
                        <li><a href="/">HOME</a></li>
                        <li class="dep1"></li>
                        <li class="depmenu"><span class="now">&nbsp;</span><div class="dep2List"></div></li>
                    </ul>
                    <h3 class="pageTitle"></h3>
                </article>
            </section>
            <!--//Top Common-->
            <section class="content">
                <article class="topText">
                    <h4>한국을 대표하는 주얼리 &amp; 핸드백 브랜드<br/>제이에스티나</h4>
                    <div>
                        현대를 살아가는 여성들의 라이프스타일을<br/>
                        트렌디한 감성으로 재해석해 꿈과 로망이 아름답고 찬란하게 빛나는 순간을 함께 합니다.
                    </div>
                </article>
                <article class="biInfo">
                    <h6>BI 소개</h6>
                    <div>
                        <span class="symbol"><img src="/images/company_bi_symbol.png"/></span>
                        <span class="logo"><img src="/images/company_bi_logo.png"/></span>
                    </div>
                </article>
                <article class="colorInfo">
                    <div>
                        <span class="box">J.ESTINA PINK<b>PANTONE&nbsp;&nbsp;&nbsp;176 C</b></span>
                        <ul>
                            <li><b>C</b> 0</li>
                            <li><b>M</b> 42</li>
                            <li><b>Y</b> 17</li>
                            <li><b>K</b> 0</li>
                        </ul>
                        <ul>
                            <li><b>R</b> 62</li>
                            <li><b>G</b> 57</li>
                            <li><b>B</b> 100</li>
                        </ul>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>