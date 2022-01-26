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
        <div id="container" class="sub company business">
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
                <article class="topText">
                    <h4>J.ESTINA<span>是韩国代表性珠宝&手提包品牌。</span></h4>
                    <div>
                        本公司有主营珠宝&手提包的J.ESTINA和主营手表的ROMANSON品牌，目的在于打造综合时尚品牌。<br/>
                        我们将重点放在时尚事业核心领域的设计、R&D、设立高级店铺及营销上，并在生产方面维持外包生产系统。2019年，我们推进了品牌更新，<br/>
                        发布关于珠宝、手提包的JOELLE收藏系列新产品，同时变更品牌标志，皇冠也变成了比以前更加简约的全新形状，<br/>
                        颜色也从现有彰显贵族感的紫色变更为凸显年轻的粉红色。
                    </div>
                </article>
                <article class="brand">
                    <ul>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/company_brand_01.jpg" class="pc"/><img src="/images/company_brand_01_mo.jpg" class="mo"/></li>
                                <li class="tit">J.ESTINA Jewelry</li>
                                <li class="text">珠宝主要在百货商店、免税店等高级流通场所出售，并积极开展明星营销和线上服务。 </li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/company_brand_02.jpg" class="pc"/><img src="/images/company_brand_02_mo.jpg" class="mo"/></li>
                                <li class="tit">J.ESTINA Handbag</li>
                                <li class="text">手提包执行着眼于线上的营业战略及明星营销，主要通过多功能店铺介绍品牌并出售商品。</li>
                            </ol>
                        </li>
                        <li>
                            <ol>
                                <li class="photo"><img src="/images/company_brand_03.jpg" class="pc"/><img src="/images/company_brand_03_mo.jpg" class="mo"/></li>
                                <li class="tit">Romanson</li>
                                <li class="text">出口手表时，利用符合相应地区特色的外部广告牌，积极宣传ROMANSON品牌，同时开展符合相应地区需求的设计，为提高销售额做出贡献。</li>
                            </ol>
                        </li>
                    </ul>
                </article>
                <article class="info">
                    <div class="logo"><img src="/images/company_brand_logo.svg"/></div>
                    <div class="table">
                        <table>
                            <tr>
                                <th>法人名</th>
                                <td>(株)J.ESTINA</td>
                            </tr>
                            <tr>
                                <th>成立年度</th>
                                <td>1988年4月</td>
                            </tr>
                            <tr>
                                <th>上市日</th>
                                <td>1999年12月</td>
                            </tr>
                            <tr>
                                <th>总公司位置</th>
                                <td>首尔特别市松坡区良才大路62街53</td>
                            </tr>
                            <tr>
                                <th>主要业务</th>
                                <td>贵金属及相关产品、手表、包包</td>
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