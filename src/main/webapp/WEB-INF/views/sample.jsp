<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>J.ESTINA</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/rem.css" />
    <link rel="stylesheet" type="text/css" href="/css/font/NotoSansKR.css" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@500&display=swap">
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/css/lang/Chinese.css" />
    <script type="text/javascript" src="/scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/scripts/common.js"></script>
<script>
function LoadingWithMask() {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(window).height();
    var maskWidth = $(window).width();
     
    //화면에 출력할 마스크를 설정해줍니다.
    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg ='';
      
    loadingImg +="<div id='loadingImg'>";
    loadingImg +=" <img src='/images/loading.gif' style='position: relative; display: block; margin: 0px auto;'/>";
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
    alert("fdfsdf");
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
        <!--Header-->
        <header>
            <h1 class="logo"><a href="/"><img src="/images/common/logo.svg"/></a></h1>
            <!--GNB-->
            <nav>
                <div class="menuList">
                    <dl>
                        <dt><a href="#">公司简介</a></dt>
                        <dd>
                            <a href="#"><span>愿景</span></a>
                            <a href="#"><span>沿革</span></a>
                            <a href="#"><span>业务领域</span></a>
                            <a href="#"><span>BI</span></a>
                            <a href="#"><span>Contact</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="#">品牌</a></dt>
                        <dd>
                            <a href="#"><span>J.ESTINA JEWELRY</span></a>
                            <a href="#"><span>J.ESTINA HANDBAG</span></a>
                            <a href="#"><span>ROMANSON</span></a>
                            <a href="#"><span>ARCHIVE</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="#">店铺简介</a></dt>
                        <dd>
                            <a href="#"><span>韩国国内</span></a>
                            <a href="#"><span>海外</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="#">新闻</a></dt>
                        <dd>
                            <a href="#"><span>公告事项</span></a>
                            <a href="#"><span>新闻</span></a>
                        </dd>
                    </dl>
                </div>
                <div class="bgLine">&nbsp;</div>
            </nav>
            <!--//GNB-->
            <div class="link">
                <a href="#" class="lang">KR</a>
                <a href="#" class="lang">EN</a>
                <a href="#" class="lang on">CN</a>
                <a href="#" class="mall">ONLINE SHOP</a>
            </div>
            <!--Mobile GNB-->
            <div class="mobileGNB">
                <div class="ctrl"><a href="#" class="mall">ONLINE SHOP</a><a href="#" class="menuClose"><img src="/images/common/icon_mobile_menu_close.svg"/></a></div>
                <div class="moMenuList"></div>
                <div class="lang">
                    <a href="#" class="on">KR</a>
                    <a href="#">EN</a>
                    <a href="#">CN</a>
                </div>
            </div>
            <!--//Mobile GNB-->
            <div class="menuBG">&nbsp;</div>
            <a href="#" class="moMenuopen"><img src="/images/common/icon_mobile_menu.svg"/></a>
        </header>
        <!--//Header-->
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
            <section class="topVisual">
                <div class="commImgArea">
                    <img src="/images/brand_romanson_visual.jpg" class="forPC"/>
                    <img src="/images/brand_romanson_visual_mo.jpg" class="forMobile"/>   
                </div>
            </section>
            <section class="content">
                <!--Top Text-->
                <article class="topText">
                    <dl>
                        <dt><span><b>ROMANSON</b><i></i></span></dt>
                        <dd>
                            <a href="#">NEW ARRIVALS</a>
                            <a href="#" class="on">DE ARBON</a>
                            <a href="#">PREMIER</a>
                            <a href="#">ACTIVE</a>
                            <a href="#">ELEVE</a>
                            <a href="#">CLASSIC</a>
                            <a href="#">LADY</a>
                            <a href="#">SPORTS</a>
                            <a href="#">TROFISH</a>
                            <a href="#">LIMITED EDITION</a>
                        </dd>
                    </dl>
                    <span class="text">
                        988年，从因手表而闻名的瑞士罗曼斯霍恩中获得灵感，诞生了ROMANSON这一品牌， <br/>
                        该品牌自1997年起参加全球最大的钟表博览会“巴塞尔国际珠宝钟表展”，并在名品馆中进行展览。
                    </span>
                    <a href="#" class="mallLink">Online shop</a>
                </article>
                <!--//Top Text-->
                <!--Controller-->
                <article class="controller">
                    <div>
                        <a href="#" class="prevPrd"><span>LIMITED EDITION</span><img src="/images/icon_brand_romanson_prev.svg"/> </a>
                        <div class="nowPrd">DE ARBON</div>
                        <a href="#" class="nextPrd"><span>PREMIER</span><img src="/images/icon_brand_romanson_next.svg"/></a>
                    </div>
                </article>
                <!--//Controller-->
                <!--Product List-->
                <article class="productList">
                    <ul>
                        <!--Set-->
                        <li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li><li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li>
                        <!--//Set-->
                        <!--Set-->
                        <li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li>
                        <!--//Set-->
                        <!--Set-->
                        <li>
                            <a href="#">
                                <div class="photo"><img src="/images/sample/CB9A08HM.png"/></div>
                                <div class="name">CB9A08HM</div>
                                <div class="cate">ROMANSON DE ARBON</div>
                            </a>
                        </li>
                        <!--//Set-->
                    </ul>
                </article>
                <!--//Product List-->
            </section>
        </div>
        <!--Footer-->
        <footer>
            <article>
                <div class="cmpyInfo">
                    <a href="#" class="contact">Contact</a>
                    <ul>
                        <li class="adr"><span>(株)J.ESTINA</span><span>首尔特别市松坡区良才大路62街53，J.ESTINA大厦</span></li>
                        <li><span>法人代表 : 金侑美、张镐宣</span><span>电话号码  080-998-0077 </span></li>
                    </ul>
                </div>
                <div class="copyright">
                    <ul class="social">
                        <li><a href="#"><img src="/images/common/icon_footer_insta.svg"/>Jewelry</a></li>
                        <li><a href="#"><img src="/images/common/icon_footer_insta.svg"/>Handbag</a></li>
                        <li><a href="#"><img src="/images/common/icon_footer_youtube.svg"/>Youtube</a></li>
                        <li><a href="#"><img src="/images/common/icon_footer_facebook.svg"/>Facebook</a></li>
                    </ul>
                    COPYRIGHT © J.ESTINA RESERVED.
                </div>
                <a href="#" class="goTop">GO Top</a>
            </article>
        </footer>
        <!--//Footer-->
    </div>
</body>
</html>
<script>
jt_load(0);
closeLoadingWithMask();
</script>