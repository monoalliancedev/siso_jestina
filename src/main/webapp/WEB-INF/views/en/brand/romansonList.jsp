<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/views/en/common/html.head.jsp" %>
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


function LoadingWithMask() {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(window).height();
    var maskWidth = $(window).width();
     
    //화면에 출력할 마스크를 설정해줍니다.
    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg ='';
      
    loadingImg +="<div id='loadingImg'>";
    loadingImg +=" <img src='/images/sample/Spinner.gif' style='position: relative; display: block; margin: 0px auto;'/>";
    loadingImg +="</div>"; 

    //화면에 레이어 추가
    $('body')
        .append(mask)
        .append(loadingImg)
        
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
            'width' : maskWidth
            ,'height': maskHeight
            ,'opacity' :'0.3'
    });
  
    //마스크 표시
    $('#mask').show();  
  
    //로딩중 이미지 표시
    $('#loadingImg').show();
}
function closeLoadingWithMask() {
    $('#mask, #loadingImg').hide();
	$('#mask, #loadingImg').remove(); 
}
LoadingWithMask();
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/en/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/language/subEN.js"></script>
        <script type="text/javascript" src="/scripts/brand.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/brand.css" />
        <div id="container" class="sub brand romanson">
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
<script>
function jt_load(code) {

	$.ajax({

		type: "GET",
		url:"/brand/romansonInfo?cateCode="+code,
		dataType:"json",
		success:function(data){

			var files_isKey = "";

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

	      	//-- 카테고리 이전/다음
	      	$('#catepre').html("");
	      	$('#catecur').html("");
	      	$('#catenex').html("");
	      	$('#catepre').html("<a href=\"javascript:jt_load('" + data.PreSeq + "')\" class='prevPrd'><span>" + data.PreCateName + "</span><img src='/images/icon_brand_romanson_prev.svg'/></a>");
	      	$('#catecur').html("" + data.CateName + "");
	      	$('#catenex').html("<a href=\"javascript:jt_load('" + data.NextSeq + "')\" class='nextPrd'><span>" + data.NextCateName + "</span><img src='/images/icon_brand_romanson_next.svg'/></a>");
			
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
                    <c:if test="${brandBanner.imgUrl ne ''}">
                        <c:if test="${brandBanner.linkOutYn eq 'Y'}">
	                    <a href="${brandBanner.linkUrl}" target="_blank"><img src="/UploadFiles/${fileFolder}/${brandBanner.imgUrl}" class="forPC"/></a>
	                    </c:if>
	        			<c:if test="${brandBanner.linkOutYn eq 'C'}">
	        			<a href="${brandBanner.linkUrl}"><img src="/UploadFiles/${fileFolder}/${brandBanner.imgUrl}" class="forPC"/></a>
	        		    </c:if>
	                    <c:if test="${brandBanner.linkOutYn eq 'N'}">
	        			<img src="/UploadFiles/${fileFolder}/${brandBanner.imgUrl}" class="forPC"/>
	        		    </c:if>
	                </c:if>
	                <c:if test="${brandBanner.moimgUrl ne ''}">
	                    <c:if test="${brandBanner.linkOutYn eq 'Y'}">
	                    <a href="${brandBanner.linkUrl}" target="_blank"><img src="/UploadFiles/${fileFolder}/${brandBanner.moimgUrl}" class="forMobile"/></a>
	                    </c:if>
	        			<c:if test="${brandBanner.linkOutYn eq 'C'}">
	        			<a href="${brandBanner.linkUrl}"><img src="/UploadFiles/${fileFolder}/${brandBanner.moimgUrl}" class="forMobile"/></a>
	                    </c:if>
	                    <c:if test="${brandBanner.linkOutYn eq 'N'}">
	        			<img src="/UploadFiles/${fileFolder}/${brandBanner.moimgUrl}" class="forMobile"/>
	                    </c:if>
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
                        <!-- ROMANSON was established in 1988, inspired by the craftmanship of Switzerland's mechanical heartland, Romanshorn.<br/>
                        ROMANSON is currently operating global business network in more than 70 countries,<br/>
                        maintaining steady growth as one of the global leaders in watch industry. -->
                    </span>
                    <a href="#" class="mallLink">Online shop</a>
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
        <%@ include file="/WEB-INF/views/en/common/html.footer.jsp" %>
    </div>
<script>
jt_load(0);
closeLoadingWithMask();
</script>    
</body>
</html>                