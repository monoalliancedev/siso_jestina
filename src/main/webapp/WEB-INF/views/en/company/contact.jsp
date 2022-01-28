<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <div id="container" class="sub company contact">
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
            <section class="content">
                <div class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d941.118371838655!2d127.12077571194041!3d37.49536274651307!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca588a61a1ccb%3A0x4339603000609354!2sLomanson!5e0!3m2!1sen!2skr!4v1643003014134!5m2!1sen!2skr" style="border:0;" allowfullscreen="" loading="lazy"></iframe></div>
                <article class="data">
                    <h6>Head office</h6>
                    <div>
                        <table>
                            <tr>
                                <th>Address</th>
                                <td>J.ESTINA Building, 53, Yangjae-daero 62-gil, Songpa-gu, Seoul</td>
                            </tr>
                            <tr>
                                <th>Telephone</th>
                                <td>080-998-0077</td>
                            </tr>
                            <tr>
                                <th>Fax</th>
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
                    <h6>Directions</h6>
                    <div>
                        <table>
                            <tr>
                                <th>Subway</th>
                                <td>
                                    <ul class="subway">
                                        <li><i class="line8">8</i> Exit 3 of Line No. 8 Garak Market Station<br/>(toward National Police Hospital)</li>
                                        <li><i class="line3">3</i> Exit 1 of Line No. 3 National Police Hospital Station</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th>버스</th>
                                <td>
                                    <ul class="bus">
                                        <li><span>Get off at National Police Hospital Station</span></li>
                                        <li>
                                            <div><i class="blue">B</i> 301 / 401</div>
                                            <div><i class="green">G</i> 3319 / 3416</div>
                                            <div><i class="green">G</i> 3322 / 3416</div>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/en/common/html.footer.jsp" %>
    </div>
</body>
</html>