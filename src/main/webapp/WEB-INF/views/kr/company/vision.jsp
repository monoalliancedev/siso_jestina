<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
                <article>
                    <div>
                        <h4>VISION</h4>
                        <p>빛나는 모든 순간을 함께 하는 <b>Global Lifestyle Creator</b></p>
                    </div>
                    <div>
                        <h4>MISSION</h4>
                        <p>- 우리는 패션, 문화, 예술을 융합한 <b>New Lifestyle</b>을<br/> <b>창조</b>함으로써 <b>세상을 더 행복하게 만듭니다.</b></p>
                        <p>- 우리는 끊임없는 혁신을 통해 <b>고유의 문화적 가치를 창출</b>하고<br/> 이를 <b>전세계에 널리 알리겠습니다.</b></p>
                    </div>
                    <div>
                        <h4>핵심가치</h4>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_01.png"/></span></li>
                            <li class="text"><span>창의성</span>Creativity</li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_02.png"/></span></li>
                            <li class="text"><span>도전정신</span>Challenge</li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_03.png"/></span></li>
                            <li class="text"><span>신뢰</span>Trust</li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_04.png"/></span></li>
                            <li class="text"><span>소통</span>Communication</li>
                        </ul>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>