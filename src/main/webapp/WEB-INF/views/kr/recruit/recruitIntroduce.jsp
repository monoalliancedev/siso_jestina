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
        <div id="container" class="sub recruit duty">
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
                <article class="tab">
                    <ul>
                        <li><a href=".design" class="on">DESIGN</a></li>
                        <li><a href=".sales">SALES</a></li>
                        <li><a href=".marketing">MAKETING</a></li>
                        <li><a href=".merchandising">MERCHANDISING</a></li>
                        <li><a href=".platformLogistic">PLATFORM/LOGISTIC</a></li>
                        <li><a href=".management">MANAGEMENT</a></li>
                    </ul>
                </article>
            </section>
            <!--//Top Common-->
            <section class="content">
                <!--Tab Design-->
                <article class="tabData design">
                    <!--Info Text-->
                    <div class="infoText">
                        <h5>DESIGN</h5>
                        고객 성향과 시장 동향을 정확하게 파악하여 마켓의 니즈를 충족시키는 제품을 디자인,<br/>
                        나아가 경쟁력 있는 제품 디자인을 통해 브랜드 파워를 강화하고 이익의 극대화를 위해 기여합니다.<br/>
                        예술가적인 의견보다는 발전적이고 현실적인 아이디어를 제시하며, 조직구성원과의 원활한 커뮤니케이션을 이끌어 내는 능력이 중요합니다.
                    </div>
                    <!--//Info Text-->
                    <dl>
                        <dt><img src="/images/recruit_duty_01.jpg"/></dt>
                        <dd>
                            <ul>
                                <li><b>선배인터뷰</b><b>시계디자인 담당자</b></li>
                                <li class="tit"><span>패션 제품디자인에 관심이 많은 분이라면</span>언제나 환영합니다.</li>
                                <li class="text">안녕하세요. 저는 J.ESTINA에서 시계디자인을 담당하고 있습니다.<br/> 매년 스위스에서 열리는 시계 전시회은 Baselworld 페어, 프랑스 파리의 비조르카 Bijorcha 패션 주얼리 페어 등의 해외 전시 등에 참관하여 국제 시계 Trend 및 패션 주얼리 소재를  분석하고, 매 시즌 새로운 컨셉의 시계디자인을 기획하고 있습니다. 제이에스티나 시계디자인은 타 브랜드와의 차별화된 시즌 기획, 디자인, 구조설계, 샘플링 등을 통하여 독보적인 기술 개발로 주얼리 시계 디자인을 개발해 내고 있습니다. 시계디자인은 섬세한 성격을 갖추고, 패션 제품디자인에 관심이 많은 분들이라면 자신감 있게 도전해 보세요.</li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt><img src="/images/recruit_duty_02.jpg"/></dt>
                        <dd>
                            <ul>
                                <li><b>선배인터뷰</b><b>핸드백디자인</b></li>
                                <li class="tit"><span>핸드백디자인은 따뜻한 감성과 창의력을 갖추고</span>트렌드를<br/> 빠르게 파악할 수 있는 인재를 환영합니다.</li>
                                <li class="text">안녕하세요. 저는 J.ESTINA에서 핸드백디자인을 담당하고 있습니다.<br/>여성에게 가방은 단순한 수납도구를 넘어서 그 이상의 의미를 갖습니다. 핸드백 디자인실은 기획, 디자인, 샘플링, 품평까지 한 시즌의 핸드백이 출시되는 과정을 전반적으로 컨트롤 하는 부서 입니다. 빠르게 돌아가는 업계 특성상 창의력과 순발력은 기본적으로 가져야 할 덕목입니다. 또한 아름다우 면서 실용적인 가방을 만든다는 것은 많은 분들과 협업하고 소통해야 하는 과정입니다. 관련 다른 부서와의 커뮤니케이션 능력과 배려심이 그 중에서도 제일 필요한 덕목이라고 생각합니다.핸드백디자인 팀은 순발력, 창의력, 더불어 따뜻한 감성과 트렌드를 빠르게 파악할 수 있는 인재를 환영합니다.</li>
                            </ul>
                        </dd>
                    </dl>
                </article>
                <!--//Tab Design-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>