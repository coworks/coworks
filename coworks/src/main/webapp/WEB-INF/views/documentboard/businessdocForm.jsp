<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 작성 폼</title>

<c:import url="../common/header.jsp" />

<!-- wysihtml5 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/bootstrap-wysihtml5.css" />

<!-- Dropzone css -->
<link
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/dropzone-master/dist/dropzone.css"
	rel="stylesheet" type="text/css" />




</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />

		<div class="page-wrapper">
			<div class="container-fluid ">

				<!-- 시작 -->

				<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<h3 class="text-themecolor mb-0 mt-0">COWORKS 글 작성하기</h3>

					</div>

				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="card">



							<div class="col-xlg-9 col-lg-8 col-md-7 align-self-center">
								<div class="card-body" style="margin-bottom: 7%;">
									<h3 class="card-title text-primary">새 글 등록</h3>
									<form class="all-form" id="docEnrollFrm" action="${pageContext.request.contextPath}/documentboard/insert"
											method="post" enctype="multipart/form-data">
									<div class="form-group">
										
											<select class="form-control custom-select" id="select1"
												name="bo_code" style="width: 18%;">
												<!-- onchange="itemChange(this)" -->
												<option value="0">자료실 선택</option>
												<option value="D50">사내규정</option>
												<option value="D51">업무문서</option>
												<option value="D52">교육문서</option>
												<option value="DD">부서</option>
											</select>
											<select class="form-control custom-select" id="select2"
												name="dep_code" style='display: none; width: 18%;'>
												<c:forEach items="${departmentList}" var="de">
													<option value="${de.dept_code}">${de.dept_name}</option>
												</c:forEach>

											</select>
											<input type="text" name="emp_no" value="${sessionScope.employee.emp_no }" hidden/>
											<input type="text" name="writerName" value="${sessionScope.employee.emp_name }" hidden/>
											<h4 name="writerName" style="float: right; padding-top: 5px;">작성자
												: ${sessionScope.employee.emp_name}</h4>
									</div>
									<div class="form-group">
										<input class="form-control" name="bo_title"
											placeholder="제목을 입력하세요.">
									</div>
									<div class="form-group">

										<textarea class="textarea_editor form-control" name="bo_content"
											rows="15" placeholder="내용을 입력하세요."></textarea>

									</div>
									<c:import url="../approval/approvalDoc/approvalWriteForm/common/approvalAttachAdd.jsp" />
									
								
									<div style="float: right;">
										<button class="btn btn-success mt-3" type="submit" onclick="return validate();">
											<i class="far fa-check-circle"></i> 등록
										</button>
										&nbsp;
										<button class="btn btn-danger mt-3" onclick="goback();">
											<i class=" far fa-times-circle"></i> 취소
										</button>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				</div>

				<!-- 끝 -->

			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />

	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/wysihtml5-0.3.0.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/bootstrap-wysihtml5.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/dropzone-master/dist/dropzone.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>


	<script>
		$(document).ready(function() {
			$('.textarea_editor').wysihtml5();
		});


		function deleteBtn(obj) {
			$(obj).parent().remove();
		}

		$("#select1").on("change", function() {

			console.log($(this).val());

			if ($(this).val() == 'DD')
				$("#select2").css("display", "block");
			else
				$("#select2").css("display", "none");
			

		});

		function goback() {
			console.log("뒤로가기. --> 알람이 뜨면서 작성 취소할건지 물어봐야 함 / Form, UpdateView 둘 다 해야 한다.")
			window.history.go(-1);
		}

		function validate() {
			var boardCode = $("#select1").val();

			if (boardCode == "0") {
				alert("등록할 자료실을 선택하세요.");
				return false;
			}
			
			alert("딩동댕!!!!!!!!! 글을 등록하겠냐고 모달 뜨게 하장1!! (취소=닫기),(등록)");
			
			return true;
		}

	</script>

</body>
</html>