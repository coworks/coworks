<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 회원정보 수정</title>
<style>
	.fontw {
		font-weight : bold;
	}
</style>
<c:import url="../common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/templates/assets/plugins/dropify/dist/css/dropify.min.css">
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body col-8 align-self-center">
								<h3 class="box-title text-themecolor">회원정보 수정</h3>
								<form class="form-control-line mt-5 form-group-danger" method="post" action="editMypageEnd.do" id="update" enctype="multipart/form-data">
									
									<div class="form-group">
										<label class="fontw"><i class=" ti-help-alt"></i>　현재 비밀번호</label> <input type="password" name="pre_password" id="pre_password" class="form-control" placeholder="password">
									</div>
									<input type="hidden" value="${sessionScope.employee.emp_password}" id="hiddenPw"/>
									<br>
									<div class="form-group">
										<label class="fontw"><i class="ti-info-alt"></i>　변경할 비밀번호</label> <input type="password" name="new_password" id="new_password"  class="form-control pw" placeholder="password">
									</div>
									
									<div class="form-group">
										<label class="fontw"><i class="ti-info-alt"></i>　비밀번호 확인</label> <input type="password" name="emp_password" id="emp_password"  class="form-control pw" placeholder="password">
									</div>
									<br>
									<%-- <div class="form-group">
										<label class="fontw"><i class="ti-email"></i>　이메일</label> <input type="email" placeholder="email 입력" name="emp_email" value="${ sessionScope.employee.emp_email }" class="form-control">
									</div>
									<div class="form-group">
										<label class="fontw"><i class="ti-info-alt"></i>　비밀번호 확인</label> <input type="password" placeholder="email password 입력"  id="emp_emailpassword" name="emp_emailpassword" class="form-control" value="${sessionScope.employee.emp_emailpassword }">
									</div>
									 --%> 
									 <div class="form-group">
									 	<label class="fontw"><i class=" ti-help-alt"></i>
									 	&nbsp;&nbsp;   이메일 인증하기　</label>
									 	<a  href="${pageContext.request.contextPath}/mail/reAuth.do">
											<div type="button" class="btn waves-effect waves-light btn-block btn-info">
											 이메일 인증하기
											</div>
										</a>
									</div>
									<br>
									<br>
									<div class="form-group">
										<label class="fontw"><i class=" ti-mobile"></i>　연락처</label> <input type="text" name="emp_phone" class="form-control phone-inputmask" id="phone-mask" im-insert="true" value="${ sessionScope.employee.emp_phone }" placeholder="010-0000-xxxx">
									</div>
									<br>
									<div class="form-group">
										<div class="col-lg-6 col-12 mb-2">
											<div class="row">
												<label class="fontw"><i class="ti-direction"></i>　주소</label>
											</div>
											<div class="row">
												<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control col-md-9 col-12 mb-2" onclick="sample6_execDaumPostcode()">
												<p  class="btn btn-warning" onclick="sample6_execDaumPostcode()"> 우편번호 찾기 </p>
												
											</div>
										</div>
										<input type="text" name="address1" id="sample6_address" placeholder="주소" value="${ sessionScope.employee.emp_address }" class="form-control mb-2"> 
										<input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> 
										<input type="hidden" id="sample6_extraAddress" class="form-control mb-2" placeholder="참고항목"
										>
									</div>
									<br>
									<div class="form-group">
										<label class="fontw"><i class="ti-stamp"></i>　개인서명</label>
										<!-- 										<div class="fileinput fileinput-new input-group" data-provides="fileinput">
											<div class="form-control" data-trigger="fileinput">
												<i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span>
											</div>
											<span class="input-group-addon btn btn-secondary btn-file"> <span class="fileinput-new">선택하기</span> <span class="fileinput-exists">바꾸기</span> <input type="file" name="...">
											</span> <a href="#" class="input-group-addon btn btn-danger fileinput-exists ml-1" data-dismiss="fileinput">삭제</a>
										</div> -->
										<input type="file" id="input-file-now-custom-1" class="dropify" name="emp_signature1" data-default-file="${pageContext.request.contextPath }/resources/images/empSign/stamp.png" />

									</div>

									<div align="center">
										<input type="button" id="sub" value="수정하기" class="btn btn-outline-info" /> &nbsp;&nbsp;&nbsp;
										<input type="reset" value="초기화" class="btn btn-outline-success" /> &nbsp;&nbsp;&nbsp;
										<input type="button" value="취소" class="btn btn-outline-dark"
											onclick="javascript:history.back();"
										/>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script src="${pageContext.request.contextPath }/resources/templates/resources/js/jasny-bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/dropify/dist/js/dropify.min.js"></script>
	<script>
	
	$("#sub").on("click",function(){
		if( $("#pre_password") != null){
			if($("#pre_password").val() == $("#hiddenPw").val()){
				if($("#new_password").val() == $("#emp_password").val()){	
					alert("수정이 완료되었습니다.");
					$("#update").submit();
				}else alert("변경할 비밀번호가 일치하지 않습니다.");
			}else alert("현재 비밀번호가 일치하지 않습니다.");
		} else alert("현재 비밀번호를 입력해주세요");
		
	});
		function agg() {
			console.log($('input:file'));
		}
		
		$("#pre_password").on("change",function(){
			if($("#pre_password").val() == $("#hiddenPw").val()){
				$("#pre_password").removeClass("form-control-danger");
				$("#pre_password").parent().eq(0).removeClass("has-danger");

				$("#pre_password").addClass("form-control-success");
				$("#pre_password").parent().eq(0).addClass("has-success");
			}
			else{
				console.log("일치 x");

				$("#pre_password").removeClass("form-control-success");
				$("#pre_password").parent().eq(0).removeClass("has-success");
				$("#pre_password").addClass("form-control-danger");
				$("#pre_password").parent().eq(0).addClass("has-danger");
			}
		});
		
		
		$(".pw").on("change",function(){
			if($("#new_password").val() == $("#emp_password").val()){
				$("#emp_password").removeClass("form-control-danger");
				$("#emp_password").parent().removeClass("has-danger");

				$("#emp_password").addClass("form-control-success");
				$("#emp_password").parent().addClass("has-success");
			}
			else{
				$("#emp_password").removeClass("form-control-success");
				$("#emp_password").parent().removeClass("has-success");
				$("#emp_password").addClass("form-control-danger");
				$("#emp_password").parent().addClass("has-danger");
			}
		});	
	
		$(document).ready(
				function() {
					// Basic
					$('.dropify').dropify();

					// Used events
					var drEvent = $('#input-file-events').dropify();

					drEvent.on('dropify.beforeClear', function(event, element) {
						return confirm("Do you really want to delete \""
								+ element.file.name + "\" ?");
					});

					drEvent.on('dropify.afterClear', function(event, element) {
						alert('File deleted');
					});

					drEvent.on('dropify.errors', function(event, element) {
						console.log('Has Errors');
					});

					var drDestroy = $('#input-file-to-destroy').dropify();
					drDestroy = drDestroy.data('dropify')
					$('#toggleDropify').on('click', function(e) {
						e.preventDefault();
						if (drDestroy.isDropified()) {
							drDestroy.destroy();
						} else {
							drDestroy.init();
						}
					})
				});

		$(function() {
			$(".phone-inputmask").inputmask("999-9999-9999");
		})
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>
</body>
</html>