<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/kr/common/html.head.jsp" %>
<script>
//scroll 할때 메뉴위치 바꾸어줌
$(window).scroll(function () {
    var prdListPos = $('.romanson .topText').offset().top;
    var headerHT = $('header').outerHeight();
    if ($(window).scrollTop() > prdListPos) {
        $('.romanson .topText dl').addClass('fix');
        $('.romanson .topText dl').css('top', headerHT)
    }
    else {
        $('.romanson .topText dl').removeClass('fix');
        $('.romanson .topText dl').css('top', 0)
    }
});
</script>
<style> #loading { width: 100%; height: 100%; top: 0px; left: 0px; position: fixed; display: block; opacity: 0.7; background-color: #fff; z-index: 99; text-align: center; } #loading-image { position: absolute; top: 50%; left: 50%; z-index: 100; } </style>
<script type="text/javascript"> 
	$(window).load(function() { 
		$('#loading').hide(); 
	}); 
</script>
</head>
<body>
<div id="loading">
<img id="loading-image" src="/images/Spinner.gif" alt="Loading..." />
</div>

    <div id="wrap">
        <%@ include file="/WEB-INF/views/kr/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/brand.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/brand.css"/>
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
<script>
function jt_load(code) {

	
	
	$.ajax({

		type: "GET",
		url:"/brand/romansonInfo?cateCode="+code,
		dataType:"json",
		success:function(data){

			var files_isKey = "";
			//alert("### Seq : " + data.Seq +"\n ### CateName : " + data.CateName +"\n PreSeq : "+ data.PreSeq +"\n ### PreCateName : "+ data.PreCateName +"\n ### NextSeq : "+ data.NextSeq +"\n ### NextCateName : "+ data.NextCateName);
			
			//-- 카테고리 리스트
			$("#catelist").children().remove();
			if(data.cateCode==0) 
				var cate_html = "<a href='javascript:jt_load(0)' class='on'>NEW ARRIVALS</a>";
			else
				var cate_html = "<a href='javascript:jt_load(0)'>NEW ARRIVALS</a>";


			$.each(data.categoryList, function(k,v) {
				if(v.seq==data.cateCode) 
					cate_html += "<a href=\"javascript:jt_load('" + v.seq + "')\" class='on'>" + v.cateName + "</a>";
				else
					cate_html += "<a href=\"javascript:jt_load('" + v.seq + "')\" >" + v.cateName + "</a>";
			});
			$("#catelist").append(" "+cate_html+" "); //카테고리 목록 
			var onListText = $('.romanson .topText dd a.on').text(); //선택된 카테고리 view
	        $('.romanson .topText dt i').text(onListText);

			//-- 카테고리 이전/다음 초기화
	      	$('#catepre').html("");
	      	$('#catecur').html("");
	      	$('#catenex').html("");
	      	//-- 카테고리 이전/다음
	      	$('#catepre').html("<a href=\"javascript:jt_load('" + data.PreSeq + "')\" class='prevPrd'><span>" + data.PreCateName + "</span><img src='/images/icon_brand_romanson_prev.svg'/></a>");
	      	$('#catecur').html("" + data.CateName + "");
	      	$('#catenex').html("<a href=\"javascript:jt_load('" + data.NextSeq + "')\" class='nextPrd'><span>" + data.NextCateName + "</span><img src='/images/icon_brand_romanson_next.svg'/></a>");

	      	//-- 상품리스트
			$("#prolist").children().remove();
			$.each(data.list, function(k,v) {
				var files_html = "";
				files_html += "<a href='romansonView?code="+ v.seq + "&cateCode="+ data.cateCode + "'>";
				files_html += "<div class='photo'><img src='/UploadFiles/"+ data.fileFolder + "/"+ v.fileViewName[0] + "'/></div>";
				files_html += "<div class='name'>"+ v.proName + "</div>";
				files_html += "<div class='cate'>"+ v.cateName + "</div>";
				files_html += "</a>";
				$("#prolist").append("<li>"+files_html+"</li>");
			});
			
		},
		error:function(xhr, status, errorThrown){
			//alert(status);
		}
	});
	
}
</script>
           				
            <!--//Top Common-->
            <section class="topVisual">
                <div class="commImgArea">
                    <c:if test="${!empty brandBanner.imgUrl}">
                        <img src="/UploadFiles/${fileFolder}/${brandBanner.imgUrl}" class="forPC"/>
	                </c:if>
	                <c:if test="${!empty brandBanner.moimgUrl}">
	        			<img src="/UploadFiles/${fileFolder}/${brandBanner.moimgUrl}" class="forMobile"/>
	                </c:if>
                </div>
            </section>
            <section class="content">
                <!--Top Text-->
                <article class="topText">
                    <dl>
                        <dt><span><b>ROMANSON</b><i></i></span></dt>
                        <dd id=catelist>
                        	
	                    </dd>
                    </dl>
                    <span class="text">
                        ${brandBanner.contents}
                        <!-- 시계로 유명한 스위스의 공업 도시인 로만시온 에서 영감을 받아 탄생한 ROMANSON은 명품 시계 브랜드들과 함께 명품관에<br/>
                        자리를 당당히 차지하고 있을 만큼 해외에서의 관심도가 높습니다.<br/>
                        현재 전세계 70여 개국에 수출하며 Global 시계 브랜드로서 지속적인 성장하며 사랑을 받고 있습니다. -->
                    </span>
                    <c:if test="${brandBanner.linkOutYn ne 'N'}">
		            	<a class="forPC mallLink" href="<c:if test="${not fn:contains(brandBanner.linkUrl,'http://') && not fn:contains(brandBanner.linkUrl,'https://')}">http://</c:if>${brandBanner.linkUrl}" <c:if test="${brandBanner.linkOutYn eq 'Y'}"> target="_blank" </c:if>  class="mallLink">
		                Online shop</a>
		                <a class="forMobile mallLink" href="<c:if test="${not fn:contains(brandBanner.linkUrl,'http://') && not fn:contains(brandBanner.linkUrl,'https://')}">http://</c:if>${brandBanner.linkUrl}" <c:if test="${brandBanner.linkOutYn eq 'Y'}"> target="_blank" </c:if>  class="mallLink">
		                Online shop</a>
	                </c:if>
                </article>
                <!--//Top Text-->
                <!--Controller-->
                <article class="controller">
                    <div id=catelistview>
                        <span id=catepre></span>
						<div class="nowPrd" id=catecur></span></div>
						<span id=catenex></span>
                    </div>
                </article>
                <!--//Controller-->
                <!--Product List-->
                <article class="productList">
                    <ul id='prolist'></ul>
                </article>
                <!--//Product List-->
            </section>
        </div>
        <%@ include file="/WEB-INF/views/kr/common/html.footer.jsp" %>
    </div>
<script>
jt_load(0);
</script>
</body>
</html>