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
        <div id="container" class="sub company contact">
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
                <div class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d791.3816093564309!2d127.12070745399546!3d37.49550013323717!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca588a61a1ccb%3A0x4339603000609354!2z66Gc66eM7IaQ!5e0!3m2!1sko!2skr!4v1639621691702!5m2!1sko!2skr" allowfullscreen="" loading="lazy"></iframe></iframe></div>
                <article class="data">
                    <h6>J.ESTINA 본사</h6>
                    <div>
                        <table>
                            <tr>
                                <th>주소</th>
                                <td>서울 송파구 양재대로 62길 53 제이에스티나 빌딩</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>080-998-0077</td>
                            </tr>
                            <tr>
                                <th>팩스번호</th>
                                <td>02-402-0090</td>
                            </tr>
                            <tr>
                                <th>e-mail</th>
                                <td>help@jestina.com</td>
                            </tr>
                        </table>
                    </div>
                </article>
                <article class="data">
                    <h6>교통편</h6>
                    <div>
                        <table>
                            <tr>
                                <th>지하철</th>
                                <td>
                                    <ul class="subway">
                                        <li><i class="line8">8</i> 8호선 가락시장역 3번 출구 (국립경찰병원 방향)</li>
                                        <li><i class="line3">3</i> 3호선 경찰병원역 1번 출구</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th>버스</th>
                                <td>
                                    <ul class="bus">
                                        <li><span>경찰병원.서울동부고용노동지청  </span><div><i class="blue">B</i> 301번 / 401번 <br/> <i class="green last">G</i> 3319번 / 3416번</div></li>
                                        <li><span>경찰병원.KT가락지사</span><div><i class="green">G</i> 3322번 / 3416번</div></li>
                                    </ul>
                                </td>
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