<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>co-works : 권한관리</title>
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
				<form method="post" action="authorityUpdate.do" name="deptUpdate">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="myModalLabel">권한 변경하기</h2>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="col-md-12">
							<div class="form-group has-success">
								<label class="control-label">이름</label> 
								<input type="hidden" id="emp_no" name="emp_no" />
								<input type="text" id="emp_name" name="emp_name" class="form-control" value="" readonly >
							</div>
						</div>

								<div class="col-md-12">
										<label>권한 <span class="help"> </span></label>
										<div class="form-group row pt-4">
											<div class="col-md-6">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="auth_personnal"
														class="custom-control-input" id="emp_authority1"
														value="인사"> <label class="custom-control-label"
														for="emp_authority1">인사</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="auth_data"
														class="custom-control-input" id="emp_authority2"
														value="자료실"> <label class="custom-control-label"
														for="emp_authority2">자료실</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="auth_cal"
														class="custom-control-input" id="emp_authority3"
														value="회사일정"> <label class="custom-control-label"
														for="emp_authority3">회사일정</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="auth_pay"
														class="custom-control-input" id="emp_authority4"
														value="급여"> <label class="custom-control-label"
														for="emp_authority4">급여</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="auth_board"
														class="custom-control-input" id="emp_authority5"
														value="게시판"> <label class="custom-control-label"
														for="emp_authority5">게시판</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="auth_approval"
														class="custom-control-input" id="emp_authority6"
														value="결재서류"> <label class="custom-control-label"
														for="emp_authority6">결재서류</label>
												</div>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" name="auth_authority"
														class="custom-control-input" id="emp_authority7"
														value="권한관리"> <label class="custom-control-label"
														for="emp_authority7">권한관리</label>
												</div>
											</div>
										</div>
									</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-info waves-effect">변경하기</button>
							<button type="button" class="btn btn-danger waves-effect"
								data-dismiss="modal">취소하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="page-wrapper">
			<div class="container-fluid">
							<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span class="text-info"> 권한관리</span></li>
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
									<button class="btn btn-info" type="button" onclick="return search();">검색하기</button>
								</div>
							</div>

							<div id="basicgrid" class="jsgrid pt-5"
								style="position: relative; height: 500px; width: 100%;">
								<div class="jsgrid-grid-header jsgrid-header-scrollbar">
									<table class="jsgrid-table ">
										<tr class="jsgrid-header-row">
											<th
												class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable  bg-info text-white"
												style="width: 8%;">이름</th>
											<th
												class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable  bg-info text-white"
												style="width: 8%;">직급</th>
											<th
												class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable bg-info text-white"
												style="width: 8%;">부서</th>
											<th
												class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable bg-info text-white"
												style="width: 10%;">인사</th>
											<th
												class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable bg-info text-white"
												style="width: 10%;">자료실</th>
											<th
												class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable bg-info text-white"
												style="width: 10%;">회사일정</th>
											<th
												class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable bg-info text-white"
												style="width: 10%;">게시판</th>
											<th
												class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable bg-info text-white"
												style="width: 10%;">결재서류</th>
											<th
												class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable bg-info text-white"
												style="width: 10%;">권한관리</th>
											<th
												class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable bg-info text-white"
												style="width: 10%;">급여</th>
											<!-- <th class="jsgrid-header-cell jsgrid-align-center"
												style="width: 100px;">관리</th> -->
											<th
												class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center bg-info text-white"
												style="width: 5%;">수정 <!-- <button
													class="jsgrid-button jsgrid-mode-button jsgrid-search-mode-button jsgrid-mode-on-button"
													type="button" title=""></button> -->
											</th>
										</tr>
									</table>
								</div>
								<div class="jsgrid-grid-body" style="height: 297.2px;">
									<table class="jsgrid-table table table-striped table-hover">
										<tbody>
											<c:forEach items="${list}" var="au">
												<tr class="jsgrid-row" id="${au.emp_no}">
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 8%;">${au.emp_name}</td>
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 8%;">${au.job_title}</td>
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 8%;">${au.dept_name}</td>
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 10%;" >${au.auth_personnal=='Y'?'○':'' }</td>
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 10%;">${au.auth_data=='Y'?'○':'' }</td>
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 10%;">${au.auth_cal=='Y'?'○':''}</td>
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 10%;">${au.auth_board=='Y'?'○':''}</td>
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 10%;">${au.auth_approval=='Y'?'○':''}</td>
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 10%;">${au.auth_authority=='Y'?'○':'' }</td>
													<td class="jsgrid-cell jsgrid-align-center"
														style="width: 10%;">${au.auth_pay=='Y'?'○':''}</td>
													<td
														class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
														style="width: 5%;">
														<button class="jsgrid-button jsgrid-edit-button" data-toggle="modal" 
														data-target="#updatedepart"	type="button" onclick="return transferName('${au.emp_no}','${au.emp_name}');" ></button>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="jsgrid-pager-container" style="text-align: right;">
									<div class="jsgrid-pager">
										<c:out value="${pageBar}" escapeXml="false" />
										Pages: <span
											class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button">
											<a href="javascript:void(0);">First</a>
										</span> <span
											class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button">
											<a href="javascript:void(0);">Prev</a>
										</span> <span class="jsgrid-pager-page jsgrid-pager-current-page">1</span>
										<span class="jsgrid-pager-page"><a
											href="javascript:void(0);">2</a></span><span
											class="jsgrid-pager-page"><a
											href="javascript:void(0);">3</a></span><span
											class="jsgrid-pager-page"><a
											href="javascript:void(0);">4</a></span><span
											class="jsgrid-pager-page"><a
											href="javascript:void(0);">5</a></span><span
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
		<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js" aria-hidden="true"></script>
	<script>
		/* function search() {
			location.href = "${pageContext.request.contextPath}/authority/authoritySearch.do?con="
					+ $('#searchCondition').val()
					+ "&keyword="
					+ $('#keyword').val();
		} */
		
		
		
		
		
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
				location.href = "${pageContext.request.contextPath}/authority/authoritySearch.do?con="
					+ $('#searchCondition').val()
					+ "&keyword="
					+ $('#keyword').val();	
			}
			
		}

		function transferName(emp_no,emp_name) {
			
		/* 	var emp_au = $("input[name='emp_authority']:checked").length;
			
			if (emp_au == 0) {
				Swal.fire({
					title : "ʕ•ᴥ•ʔ  권한을 선택해주세요!",
					timer : 1300,
					showConfirmButton : false
				});
				return false;
			} */
			
			$('#emp_no').val(emp_no);
			$('#emp_name').val(emp_name);
			
			return true;
			
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