<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 회원정보 수정</title>
<c:import url="../common/header.jsp" />
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
							<div class="card-body">
								<h3 class="box-title">회원정보 수정</h3>
								<form class="form-control-line mt-5" method="post" action="updateEmpInfo.do">
									<div class="form-group">
										<label>현재 비밀번호</label> <input type="password" class="form-control" value="password">
									</div>
									<div class="form-group">
										<label>변경할 비밀번호</label> <input type="password" class="form-control" value="password">
									</div>
									<div class="form-group">
										<label>비밀번호 확인</label> <input type="password" class="form-control" value="password">
									</div>
									<div class="form-group">
										<label>이메일</label> <input type="email" name="emp_email" class="form-control">
									</div>
									<div class="form-group">
										<label>연락처</label> <input type="text" class="form-control phone-inputmask" id="phone-mask" im-insert="true" value="01012341234" placeholder="010-1234-1234">
									</div>
									<div class="form-group">
										<div class="col-lg-6 col-12 mb-2">
											<div class="row">
												<label>주소</label>
											</div>
											<div class="row">
												<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control col-md-9 col-12 mb-2">
												<div class="col-md-3 col-5 ">
													<span class="btn btn-warning" onclick="sample6_execDaumPostcode()"> 우편번호 찾기</span>
												</div>
											</div>
										</div>
										<input type="text" id="sample6_address" placeholder="주소" class="form-control mb-2"> <input type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> <input type="hidden" id="sample6_extraAddress" class="form-control mb-2" placeholder="참고항목">
									</div>
									<div class="form-group">
										<label>개인서명</label>
										<div class="fileinput fileinput-new input-group" data-provides="fileinput">
											<div class="form-control" data-trigger="fileinput">
												<i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span>
											</div>
											<span class="input-group-addon btn btn-secondary btn-file"> <span class="fileinput-new">선택하기</span> <span class="fileinput-exists">바꾸기</span> <input type="file" name="...">
											</span> <a href="#" class="input-group-addon btn btn-danger fileinput-exists ml-1" data-dismiss="fileinput">삭제</a>
										</div>
									</div>
									<div align="center">
										<input type="submit" value="수정하기" class="btn btn-info" /> <input type="reset" value="초기화" class="btn btn-danger" /> <input type="button" value="취소" class="btn btn-secondary" onclick="javascript:history.back();" />
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
	<script>
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