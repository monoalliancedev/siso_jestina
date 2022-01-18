<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %> </head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/company.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/company.css" />
        <div id="container" class="sub company business">
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
                        당사는 J.ESTINA 브랜드로 주얼리와 핸드백 , ROMANSON 브랜드로 손목시계 사업을 진행하고 있으며 토탈 패션 브랜드 사업을 목표로 하고 있습니다.<br/>
                        패션사업의 핵심인 디자인과 R&D, 고급샵의 확보 및 마케팅에 역량을 집중하고 있으며, 생산은 외주생산 시스템을 유지하고 있습니다.<br/>
                        2019년도에는 브랜드 리뉴얼 작업을 추진하여 주얼리, 핸드백에 대한 조엘 콜렉션 신제품 발표, 브랜드 로고 변경, 티아라 모양도 이전보다 단순화한 뉴 티아라로 바뀌었으며,<br/>
                        컬러도 기존의 귀족적 색상인 보라색에서 분홍색으로 더 젊은 이미지로 리뉴얼 하였습니다.
                    </div>
                </article>
                <article class="brand">
                    <ul>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/company_brand_01.jpg" class="pc"/><img src="/images/company_brand_01_mo.jpg" class="mo"/></li>
                                <li class="tit">J.ESTINA Jewelry</li>
                                <li class="text">주얼리는 백화점,면세점 등 고급유통 위주로 영업을 진행하고 있으며, 스타 마케팅과 온라인을 통한 서비스를 적극적으로 진행하고 있습니다.</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/company_brand_02.jpg" class="pc"/><img src="/images/company_brand_02_mo.jpg" class="mo"/></li>
                                <li class="tit">J.ESTINA Handbag</li>
                                <li class="text">핸드백은 온라인 위주로 영업전략 및 스타 마케팅을 진행하고 있으며, 멀티시판샵 위주로 브랜드와 상품을 소개하며 판매를 진행하고 있습니다.</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/company_brand_03.jpg" class="pc"/><img src="/images/company_brand_03_mo.jpg" class="mo"/></li>
                                <li class="tit">Romanson</li>
                                <li class="text">손목시계부문은 수출의 경우 해당지역에 맞는 외부 광고판을 활용하여 지속적으로 로만손 브랜드를 광고하고 있으며, 해당지역에 맞는 디자인을 전개하여 매출증대에 기여하고 있습니다.</li>
                            </ol>
                        </li>
                    </ul>
                </article>
                <article class="info">
                    <div class="logo"><img src="/images/company_brand_logo.svg"/></div>
                    <div class="table">
                        <table>
                            <tr>
                                <th>법인명</th>
                                <td>㈜제이에스티나</td>
                            </tr>
                            <tr>
                                <th>설립연도</th>
                                <td>1988년 4월</td>
                            </tr>
                            <tr>
                                <th>상장일</th>
                                <td>1999년 12월</td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>서울특별시 송파구 양재대로62길 53</td>
                            </tr>
                            <tr>
                                <th>주요사업</th>
                                <td>귀금속 및 관련제품, 시계, 가방, 화장품 제조</td>
                            </tr>
                        </table>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>