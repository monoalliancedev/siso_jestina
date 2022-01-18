﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <div id="container" class="sub company history">
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
                <!--년도선택-->
                <article class="yearSelectWrap">
                    <dl>
                        <dt><span><b>HISTORY</b>연혁 <i>2020</i> 년</span></dt>
                        <dd>
                            <a href=".yy2020">2020</a>
                            <a href=".yy2019">2019</a>
                            <a href=".yy2018">2018</a>
                            <a href=".yy2017">2017</a>
                            <a href=".yy2016">2016</a>
                            <a href=".yy2015">2015</a>
                            <a href=".yy2014">2014</a>
                            <a href=".yy2013">2013</a>
                            <a href=".yy2012">2012</a>
                            <a href=".yy2011">2011</a>
                            <a href=".yy2010">2010</a>
                            <a href=".yy2009">2009</a>
                            <a href=".yy2008">2008</a>
                            <a href=".yy2007">2007</a>
                            <a href=".yy2006">2006</a>
                            <a href=".yy2005">2005</a>
                            <a href=".yy2004">2004</a>
                            <a href=".yy2003">2003</a>
                            <a href=".yy2002">2002</a>
                            <a href=".yy2001">2001</a>
                            <a href=".yy2000">2000</a>
                            <a href=".yy1999">1999</a>
                            <a href=".yy1998">1998</a>
                            <a href=".yy1997">1997</a>
                            <a href=".yy1996">1996</a>
                            <a href=".yy1993">1993</a>
                            <a href=".yy1992">1992</a>
                            <a href=".yy1990">1990</a>
                            <a href=".yy1989">1989</a>
                            <a href=".yy1988">1988</a>
                        </dd>
                    </dl>
                </article>
                <!--//년도선택-->
                <!--2020-->
                <article class="yearData yy2020" style="display: block;">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2018</span><span>2019</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2020</b></h5>
                    </div>
                    <div class="tb">
                        <table>
                            <tr>
                                <th>03</th>
                                <td>대표이사 취임[김유미, 장호선 각자대표이사]</td>
                                <th>12</th>
                                <td>로만손 온라인 여성 브랜드 R런칭</td>
                            </tr>
                        </table>
                    </div>
                </article>
                <!--//2020-->
                <!--2019-->
                <article class="yearData yy2019">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2017</span><span>2018</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2019</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2020</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>03</th>
                            <td>송파명예세무서장 위촉 [김기석 사장]</td>
                            <th>07</th>
                            <td>제이에스티나 브랜드 리뉴얼</td>
                        </tr>
                    </table>
                </article>
                <!--//2019-->
                <!--2018-->
                <article class="yearData yy2018">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2016</span><span>2017</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2018</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2019</span><span>2020</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>01</th>
                            <td>2018개 Limited 주얼리‘Gloria’출시</td>
                            <th>07</th>
                            <td>반부패 청렴대상 수상[김기석 사장]</td>
                        </tr>
                        <tr>
                            <th>10</th>
                            <td>제이에스티나 핸드백 Kid’s컬렉션 론칭</td>
                            <th>10</th>
                            <td>‘Hong Kong jewellery & Gem Fair(올해의 기업상)수상</td>
                        </tr>
                    </table>
                </article>
                <!--//2018-->
                <!--2017-->
                <article class="yearData yy2017">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2015</span><span>2016</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2017</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2018</span><span>2019</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>주얼리세컨브랜드‘ERGHE’Launching</td>
                            <th>04</th>
                            <td>‘JESTINA Beauty’Launching</td>
                        </tr>
                        <tr>
                            <th>05</th>
                            <td>J.ESTINA 캄보디아  프놈펜 매장 입점</td>
                            <th>12</th>
                            <td>J.ESTINA 우크라이나 주얼리 단독샵 오픈   </td>
                        </tr>
                    </table>
                </article>
                <!--//2017-->
                <!--2016-->
                <article class="yearData yy2016">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2014</span><span>2015</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2016</b><i class="next">&nbsp;</i><span><p>- 제이에스티나레드 업계최초 펫주얼리 론칭</p></span></h5>
                        <div class="nextYear"><span>2017</span><span>2018</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>제7회 대한민국법률문화상 수상 [김기문 회장]</td>
                            <th>04</th>
                            <td>J.ESTINA  홍콩 IT몰 입점</td>
                        </tr>
                        <tr>
                            <th>05</th>
                            <td>사명변경  ㈜로만손 &rarr; ㈜제이에스티나</td>
                            <th>09</th>
                            <td>제이에스티나 핸드백 남성컬렉션 론칭</td>
                        </tr>
                    </table>
                </article>
                <!--//2016-->
                <!--2015-->
                <article class="yearData yy2015">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2013</span><span>2014</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2015</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2016</span><span>2017</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>상해법인 설립</td>
                            <th>03</th>
                            <td>스위스 바젤 시계보석박람회 명품관 참가 [13년 연속]</td>
                        </tr>
                        <tr>
                            <th>04</th>
                            <td>중국 1호 매장 상하이 다이마루백화점내 입점 오픈</td>
                            <th>12</th>
                            <td>제8회 코리아패션대상 대통령표창 수상 [김기석 사장]</td>
                        </tr>
                    </table>
                </article>
                <!--//2015-->
                <!--2014-->
                <article class="yearData yy2014">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2012</span><span>2013</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2014</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2015</span><span>2016</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>06</th>
                            <td>한국경제를 움직이는 CEO 글로벌경영부문 선정 [김기석 사장]</td>
                            <th>07</th>
                            <td>J.ESTINA RED  Launching</td>
                        </tr>
                    </table>
                </article>
                <!--//2014-->
                <!--2013-->
                <article class="yearData yy2013">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2011</span><span>2012</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2013</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2014</span><span>2015</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>01</th>
                            <td>글로벌 강소기업 육성 대상 기업 선정</td>
                            <th>02</th>
                            <td>세계경제위기 극복 유공 국민훈장 무궁화장 수훈 [김기문 회장]</td>
                        </tr>
                        <tr>
                            <th>09</th>
                            <td>로만손 제주 컨퍼런스 개최</td>
                            <th>10</th>
                            <td>J.ESTINA 향수 ‘JE’ Launching</td>
                        </tr>
                    </table>
                </article>
                <!--//2013-->
                <!--2012-->
                <article class="yearData yy2012">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2010</span><span>2011</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2012</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2013</span><span>2014</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>05</th>
                            <td>중국 심천 시계박람회 참가</td>
                            <th>10</th>
                            <td>Good Design 마크 19년 연속 수상</td>
                        </tr>
                    </table>
                </article>
                <!--//2012-->
                <!--2011-->
                <article class="yearData yy2011">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2009</span><span>2010</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2011</b><i class="next">&nbsp;</i><span><p>- 스피라 콜라보레이션 ‘SPIRRA THE WATCH’ 출시</p></span></h5>
                        <div class="nextYear"><span>2012</span><span>2013</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>08</th>
                            <td>J.ESTINA 핸드백 런칭</td>
                            <th>11</th>
                            <td>J.ESTINA 미국법인설립</td>
                        </tr>
                    </table>
                </article>
                <!--//2011-->
                <!--2010-->
                <article class="yearData yy2010">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2008</span><span>2009</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2010</b><i class="next">&nbsp;</i><span><p>- 반기문 유엔사무총장을 위한 시계 개발</p></span></h5>
                        <div class="nextYear"><span>2011</span><span>2012</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>05</th>
                            <td>로만손 서울 컨퍼런스 개최</td>
                            <th>09</th>
                            <td>한국형 히든챔피언 육성사업 대상기업 인증 [한국수출입은행]</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">THE WATCHES 런칭</td>
                        </tr>
                    </table>
                </article>
                <!--//2010-->
                <!--2009-->
                <article class="yearData yy2009">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2007</span><span>2008</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2009</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2010</span><span>2011</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>08</th>
                            <td>국세행정위원회 위원장 위촉[김기문 회장]</td>
                            <th>09</th>
                            <td>송파세무서 세정협의회 위원 위촉[김기석 사장]</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">환리스크 관리 최우수기업 선정  [한국거래소]</td>
                        </tr>
                    </table>
                </article>
                <!--//2009-->
                <!--2008-->
                <article class="yearData yy2008">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2006</span><span>2007</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2008</b><i class="next">&nbsp;</i><span><p>- 국내 최초 기계식 무브먼트 개발</p></span></h5>
                        <div class="nextYear"><span>2009</span><span>2010</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>남북관계 민간인 유공자 은탑산업훈장 수훈[김기문 회장]</td>
                            <th>03</th>
                            <td>제35회 상공의 날 동탑산업훈장 수훈[김기석 사장]</td>
                        </tr>
                    </table>
                </article>
                <!--//2008-->
                <!--2007-->
                <article class="yearData yy2007">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2005</span><span>2006</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2007</b><i class="next">&nbsp;</i><span><p>- 남북정상을 위한 시계 개발</p><p>- 투르크메니스탄 대통령을 위한 시계 개발</p></span></h5>
                        <div class="nextYear"><span>2008</span><span>2009</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>04</th>
                            <td>대한민국 패션품질대상(패션주얼리부문) 수상</td>
                        </tr>
                    </table>
                </article>
                <!--//2007-->
                <!--2006-->
                <article class="yearData yy2006">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2004</span><span>2005</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2006</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2007</span><span>2008</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>05</th>
                            <td>(사)개성공단기업협의회 회장 취임 [김기문회장]</td>
                            <th>06</th>
                            <td>2006 독일월드컵 ‘월드컵시계’ 출시</td>
                        </tr>
                        <tr>
                            <th>11</th>
                            <td>Stylish Fine 주얼리 E.S.donna 런칭</td>
                            <th>12</th>
                            <td>로만손 시계 &amp; 주얼리 연구원 개원</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">로만손 Premier 시계 런칭</td>
                        </tr>
                    </table>
                </article>
                <!--//2006-->
                <!--2005-->
                <article class="yearData yy2005">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2003</span><span>2004</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2005</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2006</span><span>2007</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>01</th>
                            <td>차세대 세계일류상품 생산기업 선정 [산업자원부]</td>
                            <th>06</th>
                            <td>2005년 코스닥시장 지배구조 개선기업 우수상 수상</td>
                        </tr>
                        <tr>
                            <th>08</th>
                            <td>개성공업지구 로만손협동화공장 준공 및 손목시계 생산개시</td>
                            <th>12</th>
                            <td>북한 소학교 ‘통일벽시계’ 전달</td>
                        </tr>
                    </table>
                </article>
                <!--//2005-->
                <!--2004-->
                <article class="yearData yy2004">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2002</span><span>2003</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2004</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2005</span><span>2006</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>01</th>
                            <td>사옥이전 [거여동 &rarr; 가락동]</td>
                            <th>10</th>
                            <td>개성공업지구 시범단지 협력사업(자) 승인</td>
                        </tr>
                    </table>
                </article>
                <!--//2004-->
                <!--2003-->
                <article class="yearData yy2003">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2001</span><span>2002</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2003</b><i class="next">&nbsp;</i><span><p>- 오토메틱 스켈레톤 제품 출시</p></span></h5>
                        <div class="nextYear"><span>2004</span><span>2005</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>패션 주얼리 J.ESTINA 런칭</td>
                            <th>03</th>
                            <td>제18회 신산업경영대상 관리대상(영업부문) 수상</td>
                        </tr>
                        <tr>
                            <th>11</th>
                            <td>2003 올해의 브랜드 대상 수상</td>
                            <th>12</th>
                            <td>ISO 9001:2000 인증</td>
                        </tr>
                    </table>
                </article>
                <!--//2003-->
                <!--2002-->
                <article class="yearData yy2002">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2000</span><span>2001</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2002</b><i class="next">&nbsp;</i><span><p>- 패션시계 브랜드 ‘TROFISH’ 런칭</p></span></h5>
                        <div class="nextYear"><span>2003</span><span>2004</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>03</th>
                            <td>스위스 바젤 시계보석박람회 명품관 초청 (국내최초)</td>
                            <th>03</th>
                            <td>한국 경영생산성 대상 미래경영부문 산업자원부 장관 표창</td>
                        </tr>
                    </table>
                </article>
                <!--//2002-->
                <!--2001-->
                <article class="yearData yy2001">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1999</span><span>2000</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2001</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2002</span><span>2003</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>보람의 일터 대상 중견기업부문 우수상 수상</td>
                            <th>03</th>
                            <td>성실납세 표창 [서울지방국세청]</td>
                        </tr>
                        <tr>
                            <th>11</th>
                            <td>제38회 무역의 날  철탑산업훈장 / 2,000만불 수출탑 수상</td>
                            <th>12</th>
                            <td>제3회 대한민국 디자인 및 브랜드대상 디자인경영부문 우수상 수상</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">제4회 산업협력대상 미래경영부문 산업자원부 장관 표창</td>
                        </tr>
                    </table>
                </article>
                <!--//2001-->
                <!--2000-->
                <article class="yearData yy2000">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1998</span><span>1999</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2000</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>2001</span><span>2002</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>05</th>
                            <td>월드베스트 어워드 (개발력 부문) 우수상 수상</td>
                            <th>10</th>
                            <td>인터넷 타이머 특허획득 [스위스, 홍콩]</td>
                        </tr>
                    </table>
                </article>
                <!--//2000-->
                <!--1999-->
                <article class="yearData yy1999">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1997</span><span>1998</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1999</b><i class="next">&nbsp;</i><span><p>- 로즈골드(Rose-Gold) 도금 기술 개발</p></span></h5>
                        <div class="nextYear"><span>2000</span><span>2001</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>벤처기업 선정</td>
                            <th>03</th>
                            <td>성실납세 표창  [재정경제부]</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">코스닥 등록</td>
                        </tr>
                    </table>
                </article>
                <!--//1999-->
                <!--1998-->
                <article class="yearData yy1998">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1996</span><span>1997</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1998</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>1999</span><span>2000</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>03</th>
                            <td>성실납세 표창 [재정경제부]</td>
                            <th>05</th>
                            <td>중소기업 전진대회 대통령상 수상</td>
                        </tr>
                    </table>
                </article>
                <!--//1998-->
                <!--1997-->
                <article class="yearData yy1997">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1993</span><span>1996</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1997</b><i class="next">&nbsp;</i><span><p>- 하이테크 텅스텐 시계 개발</p><p>- 러시아지역 수출개시</p></span></h5>
                        <div class="nextYear"><span>1998</span><span>1999</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>03</th>
                            <td>스위스 바젤 시계보석박람회 참가</td>
                        </tr>
                    </table>
                </article>
                <!--//1997-->
                <!--1996-->
                <article class="yearData yy1996">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1992</span><span>1993</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1996</b><i class="next">&nbsp;</i><span><p>- SWISS MADE ‘ELEVE’ 런칭</p></span></h5>
                        <div class="nextYear"><span>1997</span><span>1988</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>11</th>
                            <td>1,000만불 수출탑 수상</td>
                        </tr>
                    </table>
                </article>
                <!--//1996-->
                <!--1993-->
                <article class="yearData yy1993">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1990</span><span>1992</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1993</b><i class="next">&nbsp;</i><span><p>- 코인다이얼 디자인 개발</p></span></h5>
                        <div class="nextYear"><span>1996</span><span>1997</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>12</th>
                            <td>성실납세 표창[국세청]</td>
                        </tr>
                    </table>
                </article>
                <!--//1993-->
                <!--1992-->
                <article class="yearData yy1992">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1989</span><span>1990</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1992</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>1993</span><span>1996</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>11</th>
                            <td>500만불 수출탑 수상</td>
                        </tr>
                    </table>
                </article>
                <!--//1992-->
                <!--1990-->
                <article class="yearData yy1990">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1988</span><span>1989</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1990</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>1992</span><span>1993</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>11</th>
                            <td>100만불 수출탑 수상</td>
                        </tr>
                    </table>
                </article>
                <!--//1990-->
                <!--1989-->
                <article class="yearData yy1989">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1988</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1989</b><i class="next">&nbsp;</i><span><p>- 커팅글라스 기술개발</p></span></h5>
                        <div class="nextYear"><span>1990</span><span>1992</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>09</th>
                            <td>중동지역 수출개시</td>
                            <th>11</th>
                            <td>미주지역 수출개시</td>
                        </tr>
                    </table>
                </article>
                <!--//1989-->
                <!--1988-->
                <article class="yearData yy1988">
                    <div class="yearInfo">
                        <h5><b>1988</b><i class="next">&nbsp;</i></h5>
                        <div class="nextYear"><span>1989</span><span>1990</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>04.13</th>
                            <td>로만손 법인설립 (송파구 가락동 194-15)</td>
                        </tr>
                    </table>
                </article>
                <!--//1988-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>