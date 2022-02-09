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
</head>
<body>
<script>
        function loading_st() {
            var ct_left = (parseInt(window.screen.width) - 450) / 2;
            var ct_top = (parseInt(window.screen.height)) / 3;
            layer_str = "<div id='loading_layer' style='position:absolute; background-color:; font-size:15px; left:" + ct_left + "px; top:" + ct_top + "px; width:400px; height:; padding:50px; text-align:center; vertical-align:middle; z-index:1000; font-weight: bold;'>로딩중입니다.</div>"
            document.write(layer_str);
        }
        function loading_ed() {
			alert("11111111");
            var ta = document.getElementById('loading_layer');
            ta.style.display = 'none';
        }
        loading_st();
        window.onload = loading_ed;


</script>
    <div id="wrap">
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
//closeLoadingWithMask();
</script>