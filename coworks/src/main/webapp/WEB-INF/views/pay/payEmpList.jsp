<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>co-works : 사원 급여 관리 </title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
	
<link href="${pageContext.request.contextPath }/resources/templates/resources/css/hummingbird-treeview.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script> 
    <!-- Color Picker Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColor/dist/jquery-asColor.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <!-- Date range Plugin JavaScript -->
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-12">
				<!-- Column -->
				<div class="card">
					<div class="card-body">
						<h2 class="card-title">급여관리</h2>
						<div class="row mb-3 col-5" style="margin-left: 30%; margin-top:6%; ">
							<select class="form-control custom-select" style="width: 20%"
							id="searchCondition" name="searchCondition">
								<option value="">----</option>
								<option value="empname">이름</option>
								<option value="jobtitle">직급</option>
								<option value="deptname">부서</option>
							</select>
							<div class="input-group " style="width: 80%; margin-bottom:8%;  ">
								<input type="search" id="keyword" class="form-control" >
								<button class="btn btn-info" type="button"   onclick="search();">검색</button>
							</div>
						</div>
						<input type="button" class="btn  btn-outline-info" id="payFileDown" name="payFileDown" value="EXCEL 파일 다운받기"
						data-target="#responsive-modal" data-toggle="modal"><!--  location.href='${pageContext.request.contextPath}/pay/writePayExcel-->
						<input type="button" class="btn  btn-outline-info" id="payFile" name="payFile" value="EXCEL 입력하기"
						onclick="location.href='${pageContext.request.contextPath}/pay/payInputForm.do'	">
						<input type="button" class="btn  btn-outline-info" id="payDirect" name="payDirect" value="급여명세서 입력하기"
						onclick="location.href='${pageContext.request.contextPath}/pay/payDirect.do'	">
						<div style="height : 20px;"> </div>

						</a>
						<div id="basicgrid" class="jsgrid"
							style="position: relative; height: 500px; width: 100%; margin-top: 5px;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
								<table class="jsgrid-table table table-striped table-hover">
									<tr class="jsgrid-header-row">
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
											style="width: 70px;">사번</th>
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
											style="width: 70px;">이름</th>
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
											style="width: 70px;">직책</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 100px;">부서</th>
										<!-- <th class="jsgrid-header-cell jsgrid-align-center"
												style="width: 100px;">관리</th> -->
										<th
											class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
											style="width: 50px;">상세보기 
											<!-- <button class="jsgrid-button jsgrid-mode-button jsgrid-search-mode-button jsgrid-mode-on-button"
											type="button" title=""></button> -->
										</th>
									</tr>
								</table>
							</div>
							<div class="jsgrid-grid-header jsgrid-header-scrollbar" >
								<table class="jsgrid-table table table-striped table-hover">
									<tbody>
										<c:forEach items="${list}" var="e">
											<tr class="jsgrid-row" id="${e.emp_no}" value="${e.emp_no}" name="emp_no">
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 62px;">${e.emp_no}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 63px;">${e.emp_name}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 63px;">${e.job_title}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 89px;">${e.dept_name}</td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 43px;">
													<!-- <button class="jsgrid-button jsgrid-edit-button"
														type="button" title="Edit"></button> -->
												<button alt="default"
												onclick="location.href='${pageContext.request.contextPath}/pay/empListPay.do/${e.emp_no}'"
														id="empListPay"
														class="mdi mdi-note-outline btn waves-effect waves-light btn-block btn-outline-info" type="button">
													<!-- <i class="mdi mdi-note-outline"></i>	 -->
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
		<c:import url="payModal.jsp"/>
		<c:import url="../common/footer.jsp" />
	</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script src="${pageContext.request.contextPath }/resources/templates/resources/js/hummingbird-treeview.js"></script>
	<script>
	$("#treeview").hummingbird();

	function search(){
		location.href="${pageContext.request.contextPath}/pay/employeeSearch.do?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
	} 
		
	
	$(document).on("click", "#modalSubmit",function(){
		/* return; */
		
		if($("#paydate").val()== ""){
			alert("날짜 입력");
			return;
		
		}
		/* 
		if($("#empList").attr('value') == false){
			alert("사원 입력");
			return;
		}  */
		
		console.log($("#paydate").val());
		
		$("#payForm").submit();
		
	});
	</script>
	<%-- 	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/db.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/resources/js/jsgrid-init.js"></script> --%>
</body>
</html>