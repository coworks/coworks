<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>co-works : 개인 사원 급여 관리</title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
	
<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script> 
    <!-- Color Picker Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColor/dist/jquery-asColor.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <!-- Date range Plugin JavaScript -->
    <style>
   	.pagination{
   margin-left:38%;
   	}
     #subtitle{
     	padding-bottom:5%;
     }
    </style>
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
						<h2 class="card-title" id="subtitle">급여 명세서 목록</h2>
						<div id="basicgrid" class="jsgrid"
							style="position: relative; height: 500px; width: 100%; tmargin-top: 200px;">
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
											style="width: 70px;">직급</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 100px;">지급일</th>
										<th
											class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
											style="width: 50px;">상세보기 
											<!-- <button class="jsgrid-button jsgrid-mode-button jsgrid-search-mode-button jsgrid-mode-on-button"
											type="button" title=""></button> -->
										</th>
									</tr>
								
									<tbody>
										<c:forEach items="${list}" var="p">
											<tr class="jsgrid-row"  name="emp_no" id="${p.pay_no}">
											
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 70px;">${p.emp_no}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 70px;">${p.pay_emp_name}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 70px;">${p.pay_emp_job}</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">${p.pay_date}</td>
												<td class="jsgrid-cell jsgrid-align-center"> 
													<!-- <button class="jsgrid-button jsgrid-edit-button"
														type="button" title="Edit"></button> -->
												<button 
													id="detailPay"
													onclick="detailPay(${p.pay_no});"
													class="mdi mdi-note-outline btn waves-effect waves-light btn-block btn-outline-info" type="button">
													<!-- <i class="mdi mdi-note-outline"></i>	 -->
												</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div id="page">
							<c:out value="${pageBar}" escapeXml="false" />
							</div>
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
	function detailPay(pay_no){
		console.log("asdasd");
		window.open("${pageContext.request.contextPath}/pay/detailPay.do/"+pay_no,"급여 명세서",
				"width=700px,height=600px,left=100px,top=100px, location=no");
			
	}
	\
</body>
</html>