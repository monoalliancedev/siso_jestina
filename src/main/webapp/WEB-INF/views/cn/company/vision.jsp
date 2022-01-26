<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/WEB-INF/views/cn/common/html.head.jsp" %>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/views/cn/common/headerAndMenu.jsp" %>
        <script type="text/javascript" src="/scripts/language/subCN.js"></script>
        <script type="text/javascript" src="/scripts/company.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/company.css" />
        <div id="container" class="sub company vision">
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
            <section class="topVisual"></section>
            <section class="content">
                <article>
                    <div>
                        <h4>VISION</h4>
                        <p>分享每一个闪光时刻的全球生活方式创造者</p>
                    </div>
                    <div>
                        <h4>MISSION</h4>
                        <p>- 我们通过创造一种结合时尚、文化和艺术的新生活方式，让世界更快乐。</p>
                        <p>- 我们将通过不断的创新创造独特的文化价值，并将其推向世界。</p>
                    </div>
                    <div>
                        <h4>核心价值</h4>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_01.png"/></span></li>
                            <li class="text"><span>创造力</span>Creativity</li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_02.png"/></span></li>
                            <li class="text"><span>挑战精神</span>Challenge</li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_03.png"/></span></li>
                            <li class="text"><span>相信</span>Trust</li>
                        </ul>
                        <ul>
                            <li><span class="icon"><img src="/images/company_icon_04.png"/></span></li>
                            <li class="text"><span>沟通</span>Communication</li>
                        </ul>
                    </div>
                </article>
            </section>
        </div>
        <%@ include file="/WEB-INF/views/cn/common/html.footer.jsp" %>
    </div>
</body>
</html>