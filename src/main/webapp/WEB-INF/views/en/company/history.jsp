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
        <div id="container" class="sub company history">
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
            <section class="topVisual"></section>
            <section class="content">
                <!--년도선택-->
                <article class="yearSelectWrap">
                    <dl>
                        <dt><span><b>HISTORY</b><i>2020</i></span></dt>
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
                                <th>MAR</th>
                                <td>Inaugurated the president [CEO KIM YOO MI, CEO Jang Ho-seon]</td>
                                <th>DEC</th>
                                <td>Romanson Online Women's Brand R launched</td>
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
                            <th>MAR</th>
                            <td>President Kim Ki-suk was appointed as Honorary Chief of Songpa Tax Office</td>
                            <th>JUL</th>
                            <td>Renewed the J.ESTINA brand</td>
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
                            <th>JAN</th>
                            <td>Launched 2,018 limited jewelry piece ‘Gloria’</td>
                            <th>JUL</th>
                            <td>President Kim Ki-suk won the Anti-Corruption Award</td>
                        </tr>
                        <tr>
                            <th>OCT</th>
                            <td>Launched J.ESTINA kid’s handbag collection</td>
                            <th>OCT</th>
                            <td>Won the Company of the Year Award at Hong Kong Jewelry & Gem Fair</td>
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
                            <th>FEB</th>
                            <td>Launched a second jewelry brand ‘ERGHE’</td>
                            <th>APR</th>
                            <td>Launched ‘J.ESTINA Beauty’</td>
                        </tr>
                        <tr>
                            <th>MAY</th>
                            <td>Opened a J.ESTINA store in Phnom Penh, Cambodia</td>
                            <th>DEC</th>
                            <td>Opened a J.ESTINA jewelry store in Ukraine</td>
                        </tr>
                    </table>
                </article>
                <!--//2017-->
                <!--2016-->
                <article class="yearData yy2016">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2014</span><span>2015</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2016</b><i class="next">&nbsp;</i><span><p>- J.ESTINA Red became the first in the industry to launch a pet jewelry line</p></span></h5>
                        <div class="nextYear"><span>2017</span><span>2018</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>FEB</th>
                            <td>Won the 7<sup>th</sup> Korea Legal Culture Award [Chairperson Kim Ki-mun]</td>
                            <th>APR</th>
                            <td>Entered IT Mall in Hong Kong</td>
                        </tr>
                        <tr>
                            <th>MAY</th>
                            <td>Changed the company name from Romanson Co., Ltd. to J.ESTINA Co., Ltd.</td>
                            <th>SEP</th>
                            <td>Launched J.ESTINA men’s handbag collection</td>
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
                            <th>FEB</th>
                            <td>Established a subsidiary in Shanghai, China</td>
                            <th>MAR</th>
                            <td>Participated in the luxury hall of Baselworld Watch and Jewelery Show in Switzerland (for the 13<sup>th</sup> consecutive year)</td>
                        </tr>
                        <tr>
                            <th>APR</th>
                            <td>Opened the first branch in China in Daimaru Department Store, Shanghai</td>
                            <th>DEC</th>
                            <td>President Kim Ki-suk won the Presidential Commendation at the 8<sup>th</sup> Korea Fashion Awards</td>
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
                            <th>JUN</th>
                            <td>President Kim Ki-suk was selected as the Influential CEO in the Korean Economy in the global management category</td>
                            <th>JUL</th>
                            <td>Launched J.ESTINA RED</td>
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
                            <th>JAN</th>
                            <td>Selected as the participating company of the Small, but Strong Global Company Development Program</td>
                            <th>FEB</th>
                            <td>Chairperson Kim Ki-mun won the Mugunghwa Medal Order of Civil Merit for his contributions to overcoming the global financial crisis</td>
                        </tr>
                        <tr>
                            <th>SEP</th>
                            <td>Held the Romanson Jeju Conference</td>
                            <th>OCT</th>
                            <td>Launched the J.ESTINA fragrance ‘JE’</td>
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
                            <th>MAY</th>
                            <td>Participated in China Watch & Clock Fair in Shenzhen, China</td>
                            <th>OCT</th>
                            <td>Won the Good Design Mark for 19 consecutive years</td>
                        </tr>
                    </table>
                </article>
                <!--//2012-->
                <!--2011-->
                <article class="yearData yy2011">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2009</span><span>2010</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2011</b><i class="next">&nbsp;</i><span><p>- Launched ‘SPIRRA THE WATCH’, a collaborative brand with SPIRRA</p></span></h5>
                        <div class="nextYear"><span>2012</span><span>2013</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>AUG</th>
                            <td>Launched the J.ESTINA handbag</td>
                            <th>NOV</th>
                            <td>Established a U.S. subsidiary of J.ESTINA</td>
                        </tr>
                    </table>
                </article>
                <!--//2011-->
                <!--2010-->
                <article class="yearData yy2010">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2008</span><span>2009</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2010</b><i class="next">&nbsp;</i><span><p>- Developed a watch for Ban ki-moon, the (former) Secretary-General of the United Nations</p></span></h5>
                        <div class="nextYear"><span>2011</span><span>2012</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>MAY</th>
                            <td>Held the Romanson Seoul Conference</td>
                            <th>SEP</th>
                            <td>Received certification as a participant of the Korea-type hidden champion development project by Export-Import Bank of Korea</td>
                        </tr>
                        <tr>
                            <th>DEC</th>
                            <td colspan="3">Launched THE WATCHES</td>
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
                            <th>AUG</th>
                            <td>Chairperson Kim Ki-mun was appointed as the chairperson of the National Tax Administration Committee]</td>
                            <th>SEP</th>
                            <td>President Kim Ki-suk was appointed as a member of the Tax Policy Council of Songpa Tax Office</td>
                        </tr>
                        <tr>
                            <th>DEC</th>
                            <td colspan="3">Selected as the best company in foreign exchange risk management by Korea Exchange</td>
                        </tr>
                    </table>
                </article>
                <!--//2009-->
                <!--2008-->
                <article class="yearData yy2008">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2006</span><span>2007</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2008</b><i class="next">&nbsp;</i><span><p>- Developed South Korea’s first mechanical movement</p></span></h5>
                        <div class="nextYear"><span>2009</span><span>2010</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>FEB</th>
                            <td>Won the Silver Tower Order of Industrial Service Merit for a civilian contributor to the inter-Korean relationship [Chairperson Kim Ki-mun]</td>
                            <th>MAR</th>
                            <td>Won the Bronze Tower Order of Industrial Service Merit at the 35<sup>th</sup> Commerce & Industry Day [President Kim Ki-suk]</td>
                        </tr>
                    </table>
                </article>
                <!--//2008-->
                <!--2007-->
                <article class="yearData yy2007">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2005</span><span>2006</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2007</b><i class="next">&nbsp;</i><span><p>- Developed a watch for North and South Korean leaders</p><p>- Developed a watch for the President of Türkmenistan</p></span></h5>
                        <div class="nextYear"><span>2008</span><span>2009</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>APR</th>
                            <td>Won the Great Prize for Fashion Quality of Korea in the fashion jewelry category</td>
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
                            <th>MAY</th>
                            <td>Chairperson Kim Ki-mun was inaugurated as the chairperson of the Corporate Association of Gaeseong Industrial Complex</td>
                            <th>JUN</th>
                            <td>Launched the World Cup watch celebrating the 2006 FIFA World Cup in Berlin, Germany</td>
                        </tr>
                        <tr>
                            <th>NOV</th>
                            <td>Launched the stylish fine jewelry brand E.S.donna</td>
                            <th>DEC</th>
                            <td>Opened the Romanson Watch &amp; Jewelry Research Center</td>
                        </tr>
                        <tr>
                            <th>DEC</th>
                            <td colspan="3">Launched the Romanson Premier Watch</td>
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
                            <th>JAN</th>
                            <td>Selected as the world’s next generation top product manufacturer</td>
                            <th>JUN</th>
                            <td>Won the 2005 Excellence Award as a company that improved the governance structure of the KOSDAQ market</td>
                        </tr>
                        <tr>
                            <th>AUG</th>
                            <td>Constructed the Romanson cooperative factory in Kaeseong Industrial Zone and commenced the wrist watch production</td>
                            <th>DEC</th>
                            <td>Delivered the reunification clock to a North Korean elementary school</td>
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
                            <th>JAN</th>
                            <td>Relocated the company office [Geoyeo-dong &rarr; Garak-dong]</td>
                            <th>OCT</th>
                            <td>Received the approval as a partner for the pilot complex at Kaeseong Industrial Zone</td>
                        </tr>
                    </table>
                </article>
                <!--//2004-->
                <!--2003-->
                <article class="yearData yy2003">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2001</span><span>2002</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2003</b><i class="next">&nbsp;</i><span><p>- Launched the automatic skeleton product</p></span></h5>
                        <div class="nextYear"><span>2004</span><span>2005</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>FEB</th>
                            <td>Launched the fashion jewelry brand ‘J.ESTINA’</td>
                            <th>MAR</th>
                            <td>Won the 18<sup>th</sup> New Industry Management Award (in the sales management category)</td>
                        </tr>
                        <tr>
                            <th>NOV</th>
                            <td>Won the Brand of the Year 2003</td>
                            <th>DEC</th>
                            <td>Acquired the ISO 9001/2000 certification</td>
                        </tr>
                    </table>
                </article>
                <!--//2003-->
                <!--2002-->
                <article class="yearData yy2002">
                    <div class="yearInfo">
                        <div class="prevYear"><span>2000</span><span>2001</span></div>
                        <h5><i class="prev">&nbsp;</i><b>2002</b><i class="next">&nbsp;</i><span><p>- Launched the fashion watch brand ‘TROFISH’</p></span></h5>
                        <div class="nextYear"><span>2003</span><span>2004</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>MAR</th>
                            <td>Became the first South Korean brand to be invited to the luxury hall at Baselworld Watch and Jewelery Show, Switzerland</td>
                            <th>MAR</th>
                            <td>Won the Minister of Trade, Industry, and Energy Commendation at the South Korea Management Productivity Awards in the future management category</td>
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
                            <th>FEB</th>
                            <td>Won the Excellence Award at the Fulfilling Workplace Awards in the category of SMEs</td>
                            <th>MAR</th>
                            <td>Awarded the Honest Taxpayer Commendation [Seoul Regional Tax Office]</td>
                        </tr>
                        <tr>
                            <th>NOV</th>
                            <td>Won the Iron Tower Order of Industrial Service Merit / USD Twenty Million Export Tower Award at the 38<sup>th</sup> Trade Day</td>
                            <th>DEC</th>
                            <td>Won the Excellence Award in the category of design management at the 3rd South Korea Design and Brand Awards</td>
                        </tr>
                        <tr>
                            <th>DEC</th>
                            <td colspan="3">Won the Minister of Trade, Industry, and Energy Commendation at the 4<sup>th</sup> Industrial Cooperation Awards in the future management category</td>
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
                            <th>MAY</th>
                            <td>Won the World Best Award (in the development capability category)</td>
                            <th>OCT</th>
                            <td>Received approval for the Internet timer patent application [Switzerland and Hong Kong]</td>
                        </tr>
                    </table>
                </article>
                <!--//2000-->
                <!--1999-->
                <article class="yearData yy1999">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1997</span><span>1998</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1999</b><i class="next">&nbsp;</i><span><p>- Developed the rose gold plating technology</p></span></h5>
                        <div class="nextYear"><span>2000</span><span>2001</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>FEB</th>
                            <td>Selected as a venture company</td>
                            <th>MAR</th>
                            <td>Awarded the Honest Taxpayer Commendation [Ministry of Finance and Economy]</td>
                        </tr>
                        <tr>
                            <th>DEC</th>
                            <td colspan="3">Listed the company on KOSDAQ</td>
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
                            <th>MAR</th>
                            <td>Awarded the Honest Taxpayer Commendation [Ministry of Finance and Economy]</td>
                            <th>MAY</th>
                            <td>Won the President’s Award at the SME Promotional Conference</td>
                        </tr>
                    </table>
                </article>
                <!--//1998-->
                <!--1997-->
                <article class="yearData yy1997">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1993</span><span>1996</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1997</b><i class="next">&nbsp;</i><span><p>- Developed the high-tech tungsten watch</p><p>- Started exporting to the Russian region</p></span></h5>
                        <div class="nextYear"><span>1998</span><span>1999</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>MAR</th>
                            <td>Participated in Baselworld Watch and Jewelery Show, Switzerland</td>
                        </tr>
                    </table>
                </article>
                <!--//1997-->
                <!--1996-->
                <article class="yearData yy1996">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1992</span><span>1993</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1996</b><i class="next">&nbsp;</i><span><p>- Launched SWISS MADE ‘ELEVE’</p></span></h5>
                        <div class="nextYear"><span>1997</span><span>1988</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>NOV</th>
                            <td>Received the USD Ten Million Export Tower Award</td>
                        </tr>
                    </table>
                </article>
                <!--//1996-->
                <!--1993-->
                <article class="yearData yy1993">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1990</span><span>1992</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1993</b><i class="next">&nbsp;</i><span><p>- Developed the coin dial design</p></span></h5>
                        <div class="nextYear"><span>1996</span><span>1997</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>DEC</th>
                            <td>Received the Honest Taxpayer Commendation by the Korean Tax Office</td>
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
                            <th>NOV</th>
                            <td>Received the USD Five Million Export Tower Award</td>
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
                            <th>NOV</th>
                            <td>Received the USD One Million Export Tower Award</td>
                        </tr>
                    </table>
                </article>
                <!--//1990-->
                <!--1989-->
                <article class="yearData yy1989">
                    <div class="yearInfo">
                        <div class="prevYear"><span>1988</span></div>
                        <h5><i class="prev">&nbsp;</i><b>1989</b><i class="next">&nbsp;</i><span><p>- Developed the glass cutting technology</p></span></h5>
                        <div class="nextYear"><span>1990</span><span>1992</span></div>
                    </div>
                    <table>
                        <tr>
                            <th>SEP</th>
                            <td>Started exporting to the Middle East</td>
                            <th>NOV</th>
                            <td>Started exporting to the American continent</td>
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
                            <th>APR 13</th>
                            <td>Established Romanson Co., Ltd. (194-15, Garak-dong, Songpa-gu, Seoul)</td>
                        </tr>
                    </table>
                </article>
                <!--//1988-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/en/common/html.footer.jsp" %>
    </div>
</body>
</html>