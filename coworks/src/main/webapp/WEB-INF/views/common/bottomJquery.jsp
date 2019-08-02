<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap tether Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="${pageContext.request.contextPath}/resources/templates/resources/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="${pageContext.request.contextPath}/resources/templates/resources/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${pageContext.request.contextPath}/resources/templates/resources/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="${pageContext.request.contextPath}/resources/templates/resources/js/custom.js"></script>
<!-- ============================================================== -->
<!-- Style switcher -->
<!-- ============================================================== -->
<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>

<script type="text/javascript">
	var sock = new SockJS("<c:url value='/count'/>");

	sock.onmessage = onMessage;

	function onMessage(evt) {
		var data = JSON.parse(evt.data);

		if (data.length != 0) {
			$('#approvalHeartbit').css('display', 'block');
			$('#approvalNoMSG').css('display', 'none');
			$('#approvalCnt').html('결재 미결함(' + data.length + ')');

			for (var i = 0; i < data.length; i++) {
				var alink = $('<a>').attr('href','${pageContext.request.contextPath }/approval/approvalDoc/v/'+data[i].adoc_no);
				var mail_content=$("<div class='btn btn-danger btn-circle'><i class='fa fa-link'></i></div><div class='mail-contnet'>");
				mail_content.append("<h5>"+data[i].adoc_subject+"</h5>");
				mail_content.append("<span class='mail-desc'>"+data[i].writerName+"</span>");
				mail_content.append(" <span class='time'>"+data[i].adoc_uploadDate+"</span>");
				
				
				$('#approvalMSG').append(alink).append(mail_content);
				
			}

		}

		console.log(data);

	}
</script>

