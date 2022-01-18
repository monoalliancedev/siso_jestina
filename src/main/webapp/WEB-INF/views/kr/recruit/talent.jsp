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
        <script type="text/javascript" src="/scripts/recruit.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/recruit.css" />
        <div id="container" class="sub recruit talent">
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
            <section class="topVisual"></section>
            <!--//Top Common-->
            <section class="content">
                <article class="diagram">
                    <ul>
                        <li>
                            <span>J.ESTINA<br/>인재상</span>
                        </li>
                        <li>

                            <dl>
                                <dt><img src="/images/injae_diagram_icon_01.svg"/></dt>
                                <dd>창의성<br/>Creativity</dd>
                            </dl>
                            <dl>
                                <dt><img src="/images/injae_diagram_icon_02.svg"/></dt>
                                <dd>도전정신<br/>Challenge</dd>
                            </dl>
                            <dl>
                                <dt><img src="/images/injae_diagram_icon_03.svg"/></dt>
                                <dd>신뢰<br/>Trust</dd>
                            </dl>
                            <dl>
                                <dt><img src="/images/injae_diagram_icon_04.svg"/></dt>
                                <dd>소통<br/>Communication</dd>
                            </dl>
                        </li>
                    </ul>
                </article>
                <article class="diagramInfo">
                    <dl>
                        <dt>창의성  Creativity</dt>
                        <dd>열린 사고를 바탕으로 다양한 아이디어를 발굴하고<br/> 새로운 시야와 관점을 조직에 제안할 수 있는 창의적 인재</dd>
                        <dt>도전정신 Challenge</dt>
                        <dd>목표를 향한 강한 의지와 책임감을 바탕으로 실패를<br/> 두려워하지 않고 실행에 옮기며 도전적 경험을 통해 성장할 수 있는 인재</dd>
                        <dt>신뢰 Trust</dt>
                        <dd>윤리와 책임감의 가치를 알며, 조직과 구성원 사이, 동료와 동료 사이의 신뢰를 쌓아 이를 바탕으로 고객에게 신뢰받는 기업을 함께 만들어갈 수 있는 인재</dd>
                        <dt>소통 Communication</dt>
                        <dd>상대방의 관점에 대한 존중을 바탕으로 효율적인<br/> 커뮤니케이션이 가능한 인재, 원활한 협력과 Teamwork를 통한 시너지 효과를 창출하는 인재</dd>
                    </dl>
                </article> 
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>