﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <script type="text/javascript" src="/scripts/jquery.flexslider.js"></script>
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
            </section>
            <!--//Top Common-->
            <section class="content">
                <article class="tabButton">
                    <a href="#" class="prev"><img src="/images/tab_arrow_left.png"></a>
                    <div class="buttons"></div>
                    <a href="#" class="next"><img src="/images/tab_arrow_right.png"></a>
                </article>
                <article class="tabDataWrap">
                    <ul class="slides">
                        <li class="tabData" data-tab="DESIGN">
                            <!--Info Text-->
                            <div class="infoText">
                                <h5>DESIGN</h5>
                                고객 성향과 시장 동향을 정확하게 파악하여 마켓의 니즈를<br class="mo"> 충족시키는 제품을 디자인,<br class="pc">
                                나아가 경쟁력 있는 제품 디자인을<br class="mo"> 통해 브랜드 파워를 강화하고 이익의 극대화를 위해 기여합니다.<br class="pc">
                                예술가적인 의견보다는 발전적이고 현실적인 아이디어를 제시하며, 조직구성원과의 원활한 커뮤니케이션을 이끌어 내는<br class="mo"> 능력이 중요합니다.
                            </div>
                            <!--//Info Text-->
                            <dl>
                                <dt><img src="/images/recruit_duty_01.jpg"/></dt>
                                <dd>
                                    <ul>
                                        <li><b>선배인터뷰</b><b>시계디자인 담당자</b></li>
                                        <li class="tit"><span>패션 제품디자인에 관심이 많은 분이라면 <br class="mo"/>언제나 환영합니다.</span></li>
                                        <li class="text">안녕하세요. 저는 J.ESTINA에서 시계디자인을 담당하고<br class="mo"> 있습니다.<br class="pc"> 매년 스위스에서 열리는 시계 전시회은 Baselworld 페어, 프랑스 파리의 비조르카 Bijorcha 패션 주얼리 페어 등의 해외 전시 등에 참관하여 국제 시계 Trend 및 패션 주얼리 소재를  분석하고, 매 시즌 새로운 컨셉의 시계디자인을 기획하고<br class="mo"> 있습니다. 제이에스티나 시계디자인은 타 브랜드와의 차별화된 시즌 기획, 디자인, 구조설계, 샘플링 등을 통하여 독보적인 기술 개발로 주얼리 시계 디자인을 개발해 내고 있습니다.<br class="mo"> 시계디자인은 섬세한 성격을 갖추고, 패션 제품디자인에 관심이 많은 분들이라면 자신감 있게 도전해 보세요.</li>
                                    </ul>
                                </dd>
                            </dl>
                            <dl>
                                <dt><img src="/images/recruit_duty_02.jpg"/></dt>
                                <dd>
                                    <ul>
                                        <li><b>선배인터뷰</b><b>핸드백디자인</b></li>
                                        <li class="tit"><span>핸드백디자인은 따뜻한 감성과 창의력을 갖추고 트렌드를<br class="pc"/> 빠르게 파악할 수 있는 인재를<br class="mo"/> 환영합니다.</span></li>
                                        <li class="text">안녕하세요. 저는 J.ESTINA에서 핸드백디자인을 담당하고 <br class="mo">있습니다. <br class="pc">여성에게 가방은 단순한 수납도구를 넘어서 그 이상의 의미를 갖습니다. 핸드백 디자인실은 기획,<br class="pc"> 디자인, 샘플링, 품평까지 한 시즌의 핸드백이 출시되는 과정을 전반적으로 컨트롤 하는 부서 입니다. 빠르게 돌아가는 업계 특성상 창의력과<br class="mo"> 순발력은 기본적으로 가져야 할 덕목입니다. 또한 아름다우 면서 실용적인 가방을 만든다는 것은 많은 분들과 협업하고 소통해야 하는 과정입니다. 관련 다른 부서와의 커뮤니케이션 능력과 배려심이 그 중에서도 제일 필요한 덕목이라고 생각합니다.핸드백디자인 팀은 순발력, 창의력, 더불어 따뜻한 감성과 트렌드를 빠르게 파악할 수 있는 인재를 환영합니다.</li>
                                    </ul>
                                </dd>
                            </dl>
                        </li>
                        <li class="tabData" data-tab="SALES">
                            <!--Info Text-->
                            <div class="infoText">
                                <h5>SALES</h5>
                                브랜드를 총체적으로 Managing하는 하나의 축으로, 매출을 일으키는 판매관리/유통망 확보/브랜드 마케팅 기획,<br>
                                행정지원, 매장 인적 관리까지의 많은 분야를 담당합니다. 이에 관한 전반적 지식과 역량이 요구됩니다.
                            </div>
                            <!--//Info Text-->
                            <dl>
                                <dt><img src="/images/recruit_duty_03.jpg"/></dt>
                                <dd>
                                    <ul>
                                        <li><b>선배인터뷰</b><b>영업관리 담당자</b></li>
                                        <li class="tit"><span>대규모 유통시장 안에서 우리만의 브랜드와 매출을<br class="mo"> 관리하는<br class="pc">자부심을 느끼고 싶다면 자신있게<br class="mo"> 도전해주세요.</span></li>
                                        <li class="text">안녕하세요. 저는 J.ESTINA에서 백화점 영업관리를 담당하고 있습니다. <br class="pc">백화점 채널에서 매출,인원관리 등 매장운영에 관한 모든 업무를 전반적으로 담당하고 있으며 해당 직무를 수행하기 위해서는 영업 프로세스의 이해, 매출목표 및 수익관리, 판매분석 및 전략수립 등<br class="pc"> 전반적인 매장관리 능력이 필요로 합니다.<br/>업무 특성상 매장 내 인원, 지점 관계자와의 지속적으로 미팅을 통해 우리회사의 방향과 상대방의<br class="pc"> 의견을 조율해야 하는 업무가 대부분이기 때문에 활동적이면서 원활한 의사소통 능력이 좋은 사람이<br class="pc"> 적합할 것 같습니다. 유통시장 내에서 중요한 비중을 차지하고 있는 백화점, 그 안에서 한 브랜드의<br class="pc"> 매출을 관리한다는 자부심을 느끼고 싶다면 자신 있게 도전해주세요.</li>
                                    </ul>
                                </dd>
                            </dl>
                            <dl>
                                <dt><img src="/images/recruit_duty_04.jpg"/></dt>
                                <dd>
                                    <ul>
                                        <li><b>선배인터뷰</b><b>매장 매니저</b></li>
                                        <li class="tit"><span>우리 브랜드에 대한 애정과 아름다운 미소를<br class="mo"> 갖춘 분이라면 <br class="pc">언제나 환영합니다.</span></li>
                                        <li class="text">안녕하세요. 저는 J.ESTINA에서 직원들의 상품, 서비스교육, 고객관리를 담당하고 있는<br class="pc"> 슈퍼바이저입니다.<br/>특히 신입직원교육을 통해 제이에스티나의 브랜드컨셉 소개와 오랜 현장 경험을 바탕으로<br class="pc"> 판매노하우와 최고의 서비스에 대한 전파를 통해 직원의 역량이 지속적으로 강화될 있도록 지도하고<br/> 있습니다. 판매사원은 서비스마인드가 가장 중요하고 매장을 대표한다는 생각으로 책임감을 가지고<br class="pc"> 임해야 한다고 생각합니다. 제이에스티나 브랜드에 대한 관심과 아름다운 미소를 갖춘 분이라면<br class="pc"> 언제든지 저희와 함께할 수 있으니 고민하지 말고 도전해 보세요.</li>
                                    </ul>
                                </dd>
                            </dl>
                        </li>
                        <li class="tabData" data-tab="MAKETING">
                            <!--Info Text-->
                            <div class="infoText">
                                <h5>MARKETING</h5>
                                우리 회사만의 ‘무엇’을 소비자에게 각인시키기 위해, Database를 기반으로 다양한 마케팅 전략을 계획하고 실행합니다.<br>
                                오프라인과 온라인상의 ‘소비심리’를 다뤄야 하기 때문에 실행된 전략에 대한 논리적 효과분석이 필수이며,<br class="pc">
                                마케팅 활동에 필요한 다 양한 사람들과의 원활한 커뮤니케이션 능력이 요구됩니다.
                            </div>
                            <!--//Info Text-->
                            <div class="imgArea"><img src="/images/recruit_duty_05.jpg"></div>
                        </li>
                        <li class="tabData" data-tab="MERCHANDISING">
                            <!--MD-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>MD</h5>
                                    MD(Merchandising)은 단기적으로는 미래의 트렌드를 예측하여 이를 제품에 반영하는 일을 수행하며,<br class="pc">
                                    중장기적으로는 <br class="mo">브랜드의 비전을 실현하기 위한 Branding 방안을 수립합니다.<br class="pc">
                                    해당 브랜드에 적합한 제품설계를 위해서는 정성적인 예측도 중요하지만, 이를 논리적으로 주장하기 위한 리서치 능력과 분석력이 요구됩니다. 
                                </div>
                                <!--//Info Text-->
                                <dl>
                                    <dt><img src="/images/recruit_duty_06.jpg"/></dt>
                                    <dd>
                                        <ul>
                                            <li><b>선배인터뷰</b><b>핸드백 기획MD 담당자</b></li>
                                            <li class="tit"><span>활발한 커뮤니케이션, 데이터분석능력이<br class="mo"> 매우 중요하며<br class="pc">상품안목을 높여 디테일을<br class="mo"> 챙길 수 있는 프로의식을 갖는 것이<br class="pc">필요합니다.</span></li>
                                            <li class="text">안녕하세요. 저는 핸드백 상품기획을 담당하고 있습니다.<br class="pc">제이에스티나 핸드백의 모든 상품들의 기획과 운영을 관리하고 있고 주로 지갑과 소품을 담당하고<br class="pc"> 있습니다.  MD 직무의 가장 큰 매력은 브랜드와 소비자를 직접적으로 연결해주는 것입니다. 고객의 니즈와 동향을 밀접적으로 파악하고 방향을 제안하여,  제이에스티나만의 대표상품을 합리적인<br class="pc"> 가격과 배수로 출시해 내는 것이 MD의 기본업무입니다. 이렇게 상품 출시과정 속에는 활발한<br/> 커뮤니케이션, 데이터분석능력이 매우 중요하며 상품안목을 높여 디테일 하나라도 섬세하고 꼼꼼하게 챙길 수 있는 프로의식을 갖는 것이 필요합니다. 적극적이고 책임감 있게 일을 수행할 수 있는 지원자 분들이라면 성장이 열려 있는 제이에스티나로 지원 하는 것이야말로 좋은 기회가 될 것입니다.</li>
                                        </ul>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt><img src="/images/recruit_duty_07.jpg"/></dt>
                                    <dd>
                                        <ul>
                                            <li><b>선배인터뷰</b><b>영업MD 담당자</b></li>
                                            <li class="tit"><span>분석적 사고를 갖고 다양한 직원들과의 <br class="mo">커뮤니케이션에<br class="pc">자신 있는 분이라면 도전해 보세요.</span></li>
                                            <li class="text">안녕하세요. 저는 영업MD를 담당하고 있습니다.<br/>연간 재고계획 수립 및 매출달성을 위한 각 채널별 물량 배분업무 중점으로 업무진행 하고 있으며,<br class="pc"> 일별/주간별/월별 상품 분석, RT, 리오더, 프로모션 제안 등등 다방면적으로 상품을 분석해<br class="mo"> 효율적인<br class="pc"> 재고관리로 매출활성화에 기여할 수 있도록 업무<br class="mo"> 집중하고 있습니다. 영업MD는 분석적인 사고가<br class="pc"> 필요하고 타<br class="mo"> 부서와의 협업 및 매장과의 커뮤니케이션이 많은 포지션으로<br class="mo"> 사교적이고, 긍정적인 분이<br class="pc"> 적합합니다. 제이에스티나 주얼리처럼 자기의 존재를 반짝반짝 빛날 수 있는 기회에 도전해보세요.</li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                            <!--//MD-->
                            <!--Online MD-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>온라인MD</h5>
                                    내가 소싱한 상품, 내가 기획하고 제작한 행사를 사이트에<br class="mo"> 노출하고, 실시간으로 매출이 발생되는 것을 볼 수 있는,<br/>
                                    내가 움직이는 만큼 즉각적으로 성과가 창출되는, 승부근성에 있는 사람에게는 가장 매력적일 수 있는 직무입니다.<br/>
                                    마케팅과SALES를 동시에 풀어내는 패션멀티플레이어 능력이 요구됩니다.
                                </div>
                                <!--//Info Text-->
                                <dl>
                                    <dt><img src="/images/recruit_duty_08.jpg"/></dt>
                                    <dd>
                                        <ul>
                                            <li><b>선배인터뷰</b><b>온라인MD 담당자</b></li>
                                            <li class="tit"><span>지속적으로 성장하는 E-commerce에 대한 관심과 끊임 없는 <br class="pc">열정을 갖춘 분들을 기다리고 있습니다.</span></li>
                                            <li class="text">안녕하세요. 저는 J.ESTINA에서 e-Commerce를 운영업무를 담당하고 있습니다.<br/>우리 부서에서는 온라인유통 전반의 각 채널관리(자사몰, 입점몰, 백화점몰)를 통해 사업부의 비전을<br class="pc"> 함께 공유하여 목표를 위해 나아가고 있습니다. 각자의 직무별 파트구분이 명확하며, 크게<br class="pc"> 플랫폼(자사몰)조직과 이비즈(제휴입점)부분으로 나뉘어 운영됩니다. 각 분야의 전문인력 풀(pool)과 프로세스 측면에서 패션분야 NO.1을 지향합니다.<br/>우리부서는 새로운 도약을 위한 미션을 지속적으로 만들어 내고, 비전에 대한 공유와 끊임 없는<br class="pc"> 서비스를 생산할 수 있는 패기 있는 여러분을 지원을 기다리고 있습니다.</li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                            <!--//Online MD-->
                            <!--VMD-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>VMD</h5>
                                    Visual Merchandiser는 브랜드와 제품 마케팅 컨셉에 따라 창의적인 발상으로 공간을 기획하고 디자인, 연출하는 역할을 수행합니다.<br class="pc">
                                    디자인 프로그램을 기본적으로 다룰 줄 알아야 하며 전체적인 흥미를 일으킬 수 있는 컨셉을 토대로 고객들의 시각을 매료시키는 기술이 요구됩니다.
                                </div>
                                <!--//Info Text-->
                                <dl>
                                    <dt><img src="/images/recruit_duty_09.jpg"/></dt>
                                    <dd>
                                        <ul>
                                            <li><b>선배인터뷰</b><b>VMD 담당자</b></li>
                                            <li class="tit"><span>제이에스티나만의 감각적인 비쥬얼을 연출하는<br class="mo"> 역동적인 업무에<br class="pc">관심있다면 자신감 있게<br class="mo"> 도전해 보세요.</span></li>
                                            <li class="text">안녕하세요. 저는 J.ESTINA VMD실에서 핸드백VMD (Visual Merchandising) 업무를 담당하고<br class="pc"> 있습니다.<br/>오프라인 매장에서 제품 판매가 활성화될 수 있도록 다양한 비쥬얼에 관련된 업무를 지원하고<br class="pc"> 있습니다.<br/>주로 J.ESTINA만의 매장을 만드는 인테리어업무, J.ESTINA 제품이 돋보이도록 연출하는 디스플레이 업무, 시즌 및 이슈에 따라 다양한 프로모션 아이템을 제작하는 것이 주요 업무라고 할 수 있습니다.<br class="pc"> 또한, 우리 부서는 전국유통망 뿐만 아니라 해외매장까지 관리하는 전문적이고, 역동적인 일을<br class="pc"> 추진하고 있습니다. 이처럼 세계적으로 뻗어나가는 J.ESTINA의 주역이 되고 싶다면 VMD직무에<br class="pc"> 도전해 보세요.</li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                            <!--//VMD-->
                        </li>
                        <li class="tabData" data-tab="FLATFORM/LOGISTIC">
                            <!--플랫폼 개발-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>플랫폼개발</h5>
                                    제이에스티나의 온라인고객의 최접점에 있는 Web/모바일<br class="mo"> 어플리케이션과 주문/결제에 이어 배송에 이르는 J.ESTINA Mall의 기반을 만들고<br class="pc">
                                    고객에게 쾌적한 쇼핑환경을 제공하기 위한 플랫폼 개발을 담당합니다.<br class="pc">
                                    e-commerce 트렌드의 변화를 읽고 다양한 개발프로그램에 대한 이해와 사용능력이 요구됩니다.
                                </div>
                                <!--//Info Text-->
                                <dl>
                                    <dt><img src="/images/recruit_duty_10.jpg"/></dt>
                                    <dd>
                                        <ul>
                                            <li><b>선배인터뷰</b><b>ERP개발 담당자</b></li>
                                            <li class="tit"><span>IT기술에 대한 깊은 관심과 전문 개발자로<br class="mo"> 우리와 함께 성장하고<br class="pc">싶다면 언제든지 환영합니다.</span></li>
                                            <li class="text">안녕하세요. J.ESTINA에서 ERP개발을 담당하고 있습니다.<br/>사내 ERP 시스템 신규 도입부터 현재는 안정화 관리, 기타 솔루션 및 온라인몰 등의 시스템간<br class="pc"> 연계서비스 구축/개발을 주로 맡고 있습니다. IT팀은 Database/서버/SW/HW/시스템 등의 IT<br/>전반적인 직무 담당자로 구성되어 있습니다. 프로그램 코딩 및 DB 운영이 주요 업무이며 계획된<br class="pc"> 개발일정에 맞게 책임을 가지고 프로젝트를 수행해야 합니다.<br/>지금 생각해 보면 IT가 없는 세상은 있을 수 없고 IT기술은 사람의 생활에 빠질수 없는 필수적인 요소가 되었습니다. IT개발은 계획과 결과가 중요한 만큼 확실한 목표를 정하고, 그것이 실현되었을 때의<br class="pc"> 성취감이 큰 행복으로 다가옵니다. 개발자로의 우리회사만의 특화된 업무별 프로세스를 만들어 가며<br class="pc"> IT에 대한전문성을 높이고 싶다면 우리와 함께해주세요.</li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                            <!--//플랫폼 개발-->
                            <!--IT-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>IT</h5>
                                    경영 목표,전략,과제와 연계하여 IT 전략,실행과제를 정의하고 업무 생산성 제고 등을 위한<br class="pc">
                                    중장기 계획과 단기 업무전산<br class="mo"> 화 계획의 수립,운영 등 업무를 기획,관리하며<br class="pc">
                                    경영방침에 따라 효과적인 투자계획을 수립,집행하고 효율적인 자산관리로<br class="mo"> 사업을 지원합니다.
                                </div>
                                <!--//Info Text-->
                            </div>
                            <!--//IT-->
                            <!--SCM-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>SCM</h5>
                                    공급관리(Supply chain Mangement) 통합적인 공급망 관리 및 물류전략의 계획, 수요예측, 재고관리,<br class="pc">
                                    운송 및 유통을 책임지며 영업과 생산 과정의 가교 역할을 수행합니다.<br class="pc">
                                    계획을 수립하고 이를 제대로 끝까지 진행할 수 있는 추진력, 책임감과 상황 판단능력이 요구됩니다.
                                </div>
                                <!--//Info Text-->
                                <dl>
                                    <dt><img src="/images/recruit_duty_11.jpg"/></dt>
                                    <dd>
                                        <ul>
                                            <li><b>선배인터뷰</b><b>물류운영 담당자</b></li>
                                            <li class="tit"><span>IT와 융합된 체계적인 물류운영 시스템을 경험하고 물류분야의<br class="pc">발전에 함께하실 수 있는 분이라면<br class="mo"> 도전해보세요.</span></li>
                                            <li class="text">안녕하세요. 저는 J.ESTINA에서 물류운영을 담당하고 있습니다.<br/>특히 물류운영에 필요한 방법과 선진 물류회사의 사례를 비교 분석하여 우리회사 물류운영 방향을<br class="pc"> 설정하고 반영하는 업무를 담당 하고 있습니다.<br/>흔히 물류라는 분야는 단순 업무라고 보시는 분들이 많이 계시지만<br class="pc">정보통신의 발달로 인해 빅데이터 분석 및 IT분야까지 폭 넓게 배울 수 있고 활용할 수 있기 때문에 여러 업무부분에 응용이 가능합니다.<br/>물류분야의 발전 가능성을 알고 싶고 관심이 있으신 분들이라면 누구나 자신감 있게 도전해보세요.</li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                            <!--//SCM-->
                        </li>
                        <li class="tabData" data-tab="MANAGEMENT">
                            <!--HR-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>HR</h5>
                                    HR(Human Resources)은 제이에스티나의의 비전과 및 중장기 사업전략을 근간으로 인적자원의 운용 전략을 수립/실행합니다.<br class="pc">
                                    채용/인력조직관리/교육/평가/보상/조직문화 등 다양한<br class="mo"> 업무를 회사의 전략적 방향성과 연계하여 조직/구성원의<br class="mo"> 개발을 모색합니다. 
                                </div>
                                <!--//Info Text-->
                            </div>
                            <!--//HR-->
                            <!--Finance-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>Finance</h5>
                                    재무직무는 기본적으로 건실한 기업 재무구조를 모색하고<br class="mo"> 경영진의 올바른 의사결정을 지원함으로써,<br class="pc">
                                    효율적 경영활동에 대한 가치창조를 그 목적으로 하고 있습니다. 
                                </div>
                                <!--//Info Text-->
                            </div>
                            <!--//Finance-->
                            <!--법무감사-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>법무감사</h5>
                                    법률활동을 감독, 법무 솔루션 제공 담당. 기업의 이미지 및 사업 이익 보호를 위한 법률활동을 감독하고<br class="pc">
                                    사업의 모든<br class="mo"> 활동이 법규에 부합하도록 법적 솔루션 제공, 관련 서류 검토와 상품의 지적재산권 관리 및 대응을 담당합니다.<br class="pc">
                                    감사는<br class="mo"> 기업의 Risk 관리 및 내부 통제, 관리체계와 프로세스를 평가하고 개선합니다.
                                </div>
                                <!--//Info Text-->
                            </div>
                            <!--//법무감사-->
                            <!--총무-->
                            <div class="subTabData">
                                <!--Info Text-->
                                <div class="infoText">
                                    <h5>총무</h5>
                                    사내 시설과 설비, 자산관리 운영을 통해 기타 재원이 효과적으로 업무에 활용될 수 있도록 지원하며<br class="pc">
                                    나아가 복리후생,<br class="mo"> 급여 등 인적자원 관리에 필요한 지원 및 각종 행정 업무<br class="mo"> 담당합니다.
                                </div>
                                <!--//Info Text-->
                            </div>
                            <!--//총무-->
                        </li>
                    </ul>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>







        
  