<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>co-works : 급여관리</title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
	
<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
    <!-- Color Picker Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColor/dist/jquery-asColor.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/daterangepicker/daterangepicker.js"></script>
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
					<h2 class="modal-title" id="myLargeModalLabel">사원 개인 급여 명세서 </h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
				</div>
				<div class="form-body col-10">
					<table class="jsgrid-table table table-striped table-hover">
						<tr class="jsgrid-header-row">
							<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
								style="width: 70px;">이름</th>
							<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
								style="width: 70px;">직급</th>
							<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
								style="width: 70px;">부서</th>
							<th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
								style="width: 100px;">지급일 </th>
							<th class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
								style="width: 50px;">관리 </th>
						</tr>
					</table>
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
						<h2 class="card-title">인사관리</h2>
						<div class="row mb-3 col-5" style="margin-left: 30%; margin-top: 30px;">
							<select class="form-control custom-select" style="width: 20%"
							id="searchCondition" name="searchCondition">
								<option value="">----</option>
								<option value="empname">이름</option>
								<option value="jobtitle">직급</option>
								<option value="deptname">부서</option>
							</select>
							<div class="input-group " style="width: 80%">
								<input type="search" id="keyword" class="form-control" >
								<button class="btn btn-info" type="button"   onclick="search();">검색</button>
							</div>
						</div>
						<div class='input-group mb-3 col-5' style="margin-left: 30%; margin-top: 30px;">
                            <input type='text' class="form-control shawCalRanges" />
                            <div class="input-group-append">
                                <span class="input-group-text">
                                	<span class="ti-calendar"></span>
                            	</span>
                        	</div>
                        </div>
						<input type="button" class="btn  btn-outline-info" id="payFile" name="payFile" value="급여명세서 입력하기"
						onclick="location.href='${pageContext.request.contextPath}/pay/payInputForm.do'	">
						<div style="height : 20px;"> </div>

						<div id="basicgrid" class="jsgrid"
							style="position: relative; height: 500px; width: 100%; tmargin-top: 200px;">
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
											style="width: 50px;">파일 
											<!-- <button class="jsgrid-button jsgrid-mode-button jsgrid-search-mode-button jsgrid-mode-on-button"
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
													<!-- <button class="jsgrid-button jsgrid-edit-button"
														type="button" title="Edit"></button> -->
													<button alt="default" data-toggle="modal"
														data-target=".bs-example-modal-lg"
														class="btn waves-effect waves-light btn-block btn-outline-info" type="button" title="Delete">
													<i class="mdi mdi-note-outline"></i>	
													</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<c:out value="${pageBar}" escapeXml="false" />
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
	  $("#payFile").on("click",function(){
		  
	  });

	/* 	function search(){
			location.href="${pageContext.request.contextPath}/employee/employeeSearch.do?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		} */
		
	</script>
	<%-- 	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/db.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/resources/js/jsgrid-init.js"></script> --%>
</body>
</html>