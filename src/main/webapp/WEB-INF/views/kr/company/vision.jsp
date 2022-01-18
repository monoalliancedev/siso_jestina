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
        <div id="container" class="sub company vision">
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
            <section class="topVisual"></section>
            <section class="content">
                <h4>J.ESTINA’s VISION</h4>
                <div>
                    <ul>
                        <li><span class="icon"><img src="/images/company_icon_01.png"/></span></li>
                        <li class="btext">New Lifestyle</li>
                        <li class="stext">우리는 패션, 문화, 예술을 융합한<br/>New Lifestyle을 창조함으로써<br/>세상을 좀 더 행복하게 만듭니다.</li>
                    </ul>
                    <ul>
                        <li><span class="icon"><img src="/images/company_icon_02.png"/></span></li>
                        <li class="btext">창의력과 도전정신</li>
                        <li class="stext">우리는 창의력과 도전정신을 최상이<br/>기존으로 우리의 꿈을 실현합니다.</li>
                    </ul>
                    <ul>
                        <li><span class="icon"><img src="/images/company_icon_03.png"/></span></li>
                        <li class="btext">Global Group</li>
                        <li class="stext">글로벌 50대 패션그룹 진입, 2030년까지<br/>우리가 해내겠습니다.</li>
                    </ul>
                </div>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>