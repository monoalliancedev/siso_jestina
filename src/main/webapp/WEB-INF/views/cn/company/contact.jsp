<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/WEB-INF/views/cn/common/html.head.jsp" %>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/cn/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/language/subCN.js"></script>
        <script type="text/javascript" src="/scripts/company.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/company.css" />
        <div id="container" class="sub company contact">
            <!--Top Common-->
            <section class="subTop">
                <article>
                    <ul class="location">
                        <li><a href="/cn">HOME</a></li>
                        <li class="dep1"></li>
                        <li class="depmenu"><span class="now">&nbsp;</span><div class="dep2List"></div></li>
                    </ul>
                    <h3 class="pageTitle"></h3>
                </article>
            </section>
            <!--//Top Common-->
            <section class="content">
                <div class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d941.1181479520922!2d127.12133375985599!3d37.495380512880104!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca588a61a1ccb%3A0x4339603000609354!2sLomanson!5e0!3m2!1szh-CN!2skr!4v1642642323294!5m2!1szh-CN!2skr" allowfullscreen="" loading="lazy"></iframe></iframe></div>
                <article class="data">
                    <h6>J.ESTINA <span>总公司</span></h6>
                    <div>
                        <table>
                            <tr>
                                <th>地址</th>
                                <td>首尔特别市松坡区良才大路62街53，J.ESTINA大厦</td>
                            </tr>
                            <tr>
                                <th>电话号码</th>
                                <td>080-998-0077</td>
                            </tr>
                            <tr>
                                <th>传真号码</th>
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
                    <h6><span>交通方式</span></h6>
                    <div>
                        <table>
                            <tr>
                                <th>地铁</th>
                                <td>
                                    <ul class="subway">
                                        <li><i class="line8">8</i> 8号线可乐市场站3号出口（国立警察医院方向）</li>
                                        <li><i class="line3">3</i> 3号线警察医院站1号出口</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th>公交车</th>
                                <td>
                                    <ul class="bus">
                                        <li><span>警察医院下车  </span><div><i class="blue">B</i> 301路 / 401路 <br/> <i class="green last">G</i> 3319路 / 3416路</div></li>
                                        <li><span>可乐电话局下车</span><div><i class="green">G</i> 3322路 / 3416路</div></li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/cn/common/html.footer.jsp" %>
    </div>
</body>
</html>