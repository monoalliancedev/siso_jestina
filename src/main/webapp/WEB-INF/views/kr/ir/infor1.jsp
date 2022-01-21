<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/ir.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/commBoard.css" />
        <link rel="stylesheet" type="text/css" href="/css/ir.css" />
        <div id="container" class="sub ir stock">
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
                <!--실시간 시세-->
                <article class="realTime">
                    <h3>실시간 시세 <span class="date">2021/11/09 13:39:52 기준(장중)</span></h3>
                    <ul>
                        <li>
                            <div class="box">
                                <div>
                                    <h6>제이에스티나 현재가</h6>
                                    <span><i>100000</i></span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box">
                                <div>
                                    <h6>전일대비</h6>
                                    <span class="lower"><i>500</i><b>- 0.29%</b></span>
                                    <!--상한<span class="upper">500<b>+ 0.29%</b></span>-->
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box">
                                <div>
                                    <h6>거래량</h6>
                                    <span><i>14457</i></span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box">
                                <div>
                                    <h6>거래대금</h6>
                                    <span><i>2449991500</i></span>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="tableData">
                        <div>
                            <dl>
                                <dt>시가</dt>
                                <dd>170,000</dd>
                            </dl>
                            <dl>
                                <dt>고가</dt>
                                <dd><span class="red">172,500</span></dd>
                            </dl>
                            <dl>
                                <dt>저가</dt>
                                <dd><span class="blue">167,500</span></dd>
                            </dl>
                            <dl>
                                <dt>PER</dt>
                                <dd>23.70</dd>
                            </dl>
                            <dl>
                                <dt>상장주식수</dt>
                                <dd>7,140,000</dd>
                            </dl>
                        </div>
                        <div>
                            <dl>
                                <dt>상한가</dt>
                                <dd><span class="red">220,000</span></dd>
                            </dl>
                            <dl>
                                <dt>하한가</dt>
                                <dd><span class="blue">119,000</span></dd>
                            </dl>
                            <dl>
                                <dt>액면가</dt>
                                <dd>5,000</dd>
                            </dl>
                            <dl>
                                <dt>52주 최고 (총가기준)</dt>
                                <dd><span class="red">238,000</span></dd>
                            </dl>
                            <dl>
                                <dt>52주 최저 (총가기준)</dt>
                                <dd><span class="blue">147,000</span></dd>
                            </dl>
                        </div>
                    </div>
                </article>
                <!--//실시간 시세-->
                <!--호가-->
                <article class="askingPrice">
                    <h3>호가</h3>
                    <div class="commBoardList">
                        <table>
                            <thead>
                                <tr>
                                    <th>매도잔량</th>
                                    <th>호가</th>
                                    <th>매수잔량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>170</td>
                                    <td>171,000</td>
                                    <td>285</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td>1,178</td>
                                    <td>잔량합계</td>
                                    <td>1,812</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </article>
                <!--//호가-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>