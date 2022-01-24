<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <title>J.ESTINA</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/rem.css" />
    <link rel="stylesheet" type="text/css" href="/css/font/NotoSansKR.css" />
    <link rel="stylesheet" type="text/css" href="/css/common.css" />
    <script type="text/javascript" src="/scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/scripts/common.js"></script>
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
                        <dt><a href="#">COMPANY</a></dt>
                        <dd>
                            <a href="#"><span>비전</span></a>
                            <a href="#"><span>연혁</span></a>
                            <a href="#"><span>사업영역</span></a>
                            <a href="#"><span>BI</span></a>
                            <a href="#"><span>Contact</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="#">BRAND</a></dt>
                        <dd>
                            <a href="#"><span>J.ESTINA JEWELRY</span></a>
                            <a href="#"><span>J.ESTINA HANDBAG</span></a>
                            <a href="#"><span>ROMANSON</span></a>
                            <a href="#"><span>ARCHIVE</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="#">STORE</a></dt>
                        <dd>
                            <a href="#"><span>국내</span></a>
                            <a href="#"><span>해외</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="#">RECRUIT</a></dt>
                        <dd>
                            <a href="#"><span>인재상</span></a>
                            <a href="#"><span>직무소개</span></a>
                            <a href="#"><span>기업문화/복리후생</span></a>
                            <a href="#"><span>채용공고</span></a>
                            <a href="#"><span>인재풀등록</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="#">IR</a></dt>
                        <dd>
                            <a href="#"><span>주가정보</span></a>
                            <a href="#"><span>공시정보</span></a>
                            <a href="#"><span>공고</span></a>
                        </dd>
                    </dl>
                    <dl>
                        <dt><a href="#">NEWS</a></dt>
                        <dd>
                            <a href="#"><span>공지사항</span></a>
                            <a href="#"><span>뉴스</span></a>
                        </dd>
                    </dl>
                </div>
                <div class="bgLine">&nbsp;</div>
            </nav>
            <!--//GNB-->
            <div class="link">
                <a href="#" class="lang on">KR</a>
                <a href="#" class="lang">EN</a>
                <a href="#" class="lang">CN</a>
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
        <script type="text/javascript" src="/scripts/sub.js"></script>
        <script type="text/javascript" src="/scripts/company.js"></script>
        <div id="container" class="sub company vision">
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
            <section class="topVisual"></section>
            <section class="content">
                <article>
                    <div>
                        <h4>VISION</h4>
                        <p>빛나는 모든 순간을 함께 하는 <b>Global Lifestyle Creator</b></p>
                    </div>
                    <div>
                        <h4>MISSION</h4>
                        <p>- 우리는 패션, 문화, 예술을 융합한 <b>New Lifestyle</b>을<br/> <b>창조</b>함으로써 <b>세상을 더 행복하게 만듭니다.</b></p>
                        <p>- 우리는 끊임없는 혁신을 통해 <b>고유의 문화적 가치를 창출</b>하고<br/> 이를 <b>전세계에 널리 알리겠습니다.</b></p>
                    </div>
                    <div>
                        <h4>핵심가치</h4>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_01.png"/></span></li>
                            <li class="text"><span>창의성</span>Creativity</li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_02.png"/></span></li>
                            <li class="text"><span>도전정신</span>Challenge</li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_03.png"/></span></li>
                            <li class="text"><span>신뢰</span>Trust</li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_04.png"/></span></li>
                            <li class="text"><span>신뢰</span>Trust</li>
                        </ul>
                    </div>
                </article>
            </section>
        </div>
        <!--Footer-->
        <footer>
            <article>
                <div class="cmpyInfo">
                    <a href="#" class="contact">Contact</a>
                    <ul>
                        <li class="adr"><span>JESTINA Co., Ltd</span><span>Jestina Building, 53, Yangjae-daero 62-gil, Songpa-gu, Seoul</span></li>
                        <li><span>CEO : KIM YU MI, JANG HO SEON</span><span>CPO: JANG HO SEON</span></li>
                        <li><span>No. 215-81-03705</span><span>Customer Center : 080-998-0077</span></li>
                    </ul>
                </div>
                <div class="copyright">
                    <ul class="social">
                        <li><a href="#"><img src="/images/common/icon_footer_insta.svg"/>Jewelry</a></li>
                        <li><a href="#"><img src="/images/common/icon_footer_insta.svg"/>Handbag</a></li>
                        <li><a href="#"><img src="/images/common/icon_footer_youtube.svg"/>Youtube</a></li>
                        <li><a href="#"><img src="/images/common/icon_footer_facebook.svg"/>Facebook</a></li>
                    </ul>
                    COPYRIGHT © J.ESTINA RESERVED
                </div>
                <a href="#" class="goTop">GO Top</a>
            </article>
        </footer>
        <!--//Footer-->
    </div>
</body>
</html>