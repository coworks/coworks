<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS</title>
<c:import url="./header.jsp" />
</head>

<body>
	<div class="swal2-container swal2-center swal2-fade swal2-shown" style="overflow-y: auto;">
		<div aria-labelledby="swal2-title" aria-describedby="swal2-content" class="swal2-popup swal2-modal swal2-show" tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true"
			style="display: flex;"
		>
			<div class="swal2-header">
				<ul class="swal2-progress-steps" style="display: none;"></ul>
				<div class="swal2-icon swal2-error swal2-animate-error-icon" style="display: flex;">
					<span class="swal2-x-mark"><span class="swal2-x-mark-line-left"></span><span class="swal2-x-mark-line-right"></span></span>
				</div>
				<div class="swal2-icon swal2-question" style="display: none;"></div>
				<div class="swal2-icon swal2-warning" style="display: none;"></div>
				<div class="swal2-icon swal2-info" style="display: none;"></div>
				<div class="swal2-icon swal2-success" style="display: none;">
					<div class="swal2-success-circular-line-left" style="background-color: rgb(255, 255, 255);"></div>
					<span class="swal2-success-line-tip"></span> <span class="swal2-success-line-long"></span>
					<div class="swal2-success-ring"></div>
					<div class="swal2-success-fix" style="background-color: rgb(255, 255, 255);"></div>
					<div class="swal2-success-circular-line-right" style="background-color: rgb(255, 255, 255);"></div>
				</div>
				<img class="swal2-image" style="display: none;">
				<h2 class="swal2-title" id="swal2-title" style="display: flex;">로그인이 필요합니다!</h2>
				<button type="button" class="swal2-close" aria-label="Close this dialog" style="display: none;">×</button>
			</div>
			<div class="swal2-content">
				<div id="swal2-content" style="display: block;">로그인 세션이 만료되었거나, 다른 사용자가 현재 아이디로 로그인되었습니다.</div>
				<input class="swal2-input" style="display: none;"><input type="file" class="swal2-file" style="display: none;">
				<div class="swal2-range" style="display: none;">
					<input type="range">
					<output></output>
				</div>
				<select class="swal2-select" style="display: none;"></select>
				<div class="swal2-radio" style="display: none;"></div>
				<label for="swal2-checkbox" class="swal2-checkbox" style="display: none;"><input type="checkbox"><span class="swal2-label"></span></label>
				<textarea class="swal2-textarea" style="display: none;"></textarea>
				<div class="swal2-validation-message" id="swal2-validation-message" style="display: none;"></div>
			</div>
			<div class="swal2-actions" style="display: flex;">
				<button type="button" id="okBtn" class="swal2-confirm swal2-styled" aria-label="" style="display: inline-block; border-left-color: rgb(48, 133, 214); border-right-color: rgb(48, 133, 214);">OK</button>
				<button type="button" class="swal2-cancel swal2-styled" aria-label="" style="display: none;">Cancel</button>
			</div>
		</div>
	</div>
	<script>
		$('#okBtn')
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}";
						});
	</script>
	<c:import url="./bottomJquery.jsp" />
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
	<%-- <script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/sweetalert2/sweet-alert.init.js"></script>
 --%>
</body>
</html>
