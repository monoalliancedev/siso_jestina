<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/views/en/common/html.head.jsp" %>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/en/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/language/subEN.js"></script>
        <script type="text/javascript" src="/scripts/company.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/company.css" />
        <div id="container" class="sub company identity">
            <!--Top Common-->
            <section class="subTop">
                <article>
                    <ul class="location">
                        <li><a href="/en">HOME</a></li>
                        <li class="dep1"></li>
                        <li class="depmenu"><span class="now">&nbsp;</span><div class="dep2List"></div></li>
                    </ul>
                    <h3 class="pageTitle"></h3>
                </article>
            </section>
            <!--//Top Common-->
            <section class="content">
                <article class="topText">
                    <h4>J.ESTINA, a jewelry and handbag brand<br/>that represents South Korea</h4>
                    <div>
                        Reinterprets the lifestyle of women leading modern lives with trendy sentiments<br/>
                        to share the moments when their dreams and fantasies shine brightly and beautifully.
                    </div>
                </article>
                <article class="biInfo">
                    <h6>Brand identity</h6>
                    <div>
                        <span class="symbol"><img src="/images/company_bi_symbol.png"/></span>
                        <span class="logo"><img src="/images/company_bi_logo.png"/></span>
                    </div>
                </article>
                <article class="colorInfo">
                    <h6>Color</h6>
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
        <%@ include file="/WEB-INF/views/en/common/html.footer.jsp" %>
    </div>
</body>
</html>