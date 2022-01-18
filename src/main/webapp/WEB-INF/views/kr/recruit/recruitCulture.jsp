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
        <div id="container" class="sub recruit culture">
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
                <!--우리만의 라이프-->
                <article class="life">
                    <h3>우리만의 라이프</h3>
                    <ul>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/recruit_culture_life_01.jpg"/></li>
                                <li class="text1">카페테리아 운영</li>
                                <li class="text2">직원 모두의 휴식을<br/> 책임지는 공간</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/recruit_culture_life_02.jpg"/></li>
                                <li class="text1">동호회 운영</li>
                                <li class="text2">취미생활을 함께하는<br/> 해피타임</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/recruit_culture_life_03.jpg"/></li>
                                <li class="text1">주니어 보드</li>
                                <li class="text2">젊은 조직을 만드는 일정</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/recruit_culture_life_04.jpg"/></li>
                                <li class="text1">특별한 날 나눔 이벤트</li>
                                <li class="text2">화이트데이, 빼빼로데이,<br/> 복날 깜짝 선물 배달</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/recruit_culture_life_05.jpg"/></li>
                                <li class="text1">우리만의 Party</li>
                                <li class="text2">모든 임직원들과 모여<br/> 하나가 되는 날</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/recruit_culture_life_06.jpg"/></li>
                                <li class="text1">전사 워크샵</li>
                                <li class="text2">서로에게 감사하는<br/> 마음의 나눔</li>
                            </ol>
                        </li>
                    </ul>
                </article>
                <!--//우리만의 라이프-->
                <!--복리후생-->
                <article class="welfare">
                    <h3>복리후생</h3>
                    <ul>
                        <li>
                            <ol>
                                <li class="icon"><img src="/images/recruit_culture_welfare_01.png"/></li>
                                <li class="text">로제라운지</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="icon"><img src="/images/recruit_culture_welfare_02.png"/></li>
                                <li class="text">지식나눔 공간</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="icon"><img src="/images/recruit_culture_welfare_03.png"/></li>
                                <li class="text">크리에이티브룸</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="icon"><img src="/images/recruit_culture_welfare_04.png"/></li>
                                <li class="text">건강한 아침식사<br/>제공</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="icon"><img src="/images/recruit_culture_welfare_05.png"/></li>
                                <li class="text">임직원 할인혜택</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="icon"><img src="/images/recruit_culture_welfare_06.png"/></li>
                                <li class="text">사내식당 운영<br/>(Free)</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="icon"><img src="/images/recruit_culture_welfare_07.png"/></li>
                                <li class="text">단체상해보험<br/>가입</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="icon"><img src="/images/recruit_culture_welfare_08.png"/></li>
                                <li class="text">단체상해보험가입</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="icon"><img src="/images/recruit_culture_welfare_09.png"/></li>
                                <li class="text">경조사 지원 및<br/>공조회 운영</li>
                            </ol>
                        </li>
                    </ul>
                </article>
                <!--//복리후생-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>