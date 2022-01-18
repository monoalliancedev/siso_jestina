<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="popup">
	<div class="popup_content"></div>
</div>

<div class="md-modal md-just-me" id="logout-modal">
	<div class="md-content">
		<h3><strong>로그아웃</strong>확인</h3>
		<div>
			<p class="text-center">한국투자금융지주 관리시스템에서 로그아웃 하시겠습니까?</p>
			<p class="text-center">
				<button class="btn btn-danger md-close">아니오</button>
				<a href="/jtadm/logout" class="btn btn-success md-close">예, 로그아웃하겠습니다.</a>
			</p>
		</div>
	</div>
</div>

<!-- the overlay modal element -->
<div class="md-overlay">
</div>
<!-- End of eoverlay modal -->
<script>var resizefunc = [];</script>


<script src="/adm/assets/libs/jquery-ui-touch/jquery.ui.touch-punch.min.js"></script>
<script src="/adm/assets/libs/jquery-detectmobile/detect.js"></script>
<script src="/adm/assets/libs/jquery-animate-numbers/jquery.animateNumbers.js"></script>
<script src="/adm/assets/libs/ios7-switch/ios7.switch.js"></script>
<script src="/adm/assets/libs/fastclick/fastclick.js"></script>
<script src="/adm/assets/libs/jquery-blockui/jquery.blockUI.js"></script>
<script src="/adm/assets/libs/bootstrap-bootbox/bootbox.min.js"></script>
<script src="/adm/assets/libs/jquery-slimscroll/jquery.slimscroll.js"></script>
<script src="/adm/assets/libs/jquery-sparkline/jquery-sparkline.js"></script>
<script src="/adm/assets/libs/nifty-modal/js/classie.js"></script>
<script src="/adm/assets/libs/nifty-modal/js/modalEffects.js"></script>
<script src="/adm/assets/libs/sortable/sortable.min.js"></script>
<script src="/adm/assets/libs/bootstrap-fileinput/bootstrap.file-input.js"></script>
<script src="/adm/assets/libs/bootstrap-select/bootstrap-select.min.js"></script>
<script src="/adm/assets/libs/bootstrap-select2/select2.min.js"></script>
<script src="/adm/assets/libs/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="/adm/assets/libs/pace/pace.min.js"></script>
<script src="/adm/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/adm/assets/libs/jquery-icheck/icheck.min.js"></script>
<!-- Demo Specific JS Libraries -->
<script src="/adm/assets/libs/prettify/prettify.js"></script>
<script src="/adm/assets/js/init.js"></script>
<script src="/adm/assets/libs/bootstrap-inputmask/inputmask.js"></script>

<script src="/adm/js/jquery.bpopup.min.js?v=<?=date('YmdHisu')?>"></script>

<script>
function profile_goEdit(){	

	var windowWT = $(window).width() / 2;
	var windowHT = $(window).height() / 2;
	
	alert(windowWT+"//"+windowHT+"//myEditPopup")
	//bPopup = openModalPopup("/jtadm/profile_edit",16571,1281);
	bPopup = openModalPopup("/jtadm/manager/myEditPopup",windowWT,windowHT);


	//bPopup = openModalPopup("/jtadm/myEditPopup",windowWT,windowHT);
}

var bPopup;
function openModalPopup(src, wPop, hPop){
	var bPopup2 =
	$("#popup").bPopup({
		scrollbar:true,
		positionStyle:'absolute',
		content:'iframe',
		contentContainer:'.popup_content',
		iframeAttr:('frameborder="0" border="0" height="100%" scrolling="yes"'),
		loadUrl:src,
		onOpen: function() {
			$("#popup").css('width',wPop).css('height',hPop);
			$(".popup_content").css('width','100%').css('height','100%');
			$(".popup_content .b-iframe").css('width','100%').css('height','100%');
			//$(".content").css('width',w).css('height',h);
		},
		onClose: function() {
		}
	});
	return bPopup2;
}
</script>

