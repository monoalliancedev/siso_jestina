<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <div id="container" class="sub company vision">
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
            <section class="topVisual"></section>
            <section class="content">
                <article>
                    <div>
                        <h4>VISION</h4>
                        <p><b>Global Lifestyle Creator</b> who shares every shining moment.</p>
                    </div>
                    <div>
                        <h4>MISSION</h4>
                        <p>- <b>We make the world happier by creating</b> a <b>New Lifestyle</b> that combines fashion, culture, and art.</p>
                        <p>- Through constant innovation, we will <b>create our own cultural values</b> and <b>spread them around the world.</b></p>
                    </div>
                    <div>
                        <h4>Core values</h4>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_01.png"/></span></li>
                            <li class="text"><span>Creativity</span></li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_02.png"/></span></li>
                            <li class="text"><span>Challenge</span></li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_03.png"/></span></li>
                            <li class="text"><span>Trust</span></li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_04.png"/></span></li>
                            <li class="text"><span>Communication</span></li>
                        </ul>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/en/common/html.footer.jsp" %>
    </div>
</body>
</html>