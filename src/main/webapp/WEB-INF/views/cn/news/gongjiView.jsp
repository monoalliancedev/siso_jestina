<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/WEB-INF/views/cn/common/html.head.jsp" %>
<script type="text/javascript">
function jt_link(seq) {
	var f = document.moveForm;
	f.seq.value = seq;
	f.action = "gongjiView";
	f.submit();
}
function jt_list() {
	var f = document.moveForm;
	f.action = "gongji";
	f.submit();
}
</script>    
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/cn/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/language/subCN.js"></script>
        <script type="text/javascript" src="/scripts/bbs.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/commBoard.css" />
        <link rel="stylesheet" type="text/css" href="/css/bbs.css" />
        <div id="container" class="sub bbs notice">
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
                            <h6>附件 <b>${board.fileCount}</b> <span>(${board.fileTotSize}KB)</span><!--<a href="#">전체 다운로드</a>--></h6>
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
                        <c:if test="${board.nextSeq > 0}">
                        <dl>
                            <dt>上一篇</dt>
                            <dd>
                            	<a href="#" onclick="jt_link(${board.nextSeq})">${board.nextTitle}</a><span>${board.preRegdate}</span>
                            </dd>
                        </dl>
                        </c:if>
                        <c:if test="${board.preSeq > 0}">
                        <dl>
                            <dt>下一篇</dt>
                            <dd>
                            	<a href="#" onclick="jt_link(${board.preSeq})">${board.preTitle}</a><span>${board.preRegdate}</span>
                            </dd>
                        </dl>
                        </c:if>
                    </div>
                    <!--//다음/이전-->
                    <div class="buttons">
                        <a href="#" onclick="jt_list()" class="typeWhite">目录</a>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/cn/common/html.footer.jsp" %>
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

