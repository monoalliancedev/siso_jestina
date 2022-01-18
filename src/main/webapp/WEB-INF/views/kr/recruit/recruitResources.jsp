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
        <div id="container" class="sub recruit jobOpening regist">
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
                <article class="detailWrap">
                    <!--Info-->
                    <div class="infoWrap">
                        <!--채용시기 및 지원방법-->
                        <div class="part2 method">
                            <h4>채용시기 및 지원방법</h4>
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            제이에스티나는 상시 지원할 수 있는 채용시스템을 운영하고 있습니다. 해당 채용공고에 지원서를 제출해 주시면  추후에
                                            관심직무에 결원이 발생하거나, 여러분의 이력에 맞는 직무의 채용이 발생한 경우, 우선 검토 후 연락 드립니다.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!--//채용시기 및 지원방법-->
                        <!--전형절차-->
                        <div class="part3 procedure">
                            <h4>전형절차</h4>
                            <ul>
                                <li class="img"><img src="/images/recruit_job_icon_01.png"/></li>
                                <li class="step">STEP 1</li>
                                <li class="text">지원서 작성</li>
                            </ul>
                            <ul>
                                <li class="img"><img src="/images/recruit_job_icon_02.png"/></li>
                                <li class="step">STEP 2</li>
                                <li class="text">직무역량 면접</li>
                            </ul>
                            <ul>
                                <li class="img"><img src="/images/recruit_job_icon_07.png"/></li>
                                <li class="step">STEP 3</li>
                                <li class="text">직무적합성 과제평가</li>
                            </ul>
                            <ul>
                                <li class="img"><img src="/images/recruit_job_icon_03.png"/></li>
                                <li class="step">STEP 4</li>
                                <li class="text">인적성 검사</li>
                            </ul>
                            <ul>
                                <li class="img"><img src="/images/recruit_job_icon_08.png"/></li>
                                <li class="step">STEP 5</li>
                                <li class="text">임원면접</li>
                            </ul>
                            <ul>
                                <li class="img"><img src="/images/recruit_job_icon_09.png"/></li>
                                <li class="step">STEP 6</li>
                                <li class="text">건강검진</li>
                            </ul>
                            <ul>
                                <li class="img"><img src="/images/recruit_job_icon_05.png"/></li>
                                <li class="step">STEP 7</li>
                                <li class="text">최종합격</li>
                            </ul>
                        </div>
                        <!--//전형절차-->
                        <!--기타사항-->
                        <div class="part2 other">
                            <h4>기타</h4>
                            <div>
                                <table>
                                    <tr>
                                        <td>보훈대상자 및 장애인은 관계 법령에 의거하여 우대합니다.</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!--//기타사항-->
                        <!--문의처-->
                        <div class="part2 inquiries">
                            <h4>문의처</h4>
                            <div>
                                <table>
                                    <tr>
                                        <th>이메일</th>
                                        <td>recruit@jestina.com</td>
                                    </tr>
                                    <tr>
                                        <th>전화번호</th>
                                        <td>02 - 2190 - 7547</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <!--//문의처-->
                    </div>
                    <!--//Info-->
                    <div class="bottom_btn">
                        <a href="application" class="apply">인재풀 등록</a>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>