﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        <script type="text/javascript" src="/scripts/brand.js"></script>
        <script type="text/javascript" src="/scripts/jquery.flexslider.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/brand.css" />
        <div id="container" class="sub brand romanson">
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
                <!--Product List-->
                <article class="productDetail">
                        <div class="photo">
                            <ul class="slides">
                            <c:forEach var="file" items="${romason.fileViewName}" begin="0" end="4" step="1" varStatus="status">
                            <c:if test="${file ne ''}"><li data-thumb="/UploadFiles/${fileFolder}/${file}"><img src="/UploadFiles/${fileFolder}/${file}"/></li></c:if>
                            </c:forEach>
                            </ul>
                        </div>
                        <div class="info">
                            <span class="cate">${romason.cateName}</span>
                            <h6>${romason.proName}</h6>
                            <table>
                                <tr>
                                    <th>Size</th>
                                    <td>${romason.proSize}</td>
                                </tr>
                                <tr>
                                    <th>Material</th>
                                    <td>${romason.proMeterial}</td>
                                </tr>
                                <tr>
                                    <th>Glass</th>
                                    <td>${romason.proGlass}</td>
                                </tr>
                                <tr>
                                    <th>Band</th>
                                    <td>${romason.proBand}</td>
                                </tr>
                                <tr>
                                    <th>Water Resistance</th>
                                    <td>${romason.proWater}</td>
                                </tr>
                            </table>
                            <div class="thumb"></div>
                            <ul class="buttons">
                                <li class="list"><a href="romanson?code=${cateCode}">List</a></li>
                                <c:if test="${romason.preSeq > 0}"><li class="prev"><a href="romansonView?code=${romason.preSeq}&cateCode=${cateCode}">Prev</a></li></c:if>
                                <c:if test="${romason.preSeq eq 0}"><li class="prev"><a href="#" onclick="alert('첫번째 입니다.')">Prev</a></li></c:if>
                                <c:if test="${romason.nextSeq > 0}"><li class="next"><a href="romansonView?code=${romason.nextSeq}&cateCode=${cateCode}">Next</a></li></c:if>
                                <c:if test="${romason.nextSeq eq 0}"><li class="next"><a href="#" onclick="alert('마지막 입니다.')">Next</a></li></c:if>
                            </ul>
                        </div>
                </article>
                <!--//Product List-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>