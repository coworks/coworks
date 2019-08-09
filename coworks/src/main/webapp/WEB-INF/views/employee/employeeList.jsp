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

<style type="text/css">
td th {
	vertical-align: center;
}
</style>
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />

		<div id="updatedepart" class="modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<form method="post" action="deptupdate.do" name="deptUpdate">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="myModalLabel">부서명 변경하기</h2>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="col-md-12">
							<div class="form-group has-success">
								<label class="control-label">부서명</label> <select id="dept_code"
									name="dept_code" class="form-control custom-select">
									<option value="0"></option>
									<c:forEach items="${departmentList}" var="de">
										<option value="${de.dept_code}">${de.dept_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="modal-body">
							<div class="col-md-13">
								<div class="form-group">
									<label class="control-label">변경할 부서명 </label> <input
										type="text" id="dept_name" name="dept_name"
										class="form-control" placeholder="부서명을 입력하세요">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-outline-info waves-effect" >등록하기</button>
							<button type="button" class="btn btn-outline-danger waves-effect"
								data-dismiss="modal">취소하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>


		<div id="myModal" class="modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<form method="post" action="deptInsert.do" name="deptInsert">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="myModalLabel">부서 추가</h2>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>

						<div class="modal-body">
							<div class="col-md-12">
								<div class="form-group">
									<label class="control-label">부서명 </label> <input type="text"
										id="dept_name" name="dept_name" class="form-control"
										placeholder="부서명을 입력하세요">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-outline-info waves-effect">등록하기</button>
							<button type="button" class="btn btn-outline-danger waves-effect"
								data-dismiss="modal">취소하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
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
											<label class="control-label">생년월일 </label> <input type="date"
												id="emp_birth" name="emp_birth" class="form-control"
												placeholder="1992-08-31">
											<!-- <small class="form-control-feedback"> This is inline help </small> -->
										</div>
									</div>
									<!--/span-->
									<div class="col-md-6">
										<div class="form-group has-success">
											<label class="control-label">부서</label> <select
												id="dept_code" name="dept_code"
												class="form-control custom-select">
												<c:forEach items="${departmentList}" var="de">
													<option value="${de.dept_code}">${de.dept_name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<!--/span-->
								</div>
								<!--/row-->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group has-success">
											<label class="control-label">성별</label> <select
												id="emp_gender" name="emp_gender"
												class="form-control custom-select">
												<option value="M">Male</option>
												<option value="F">Female</option>
											</select>
										</div>
									</div>
									<!--/span-->
									<div class="col-md-6">
										<div class="form-group has-success">
											<label class="control-label">직급</label> <select id="job_code"
												name="job_code" class="form-control custom-select">
												<c:forEach items="${jobList}" var="j">
													<option value="${j.job_code}">${j.job_title}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<!--/span-->
								</div>
								<!--/row-->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<div class="form-group">
												<label for="example-email">이메일 <span class="help">
														</span></label> <input type="email"
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
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority4"
														value="급여"> <label class="custom-control-label"
														for="emp_authority4">급여</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority5"
														value="게시판"> <label class="custom-control-label"
														for="emp_authority5">게시판</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority6"
														value="결재서류"> <label class="custom-control-label"
														for="emp_authority6">결재서류</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="emp_authority"
														class="custom-control-input" id="emp_authority7"
														value="권한관리"> <label class="custom-control-label"
														for="emp_authority7">권한관리</label>
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
												<label for="example-tel-input" class="col-form-label">연락처</label>
												<input class="form-control" id="emp_phone" name="emp_phone"
													type="tel" placeholder="010-1234-5678"
													id="example-tel-input">
											</div>
										</div>
									</div>
									<div style="margin-left: 350px; margin-top: 40px;">
										<button class="btn btn-outline-info" type="submit" onclick="return check();">등록하기</button>
										<button type="button"
											class="btn btn-outline-danger waves-effect text-left"
											data-dismiss="modal">취소하기</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	<div class="page-wrapper">
		<div class="container-fluid">
						<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<h3 class="text-themecolor mb-0 mt-0">COWORKS</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span class="text-info"> 인사관리</span></li>
						</ol>
					</div>
				</div>
		
			<div class="col-12">
				<!-- Column -->
				<div class="card">
					<div class="card-body">
						<div class="row" style="margin-left: 250px; margin-top: 30px;">
							<select class="form-control custom-select" style="width: 15%"
								id="searchCondition" name="searchCondition">
								<option value="">----</option>
								<option value="empname">이름</option>
								<option value="jobtitle">직급</option>
								<option value="deptname">부서</option>
							</select>
							<div class="input-group" style="width: 60%; margin-left: 20px;">
								<input type="search" id="keyword" class="form-control"
									style="width: 70%">
								<button class="btn btn-info" type="button" onclick="return search();">검색</button>
							</div>
						</div>



						<div style="float: right;" class="mt-5 pt-5">
							<div class="input-group">
								<button data-toggle="modal" data-target="#updatedepart"
									class="btn btn-outline-info" type="button">부서수정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button data-toggle="modal" data-target="#myModal"
									class="btn btn-outline-info" type="button">부서추가</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- <button class="btn btn-info" type="button">사원추가</button> -->
								<button data-toggle="modal" data-target=".bs-example-modal-lg"
									class="btn btn-outline-info" type="button">사원추가</button>
							</div>
						</div>
						<div id="basicgrid" class="jsgrid pt-3"
							style="position: relative; height: 500px; width: 100%;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
								<table class="jsgrid-table ">
									<tr class="jsgrid-header-row">
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable bg-info text-white"
											style="width: 20%;">사원코드</th>
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable bg-info text-white"
											style="width: 20%;">이름</th>
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable bg-info text-white"
											style="width: 20%;">직급</th>
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable bg-info text-white"
											style="width: 20%;">부서</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable bg-info text-white"
											style="width: 24%;">연락처</th>
										<!-- <th class="jsgrid-header-cell jsgrid-align-center"
												style="width: 100px;">관리</th> -->
										<th
											class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center bg-info text-white"
											style="width: 14%;">인사관리 <!-- <button
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
													style="width: 20%;">${e.emp_no}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 20%;">${e.emp_name}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 20%;">${e.job_title}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 20%;">${e.dept_name}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 24%;">${e.emp_phone}</td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 14%;">
													<button class="jsgrid-button jsgrid-edit-button"
														type="button" onclick="employeemove('${e.emp_no}');"></button>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="jsgrid-pager-container" style="text-align: right;">
								<div class="jsgrid-pager">
									<c:out value="${pageBar}" escapeXml="false" />
									
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
		</div>
		<c:import url="../common/footer.jsp" />
	</div>
	
	<c:import url="../common/bottomJquery.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js" aria-hidden="true"></script>
	<script>
		/* function search(){
			location.href="${pageContext.request.contextPath}/employee/employeeSearch.do?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		} */
		
		function check(){
			
			var emp_name = $("#emp_name").val();
			var emp_birth = $("#emp_birth").val();
			var emp_gender = $("#emp_gender option:selected").val();
			var emp_email = $("#emp_email").val();
			var emp_phone = $("#emp_phone").val();
			var emp_au = $("input[name='emp_authority']:checked").length; 
			
			if(emp_name == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  이름을 입력해주세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}else if(emp_birth == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  생년월일을 입력해주세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}else if(emp_gender == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  성별을 선택하세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}else if(emp_email == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  이메일을 입력해주세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}else if(emp_phone == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  연락처를 입력해주세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}else if(emp_au == 0){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  권한을 선택해주세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}
			return true;
		}
		
		function employeemove(index){
			location.href="${pageContext.request.contextPath}/employee/employeeMove.do?index="+index;
		}
		
		function search(){
			var searchKey = $("#keyword").val();
			var searchCdt = $("#searchCondition").val();
			
			if(searchCdt == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  검색 분류를 선택하세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else if(searchKey == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ 검색어를 입력하세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			} else {
				location.href="${pageContext.request.contextPath}/employee/employeeSearch.do?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();	
			}
			
		}
	</script>
	<%-- 	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/db.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/resources/js/jsgrid-init.js"></script> --%>
</body>
</html>