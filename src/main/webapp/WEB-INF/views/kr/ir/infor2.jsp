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
        <div id="container" class="sub ir disclosure">
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
                <article>
                    <form class="boardSearch">
                        <span class="total">TOTAL <b>107</b></span>
                        <select class="select">
                            <option>전체</option>
                        </select>
                        <div class="searchWord">
                            <input type="text" placeholder="검색어를 입력하세요"/>
                            <button type="button"><img src="/images/common/icon_search_zoom.svg" alt="검색"/></button>
                        </div>
                    </form>
                </article>
                <article class="commBoardList">
                    <table>
                        <colgroup>
                            <col width="5.4%">
                            <col width="16%">
                            <col width="*">
                            <col width="16%">
                            <col width="12.5%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>공시대상회사</th>
                                <th>보고서명</th>
                                <th>제출인</th>
                                <th>접수일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="no">10</td>
                                <td class="cmpy"><span>제이에스티나</span></td>
                                <td class="name alLeft"><a href="#">기타경영사항(자율공시) (자본시장과 금융투자업에 관한 법률위반에 대한 상고장 접수)</a></td>
                                <td class="submit"><span>제이에스티나</span></td>
                                <td class="dete">2021.10.15</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="paging">
                        <a href="#" title="첫 페이지"><img src="/images/common/icon_paging_first.svg"/></a>
                        <a href="#" title="이전 페이지"><img src="/images/common/icon_paging_prev.svg"/></a>
                        <ul>
                            <li class="now"><span>1</span></li>
                            <li><a href="#">2</a></li>
                        </ul>
                        <a href="#" title="다음 페이지"><img src="/images/common/icon_paging_next.svg"/></a>
                        <a href="#" title="마지막 페이지"><img src="/images/common/icon_paging_last.svg"/></a>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>