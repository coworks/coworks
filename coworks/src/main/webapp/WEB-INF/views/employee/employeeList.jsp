<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>co-works : 인사관리</title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="modal bs-example-modal-lg" tabindex="-1" role="dialog"
			aria-labelledby="myLargeModalLabel" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="myLargeModalLabel">사원추가</h2>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="form-body">
						<form method="get" action="employeeEnroll.do"
							name="employeeEnroll">
							<div class="card-body">
								<div class="row pt-3">
									<div class="col-md-3">
										<div class="form-group">
											<label class="control-label">이름 </label> <input type="text"
												id="emp_name" name="emp_name" class="form-control"
												placeholder="">
											<!-- <small class="form-control-feedback"> This is inline help </small> -->
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="control-label">생년월일 </label> <input type="text"
												id="emp_birth" name="emp_birth" class="form-control"
												placeholder="19920831">
											<!-- <small class="form-control-feedback"> This is inline help </small> -->
										</div>
									</div>
									<!--/span-->
									<div class="col-md-6">
										<div class="form-group has-success">
											<label class="control-label">부서</label> <select
												id="dept_code" name="dept_code"
												class="form-control custom-select">
												<option value="0"></option>
												<option value="1">관리</option>
												<option value="2">경영</option>
												<option value="3">마케팅</option>
												<option value="4">인사</option>
												<option value="5">전산</option>
												<option value="6">총무</option>
												<option value="7">회계</option>
											</select> <small class="form-control-feedback"> Select your
												dept </small>
										</div>
									</div>
									<!--/span-->
								</div>
								<!--/row-->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group has-success">
											<label class="control-label">Gender</label> <select
												id="emp_gender" name="emp_gender"
												class="form-control custom-select">
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select> <small class="form-control-feedback"> Select your
												gender </small>
										</div>
									</div>
									<!--/span-->
									<div class="col-md-6">
										<div class="form-group has-success">
											<label class="control-label">직급</label> <select id="job_code"
												name="job_code" class="form-control custom-select">
												<option value="0"></option>
												<option value="1">부장</option>
												<option value="2">차장</option>
												<option value="3">과장</option>
												<option value="4">주임</option>
												<option value="5">대리</option>
												<option value="6">사원</option>
											</select> <small class="form-control-feedback"> Select your
												level </small>
										</div>
									</div>
									<!--/span-->
								</div>
								<!--/row-->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<div class="form-group">
												<label for="example-email">Email <span class="help">
														e.g. "example@gmail.com"</span></label> <input type="email"
													id="emp_email" name="emp_email" class="form-control"
													placeholder="Email">
											</div>
										</div>
									</div>
									<!--/span-->

									<div class="col-sm-6">
										<label>권한 <span class="help"> </span></label>
										<div class="form-group row pt-4">
											<div class="col-sm-6">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority1"
														value="인사"> <label class="custom-control-label"
														for="emp_authority1">인사</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority2"
														value="자료실"> <label class="custom-control-label"
														for="emp_authority2">자료실</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority3"
														value="회사일정"> <label class="custom-control-label"
														for="emp_authority3">회사일정</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority4"
														value="게시판"> <label class="custom-control-label"
														for="emp_authority4">게시판</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority5"
														value="결재서류"> <label class="custom-control-label"
														for="emp_authority5">결재서류</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority6"
														value="권한관리"> <label class="custom-control-label"
														for="emp_authority6">권한관리</label>
												</div>
											</div>
										</div>
									</div>
									<!--/span-->
								</div>
								<!--/row-->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<div class="form-group">
												<label for="example-tel-input" class="col-form-label">Telephone</label>
												<input class="form-control" id="emp_phone" name="emp_phone"
													type="tel" placeholder="010-1234-5678"
													id="example-tel-input">
											</div>
										</div>
									</div>
									<div style="margin-left: 350px; margin-top: 40px;">
										<button class="btn btn-info" type="submit">등록하기</button>
										<button type="button"
											class="btn btn-danger waves-effect text-left"
											data-dismiss="modal">취소하기</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-12">
				<!-- Column -->
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">인사관리</h4>
						<div class="row" style="margin-left: 250px; margin-top: 30px;">
							<select class="form-control custom-select" style="width: 15%">
								<option value="0"></option>
								<option value="1">이름</option>
								<option value="2">직급</option>
								<option value="3">부서</option>
							</select>
							<div class="input-group" style="width: 60%; margin-left: 20px;">
								<input type="text" class="form-control" style="width: 70%">
								<button class="btn btn-info" type="button">검색</button>
							</div>
						</div>
						<div
							style="position: absolute; margin-top: 155px; margin-left: 1200px;">
							<div class="input-group">
								<button class="btn btn-info" type="button">부서수정</button>
								&nbsp&nbsp&nbsp&nbsp
								<button class="btn btn-info" type="button">부서추가</button>
								&nbsp&nbsp&nbsp&nbsp
								<!-- <button class="btn btn-info" type="button">사원추가</button> -->
								<button data-toggle="modal" data-target=".bs-example-modal-lg"
									class="btn btn-info" type="button">사원추가</button>
								</td>
							</div>
						</div>
						<div id="basicgrid" class="jsgrid"
							style="position: relative; height: 500px; width: 100%; margin-top: 200px;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
								<table class="jsgrid-table table table-striped table-hover">
									<tr class="jsgrid-header-row">
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
											style="width: 70px;">이름</th>
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
											style="width: 70px;">직급</th>
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
											style="width: 70px;">부서</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 100px;">연락처</th>
										<!-- <th class="jsgrid-header-cell jsgrid-align-center"
												style="width: 100px;">관리</th> -->
										<th
											class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
											style="width: 50px;">관리 <!-- <button
													class="jsgrid-button jsgrid-mode-button jsgrid-search-mode-button jsgrid-mode-on-button"
													type="button" title=""></button> -->
										</th>
									</tr>
								</table>
							</div>
							<div class="jsgrid-grid-body" style="height: 297.2px;">
								<table class="jsgrid-table table table-striped table-hover">
									<tbody>
										<c:forEach items="${list}" var="e">
											<tr class="jsgrid-row" id="${e.emp_no}">
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 62px;">${e.emp_name}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 63px;">${e.job_title}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 63px;">${e.dept_name}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 89px;">${e.emp_phone}</td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 43px;">
													<button class="jsgrid-button jsgrid-edit-button"
														type="button" title="Edit"></button>
													<button alt="default" data-toggle="modal"
														data-target=".bs-example-modal-lg"
														class="model_img img-fluid" type="button" title="Delete"></button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="jsgrid-pager-container" style="text-align: right;">
								<div class="jsgrid-pager">
								<c:out value="${pageBar}" escapeXml="false"/>
									Pages: <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button">
									<a href="javascript:void(0);">First</a></span>
									 <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button">
									 <a href="javascript:void(0);">Prev</a></span> 
									 <span class="jsgrid-pager-page jsgrid-pager-current-page">1</span>
									 <span class="jsgrid-pager-page"><a href="javascript:void(0);">2</a></span><span
										class="jsgrid-pager-page"><a href="javascript:void(0);">3</a></span><span
										class="jsgrid-pager-page"><a href="javascript:void(0);">4</a></span><span
										class="jsgrid-pager-page"><a href="javascript:void(0);">5</a></span><span
										class="jsgrid-pager-nav-button"><a
										href="javascript:void(0);">...</a></span> <span
										class="jsgrid-pager-nav-button"><a
										href="javascript:void(0);">Next</a></span> <span
										class="jsgrid-pager-nav-button"><a
										href="javascript:void(0);">Last</a></span> &nbsp;&nbsp; 1 of 7
								</div>
							</div>
							<div class="jsgrid-load-shader"
								style="display: none; position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 1000;"></div>
							<div class="jsgrid-load-panel"
								style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;">Please,
								wait...</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../common/footer.jsp" />
	</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<%-- 	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/db.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/resources/js/jsgrid-init.js"></script> --%>
</body>
</html>