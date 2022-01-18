<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/adm/jtcommon/html.head.jsp" %>
<script>
$(document).ready(function() {
});
</script>
</head>

<body>
<!-- 
메뉴 : 

레이어팝업
RECRUT > 인재상,직무소개,기업문화/복리후생,채용공고(O),인재풀등록(O),FAQ(O)
IR > 주가정보(O),공시정보,공고(O)
NEWS > 공지사항(O), 뉴스(O)
 -->
select sort_idx, cate_name, seq, sort_idx from 
( (SELECT 1 as sort_idx, a.cate_name, a.seq FROM tb_jt_romason_category a, 

(select sort_idx from tb_jt_romason_category where seq=?) b WHERE a.sort_idx > b.sort_idx ORDER BY a.sort_idx ASC,a.seq ASC LIMIT 1) 

UNION (SELECT 2 as sort_idx, cate_name, seq FROM tb_jt_romason_category WHERE seq=?) 

UNION (SELECT 3 as sort_idx, a.cate_name, a.seq FROM tb_jt_romason_category a, 

(select sort_idx from tb_jt_romason_category where seq=?) b WHERE a.sort_idx < b.sort_idx ORDER BY a.sort_idx DESC,a.seq DESC LIMIT 1) ) tb order by sort_idx asc





2022-01-14 20:11:21,785 DEBUG [com.jt.mapper.CategoryMapper.FrontSelect] ==> Parameters: 0(Integer), 0(Integer), 0(Integer)
2022-01-14 20:11:21,789 DEBUG [com.jt.mapper.CategoryMapper.FrontSelect] <==      Total: 0

1. 뮤즈 : 뮤즈 이미지 링크 안됨.. 퍼블.. 수정요함
2. index : 브랜드 메인 배너 모바일 이미지가 없음
3. 브랜드 : 이미지클릭시?? 텍스트클릭시?? 링크연결??? (쥬얼리,핸드백)
4. 브랜드 : 로만손 배너 보여지는곳이 어디인가요??
5. 
 


<c:when test="${mainBanner.linkUrl ne ''}">
                        		<c:if test="${mainBanner.linkOutYn eq 'Y'}"><a href="${mainBanner.linkUrl}" target="_blank">${mainBanner.contents}</a></c:if>
	        					<c:if test="${mainBanner.linkOutYn eq 'C'}"><a href="${mainBanner.linkUrl}">${mainBanner.contents}</a></c:if>
                        	</c:when>
                        	<c:when test="${name eq '철수'}">
                        	홍길동이 아닙니다.
                        	</c:when>
                        	<c:otherwise>
                        	사람이 없습니다 ㅜㅜ
                        	</c:otherwise>

