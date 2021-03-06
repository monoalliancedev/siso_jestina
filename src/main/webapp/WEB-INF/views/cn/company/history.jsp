<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <div id="container" class="sub company history">
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
            <section class="topVisual"></section>
            <section class="content">
                <!--년도선택-->
                <article class="yearSelectWrap">
                    <dl>
                        <dt><span><b>HISTORY</b>沿革 <i>2020</i> 年</span></dt>
                        <dd>
                            <a href=".yy2020">2020 年</a>
                            <a href=".yy2019">2019 年</a>
                            <a href=".yy2018">2018 年</a>
                            <a href=".yy2017">2017 年</a>
                            <a href=".yy2016">2016 年</a>
                            <a href=".yy2015">2015 年</a>
                            <a href=".yy2014">2014 年</a>
                            <a href=".yy2013">2013 年</a>
                            <a href=".yy2012">2012 年</a>
                            <a href=".yy2011">2011 年</a>
                            <a href=".yy2010">2010 年</a>
                            <a href=".yy2009">2009 年</a>
                            <a href=".yy2008">2008 年</a>
                            <a href=".yy2007">2007 年</a>
                            <a href=".yy2006">2006 年</a>
                            <a href=".yy2005">2005 年</a>
                            <a href=".yy2004">2004 年</a>
                            <a href=".yy2003">2003 年</a>
                            <a href=".yy2002">2002 年</a>
                            <a href=".yy2001">2001 年</a>
                            <a href=".yy2000">2000 年</a>
                            <a href=".yy1999">1999 年</a>
                            <a href=".yy1998">1998 年</a>
                            <a href=".yy1997">1997 年</a>
                            <a href=".yy1996">1996 年</a>
                            <a href=".yy1993">1993 年</a>
                            <a href=".yy1992">1992 年</a>
                            <a href=".yy1990">1990 年</a>
                            <a href=".yy1989">1989 年</a>
                            <a href=".yy1988">1988 年</a>
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
                                <td>就任CEO [金侑美、张镐宣独立CEO]</td>
                                <th>12</th>
                                <td>Romanson Online 女装品牌 R 推出</td>
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
                            <td>被委任为松坡明细税务局局长 [金基锡总裁]</td>
                            <th>07</th>
                            <td>J.ESTINA品牌更新</td>
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
                            <td>推出2018个限量版珠宝 'Gloria'</td>
                            <th>07</th>
                            <td>金基锡总裁荣获反腐败清廉大奖</td>
                        </tr>
                        <tr>
                            <th>10</th>
                            <td>J.ESTINA手提包推出 Kid’s收藏系列</td>
                            <th>10</th>
                            <td>在“Hong Kong jewelry & Gem Fair”中荣获年度企业奖</td>
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
                            <td>推出第二个珠宝品牌 'ERGHE'</td>
                            <th>04</th>
                            <td>推出 'J.ESTINA Beauty'</td>
                        </tr>
                        <tr>
                            <th>05</th>
                            <td>J.ESTINA入驻柬埔寨金边卖场</td>
                            <th>12</th>
                            <td>J.ESTINA乌克兰珠宝独家经销店开业</td>
                        </tr>
                    </table>
                </article>
                <!--//2017-->
                <!--2016-->
                <article class="yearData yy2016">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2014</span><span>2015</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2016</b><i class="next">&nbsp;</i><span><p>- J.ESTINA RED在业内率先推出宠物珠宝</p></span></h5>
                        <div class="nextYear"><span>2017</span><span>2018</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>荣获第7届韩国法律文化奖 [金基文董事长]</td>
                            <th>04</th>
                            <td>J.ESTINA入驻香港IT购物商城</td>
                        </tr>
                        <tr>
                            <th>05</th>
                            <td>变更公司名称 （株）ROMANSON &rarr; （株）J.ESTINA</td>
                            <th>09</th>
                            <td>推出J.ESTINA手提包男士收藏系列</td>
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
                            <td>成立上海法人</td>
                            <th>03</th>
                            <td>参加瑞士巴塞尔钟表珠宝博览会名品馆 [连续13年]</td>
                        </tr>
                        <tr>
                            <th>04</th>
                            <td>中国1号店铺入驻上海大丸百货商店并开业</td>
                            <th>12</th>
                            <td>在第8届韩国时尚大赏中荣获总统表彰 [金基锡总裁]</td>
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
                            <td>在全球经营领域中获选引领韩国经济的CEO [金基锡总裁]</td>
                            <th>07</th>
                            <td>J.ESTINA RED Launching</td>
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
                            <td>获选全球强小企业培养对象企业</td>
                            <th>02</th>
                            <td>作为克服全球经济危机有功者，荣获国民勋章无穷花章殊勋 [金基文董事长]</td>
                        </tr>
                        <tr>
                            <th>09</th>
                            <td>举办ROMANSON济州会议</td>
                            <th>10</th>
                            <td>推出J.ESTINA香水 'JE'</td>
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
                            <td>参加中国深圳钟表博览会</td>
                            <th>10</th>
                            <td>连续19年获得Good Design标志</td>
                        </tr>
                    </table>
                </article>
                <!--//2012-->
                <!--2011-->
                <article class="yearData yy2011">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2009</span><span>2010</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2011</b><i class="next">&nbsp;</i><span><p>- 携手SPIRRA推出联名款 'SPIRRA THE WATCH'</p></span></h5>
                        <div class="nextYear"><span>2012</span><span>2013</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>08</th>
                            <td>推出J.ESTINA手提包</td>
                            <th>11</th>
                            <td>成立J.ESTINA美国法人</td>
                        </tr>
                    </table>
                </article>
                <!--//2011-->
                <!--2010-->
                <article class="yearData yy2010">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2008</span><span>2009</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2010</b><i class="next">&nbsp;</i><span><p>- 为联合国秘书长潘基文开发手表</p></span></h5>
                        <div class="nextYear"><span>2011</span><span>2012</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>05</th>
                            <td>举办ROMANSON首尔会议</td>
                            <th>09</th>
                            <td>获得韩国型隐形冠军培养事业对象企业认证 [韩国进出口银行]</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">推出THE WATCHES</td>
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
                            <td>被委任为国税行政委员会委员长 [金基文董事长]</td>
                            <th>09</th>
                            <td>被委任为松坡税务局税政协议会委员 [金基锡总裁]</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">获选外汇风险管理最优秀企业 [韩国交易所]</td>
                        </tr>
                    </table>
                </article>
                <!--//2009-->
                <!--2008-->
                <article class="yearData yy2008">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2006</span><span>2007</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2008</b><i class="next">&nbsp;</i><span><p>- 在韩国国内率先开发机械机芯</p></span></h5>
                        <div class="nextYear"><span>2009</span><span>2010</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>作为韩朝关系民间人士有功者荣获银塔产业勋章殊勋 [金基文董事长]</td>
                            <th>03</th>
                            <td>在第35届商工日中荣获铜塔产业勋章殊勋 [金基锡总裁]</td>
                        </tr>
                    </table>
                </article>
                <!--//2008-->
                <!--2007-->
                <article class="yearData yy2007">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2005</span><span>2006</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2007</b><i class="next">&nbsp;</i><span><p>- 2007 为韩朝首脑会晤开发钟表</p><p>- 为土库曼斯坦总统开发手表</p></span></h5>
                        <div class="nextYear"><span>2008</span><span>2009</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>04</th>
                            <td>在韩国时尚质量大赏时尚珠宝领域中获奖</td>
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
                            <td>金基文董事长就任（社）开城公团企业协议会会长</td>
                            <th>06</th>
                            <td>2006 德国世界杯时推出世界杯手表</td>
                        </tr>
                        <tr>
                            <th>11</th>
                            <td>推出Stylish Fine珠宝E.S.donna</td>
                            <th>12</th>
                            <td>开设ROMANSON手表&珠宝研究院</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">推出ROMANSON Premier手表</td>
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
                            <td>获选新一代世界一流商品生产企业[产业资源部]</td>
                            <th>06</th>
                            <td>2005年荣获科斯达克市场支配结构改善企业优秀奖</td>
                        </tr>
                        <tr>
                            <th>08</th>
                            <td>开城工业地区ROMANSON联合化工厂竣工并开始生产手表</td>
                            <th>12</th>
                            <td>向朝鲜小学转交 '统一挂钟'</td>
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
                            <td>办公楼搬迁[巨余洞 &rarr; 可乐洞]</td>
                            <th>10</th>
                            <td>获批开城工业地区示范园区合作事业（经营者)</td>
                        </tr>
                    </table>
                </article>
                <!--//2004-->
                <!--2003-->
                <article class="yearData yy2003">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2001</span><span>2002</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2003</b><i class="next">&nbsp;</i><span><p>- 推出自动镂空手表产品</p></span></h5>
                        <div class="nextYear"><span>2004</span><span>2005</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>推出时尚珠宝J.ESTINA</td>
                            <th>03</th>
                            <td>在第18届新产业经营大赏中荣获营业领域管理大奖</td>
                        </tr>
                        <tr>
                            <th>11</th>
                            <td>2003 荣获年度品牌大奖</td>
                            <th>12</th>
                            <td>获得ISO 9001:2000认证</td>
                        </tr>
                    </table>
                </article>
                <!--//2003-->
                <!--2002-->
                <article class="yearData yy2002">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2000</span><span>2001</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2002</b><i class="next">&nbsp;</i><span><p>- 推出时尚手表品牌 'TROFISH'</p></span></h5>
                        <div class="nextYear"><span>2003</span><span>2004</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>03</th>
                            <td>韩国国内首次获邀参加瑞士巴塞尔钟表珠宝博览会名品馆</td>
                            <th>03</th>
                            <td>在韩国经营生产效率大赏中荣获未来经营领域产业资源部长官表彰</td>
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
                            <td>在“有意义的工作岗位大赏”中荣获中坚企业领域优秀奖</td>
                            <th>03</th>
                            <td>荣获诚信纳税表彰[首尔地方国税厅]</td>
                        </tr>
                        <tr>
                            <th>11</th>
                            <td>在第38届贸易日中荣获铁塔产业勋章/荣获2000万美元出口塔奖</td>
                            <th>12</th>
                            <td>在第3届韩国设计及品牌大赏中荣获设计经营领域优秀奖</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">在第4届产业合作大赏中荣获未来经营领域产业资源部长官表彰</td>
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
                            <td>在World Best Award中（开发实力领域）荣获优秀奖</td>
                            <th>10</th>
                            <td>取得网络计时器专利[瑞士、香港]</td>
                        </tr>
                    </table>
                </article>
                <!--//2000-->
                <!--1999-->
                <article class="yearData yy1999">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1997</span><span>1998</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1999</b><i class="next">&nbsp;</i><span><p>- 开发玫瑰金镀金技术</p></span></h5>
                        <div class="nextYear"><span>2000</span><span>2001</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>02</th>
                            <td>获选风险投资企业</td>
                            <th>03</th>
                            <td>荣获诚信纳税表彰[财政经济部]</td>
                        </tr>
                        <tr>
                            <th>12</th>
                            <td colspan="3">在科斯达克上市</td>
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
                            <td>荣获诚信纳税表彰[财政经济部]</td>
                            <th>05</th>
                            <td>在中小企业发展大赛中荣获总统奖</td>
                        </tr>
                    </table>
                </article>
                <!--//1998-->
                <!--1997-->
                <article class="yearData yy1997">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1993</span><span>1996</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1997</b><i class="next">&nbsp;</i><span><p>- 开发高科技钨表</p><p>- 开始出口至俄罗斯地区</p></span></h5>
                        <div class="nextYear"><span>1998</span><span>1999</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>03</th>
                            <td>参加瑞士巴塞尔钟表珠宝博览会</td>
                        </tr>
                    </table>
                </article>
                <!--//1997-->
                <!--1996-->
                <article class="yearData yy1996">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1992</span><span>1993</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1996</b><i class="next">&nbsp;</i><span><p>- 推出SWISS MADE 'ELEVE'</p></span></h5>
                        <div class="nextYear"><span>1997</span><span>1988</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>11</th>
                            <td>荣获1000万美元出口塔奖</td>
                        </tr>
                    </table>
                </article>
                <!--//1996-->
                <!--1993-->
                <article class="yearData yy1993">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1990</span><span>1992</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1993</b><i class="next">&nbsp;</i><span><p>- 开发硬币型表盘设计</p></span></h5>
                        <div class="nextYear"><span>1996</span><span>1997</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>12</th>
                            <td>荣获诚信纳税表彰[国税厅]</td>
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
                            <td>荣获500万美元出口塔奖</td>
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
                            <td>荣获100万美元出口塔奖</td>
                        </tr>
                    </table>
                </article>
                <!--//1990-->
                <!--1989-->
                <article class="yearData yy1989">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1988</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1989</b><i class="next">&nbsp;</i><span><p>- 开发玻璃切割技术</p></span></h5>
                        <div class="nextYear"><span>1990</span><span>1992</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>09</th>
                            <td>开始出口至中东地区</td>
                            <th>11</th>
                            <td>开始出口至美洲地区</td>
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
                            <td>成立法人ROMANSON，松坡区可乐洞194-15</td>
                        </tr>
                    </table>
                </article>
                <!--//1988-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/cn/common/html.footer.jsp" %>
    </div>
</body>
</html>