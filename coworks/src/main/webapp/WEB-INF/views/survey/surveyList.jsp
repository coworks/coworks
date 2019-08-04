<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>co-works : 설문조사</title>
<c:import url="../common/header.jsp" />



</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />

		<div class="modal" id="insertSurvey" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-l">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="myLargeModalLabel">설문조사 등록하기</h2>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="form-body">
						<form method="post" action="employeeEnroll.do"
							name="employeeEnroll">
							<div class="card-body">
								<div class="row pt-3">
									<div class="col-md-12">
										<div class="form-group">
											<label class="control-label">제목 </label> <input type="text"
												id="emp_name" name="emp_name" class="form-control"
												placeholder="">
											<!-- <small class="form-control-feedback"> This is inline help </small> -->
										</div>
									</div>
								</div>
								<!--/span-->

								<div class="col-md-13">
									<div class="form-group">
										<label class="control-label">시작일시 </label> <input type="date"
											id="emp_birth" name="emp_birth" class="form-control"
											placeholder="1992-08-31">
										<!-- <small class="form-control-feedback"> This is inline help </small> -->
									</div>
								</div>

								<div class="col-md-13">
									<div class="form-group">
										<label class="control-label">종료일시 </label> <input type="date"
											id="emp_birth" name="emp_birth" class="form-control"
											placeholder="1992-08-31">
										<!-- <small class="form-control-feedback"> This is inline help </small> -->
									</div>
								</div>

								<div id="surveyadditem" class="col-md-13">
									<div class="form-group">
										<label class="control-label">항목추가하기 </label> <input style="margin-left:330px;"
											type="button" id='button-add-file' value='+'
											class="btn btn-outline-secondary btn-sm" /> <input
											type="text" id="emp_name1" name="emp_name1"
											class="form-control">
											
											<input style="margin-top:10px;" type="text" id="emp_name2" name="emp_name2"
											class="form-control">

										<!-- <small class="form-control-feedback"> This is inline help </small> -->
									</div>
								</div>
								
								<div style="margin-left: 280px; margin-top: 40px;">
									<button class="btn btn-info" type="submit">등록하기</button>
									<button type="button"
										class="btn btn-danger waves-effect text-left"
										data-dismiss="modal">취소하기</button>
								</div>
							</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>



	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="m-6 p-6">
								<h4 class="card-title">설문조사</h4>
								<p class="card-text">이 페이지가 마음에 드시나요?!</p>
								<p class="card-text">
									<small class="text-muted">2019-07-01 ~ 2019-07-31</small>
								</p>
								<h5 class="mt-4">
									YES!!<span class="float-right">85%</span>
								</h5>
								<div class="progress ">
									<div
										class="progress-bar bg-success wow animated progress-animated"
										style="width: 85%; height: 6px;" role="progressbar">
										<span class="sr-only">60% Complete</span>
									</div>
								</div>
								<h5 class="mt-4">
									No :(<span class="float-right">15%</span>
								</h5>
								<div class="progress ">
									<div
										class="progress-bar bg-danger wow animated progress-animated"
										style="width: 15%; height: 6px;" role="progressbar">
										<span class="sr-only">60% Complete</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mt-5 pt-5">
						<div class="input-group">
							<button data-toggle="modal" data-target="#insertSurvey"
								class="btn btn-info" type="button">새로운 설문조사 등록하기</button>
							</td>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../common/footer.jsp" />
	</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />

	<script>
	var count = 0;
	$('#button-add-file')
			.on(
					"click",
					function() {
						var 
						html = "<input type='text' style='margin-top:10px;' name='surveyitem' class='form-control'/>";
						/* html += "<input type='button' onclick='deleteBtn(this)' class='btn  btn-outline-danger btn-xs' value='X'/></div>"; */
						count++;
						$("#surveyadditem").append(html);
					});

	function deleteBtn(obj) {
		$(obj).remove();
	}
</script>

</body>
</html>