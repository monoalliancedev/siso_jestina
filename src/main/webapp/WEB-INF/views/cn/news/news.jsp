<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/WEB-INF/views/cn/common/html.head.jsp" %>
<script>
//view 
function Jt_submit(seq) {
	var f = document.moveForm;
	f.seq.value = seq;
	f.action = "newsView";
	f.submit();
}
//페이징 이동
function goPage(cpage){
	var f = document.searchForm;
	f.cpage.value = cpage;
	f.action = "news";
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
        <div id="container" class="sub bbs news">
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
                <article>
<form name="searchForm" id="searchForm" method="get" action="" class="boardSearch">
<input type="hidden" name="seq" />
<input type="hidden" name="cpage" value="1" />
                        <span class="total">全部的 <b><fmt:formatNumber value="${page.total_rows}" pattern="#,###" /></b></span>
                        <select class="select" name="key">
	                        <option value="all" <c:if test="${page.key eq 'all'}">selected</c:if>>全部</option>
	                        <option value="title" <c:if test="${page.key eq 'title'}">selected</c:if>>Title</option>
	                        <option value="contents" <c:if test="${page.key eq 'contents'}">selected</c:if>>Contents</option>
                    	</select>
                        <div class="searchWord">
                            <input type="text" name="keyword" value="${page.keyword}" placeholder="请输入搜索词"/>
                            <button type="submit"><img src="/images/common/icon_search_zoom.svg" alt="Search"/></button>
                        </div>
</form>
                </article>
                <article class="commBoardList">
                    <ul class="typeGallery">
                        <c:forEach var="list" items="${list}" varStatus="status">
                        <!--Set-->
                        <li>
                            <ol>
                                <li class="thumb">
                                	<c:choose>
			                            <c:when test="${list.imgSeq > 0}">
			                                <a href="#" onclick="Jt_submit(${list.seq})"><img src="/UploadFiles/${fileFolder}/${list.imgUrl}"/></a>
			                            </c:when>
			                            <c:otherwise>
			                            </c:otherwise>
	                            	</c:choose>
                                </li>
                                <li class="tit"><a href="#" onclick="Jt_submit(${list.seq})">${list.title}</a></li>
                                <li class="date">${list.regdate}</li>
                            </ol>
                        </li>
                        <!--//Set-->
                        </c:forEach>
                    </ul>
                    <div class="paging">
                        ${paging}
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

<input type="hidden" name="cpage" value="${page.cpage}" />
<input type="hidden" name="key" value="${page.key}">
<input type="hidden" name="keyword" value="${page.keyword}">
<input type="hidden" name="total_rows" value="${page.total_rows}" />
</form>
