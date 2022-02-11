<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/WEB-INF/views/cn/common/html.head.jsp" %>
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
        <%@ include file="/WEB-INF/views/cn/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/language/subCN.js"></script>
        <script type="text/javascript" src="/scripts/brand.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/brand.css" />
        <div id="container" class="sub brand romanson">
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
<script>
function jt_load(code) {

	$.ajax({

		type: "GET",
		url:"/brand/romansonInfo?cateCode="+code,
		dataType:"json",
		success:function(data){

			var files_isKey = "";

			
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
			//alert("2222222222");
		}
	});
	
}
</script>            
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
                        <!-- 988年，从因手表而闻名的瑞士罗曼斯霍恩中获得灵感，诞生了ROMANSON这一品牌， <br/>
                        该品牌自1997年起参加全球最大的钟表博览会“巴塞尔国际珠宝钟表展”，并在名品馆中进行展览。 -->
                    </span>
                    <c:if test="${brandBanner.linkOutYn ne 'N'}">
		            	<a href="<c:if test="${not fn:contains(brandBanner.linkUrl,'http://') && not fn:contains(brandBanner.linkUrl,'https://')}">http://</c:if>${brandBanner.linkUrl}" <c:if test="${brandBanner.linkOutYn eq 'Y'}"> target="_blank" </c:if>  class="mallLink">
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
        <%@ include file="/WEB-INF/views/cn/common/html.footer.jsp" %>
    </div>
<script>
jt_load(0);
</script>    
</body>
</html>



           
            
                