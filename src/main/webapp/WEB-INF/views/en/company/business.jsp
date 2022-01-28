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
        <div id="container" class="sub company business">
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
                <article class="topText">
                    <h4>J.ESTINA, a jewelry and handbag brand<br/>that represents South Korea</h4>
                    <div>
                        We operate jewelry and handbag business through the brand J.ESTINA, and a wrist watch business through the brand ROMANSON,<br/>
                        with our goal of becoming a total fashion brand. We are currently focusing our efforts on design, R&D, and securing high-end stores and marketing,<br/>
                        which are keys to running a successful fashion business. In terms of production, we maintain an outsourcing system.<br/>
                        In 2019, we conducted a brand renewal, which entailed launching the JOELLE collection comprised of jewelries and handbags,<br/>
                        releasing new products, and changing the brand logo with a more simplified version of the signature tiara symbol.<br/>
                        The brand’s theme color also changed from purple, which represents nobility, to pink for a youthful image.
                    </div>
                </article>
                <article class="brand">
                    <ul>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/company_brand_01.jpg" class="pc"/><img src="/images/company_brand_01_mo.jpg" class="mo"/></li>
                                <li class="tit">J.ESTINA Jewelry</li>
                                <li class="text">For the jewelry business, our strategy is to focus our sales channels on high-end distributors, such as department stores and duty-free stores. We are also actively utilizing celebrity marketing and online services.</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/company_brand_02.jpg" class="pc"/><img src="/images/company_brand_02_mo.jpg" class="mo"/></li>
                                <li class="tit">J.ESTINA Handbag</li>
                                <li class="text">For handbag products, our sales strategy revolves around online channels and celebrity marketing. We are increasing sales by introducing the brand mainly through select boutique shops.</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/company_brand_03.jpg" class="pc"/><img src="/images/company_brand_03_mo.jpg" class="mo"/></li>
                                <li class="tit">Romanson</li>
                                <li class="text">For the wrist watch export business, we utilize billboard advertisements ideal for the local markets to continuously promote the Romanson brand. In addition, we are developing designs targeting specific local markets to increase sales profits.</li>
                            </ol>
                        </li>
                    </ul>
                </article>
                <article class="info">
                    <div class="logo"><img src="/images/company_brand_logo.svg"/></div>
                    <div class="table">
                        <table>
                            <tr>
                                <th>Corporation</th>
                                <td>J.ESTINA Co., Ltd.</td>
                            </tr>
                            <tr>
                                <th>Established</th>
                                <td>April 1988</td>
                            </tr>
                            <tr>
                                <th>Date of Listing</th>
                                <td>December 1999</td>
                            </tr>
                            <tr>
                                <th>Headquarters</th>
                                <td>53, Yangjae-daero 62-gil, Songpa-gu, Seoul</td>
                            </tr>
                            <tr>
                                <th>Business Areas</th>
                                <td>Precious metals and related products, watches, bags</td>
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