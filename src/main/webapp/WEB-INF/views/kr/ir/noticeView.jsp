﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %>
<script type="text/javascript">
function jt_link(seq) {
	var f = document.moveForm;
	f.seq.value = seq;
	f.action = "noticeView";
	f.submit();
}
function jt_list() {
	var f = document.moveForm;
	f.action = "notice";
	f.submit();
}
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/ir.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/commBoard.css" />
        <link rel="stylesheet" type="text/css" href="/css/ir.css" />
        <div id="container" class="sub ir notif">
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
                <article class="commBoardView">
                    <!--제목-->
                    <div class="title">
                        <h5>${board.title}</h5>
                        <span>${board.regdate}</span>
                    </div>
                    <!--//제목-->
                    <!--내용-->
                    <div class="viewWrap">
                        <c:if test="${board.fileCount > 0}">
                        <!--첨부파일-->
                        <div class="attachFile">
                            <h6>첨부파일 <b>${board.fileCount}</b>개 <span>(${board.fileTotSize}KB)</span><!--<a href="#">전체 다운로드</a>--></h6>
                            <c:forEach var="i" begin="1" end="4">
	                            <c:choose>
		                            <c:when test="${board.fileViewName[i] ne '' and board.fileViewName[i] ne null}">
			                            <ul>
			                                <li>
			                                	<a href="/common/fildDownload?seq=${board.fileViewSeq[i]}&Folder=${fileFolder}">${board.fileViewName[i]}</a>
			                                	<!-- ${board.fileViewSeq[i]} (${board.fileViewSize[i]} KB) -->
			                                </li>
			                            </ul>
		                            </c:when>
	                                <c:otherwise>
		                            </c:otherwise>
	                            </c:choose>
                            </c:forEach>
                        </div>
                        <!--//첨부파일-->
                        </c:if>
                        <!--게시글-->
                        <div class="bbsText">
                            ${board.contents}
                        </div>
                        <!--//게시글-->
                    </div>
                    <!--//내용-->
                    <!--다음/이전-->
                    <div class="ctrl">
                        <dl>
                            <dt>다음글</dt>
                            <dd>
                            	<c:if test="${board.nextSeq <= 0}">다음글이 없습니다.</c:if>
                            	<a href="#" onclick="jt_link(${board.nextSeq})">${board.nextTitle}</a><span>${board.preRegdate}</span>
                            </dd>
                        </dl>
                        <dl>
                            <dt>이전글</dt>
                            <dd>
                            	<c:if test="${board.preSeq <= 0}">이전글이 없습니다.</c:if>
                            	<a href="#" onclick="jt_link(${board.preSeq})">${board.preTitle}</a><span>${board.preRegdate}</span>
                            </dd>
                        </dl>
                    </div>
                    <!--//다음/이전-->
                    <div class="buttons">
                        <a href="#" onclick="jt_list()" class="typeWhite">목록</a>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
</body>
</html>
<form name="moveForm" id="moveForm" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<input type="hidden" name="seq"/>

<input type="hidden" name="cpage" value="${search.cpage}" />
<input type="hidden" name="key" value="${search.key}">
<input type="hidden" name="keyword" value="${search.keyword}">
<input type="hidden" name="total_rows" value="${search.total_rows}" />
</form>

