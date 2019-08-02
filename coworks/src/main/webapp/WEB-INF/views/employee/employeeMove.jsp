<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.coworks.employee.model.vo.*, com.kh.coworks.authority.model.vo.*" %>
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
	</div>

	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-12">
				<!-- Column -->
				<div class="card">
					<div class="card-body">
						<h2 class="card-title">인사이동관리</h2>
						<div class="form-body">
							<form method="post" action="employeeMoveUpdate.do"
								name="employeeEnroll">
									<input type="hidden" name="emp_no" id="emp_no" value="${employee.emp_no}" >
								<div class="card-body">
									<div class="row pt-3">
										<div class="col-md-3">
											<div class="form-group">
												<label class="control-label">이름</label> <input type="text"
													id="emp_name" name="emp_name" class="form-control"
													value="${employee.emp_name}">
												<!-- <small class="form-control-feedback"> This is inline help </small> -->
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="control-label">생년월일 </label> <input
													type="date" id="emp_birth" name="emp_birth"
													class="form-control" value="${employee.emp_birth}">
												<!-- <small class="form-control-feedback"> This is inline help </small> -->
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group has-success">
												<label class="control-label">부서</label> <select
													id="dept_code" name="dept_code"
													class="form-control custom-select">
													<option value="${employee.dept_code}">${employee.dept_name}</option>
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
												<label class="control-label">Gender</label> <select
													id="emp_gender" name="emp_gender"
													class="form-control custom-select">
													<option value="M"
														${employee.emp_gender=='M'?'selected':'' }>Male</option>
													<option value="F"
														${employee.emp_gender=='F'?'selected':'' }>Female</option>
												</select>
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="form-group has-success">
												<label class="control-label">직급</label> <select
													id="job_code" name="job_code"
													class="form-control custom-select">
													<option value="${employee.job_code}">${employee.job_title}</option>
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
													<label for="example-email">Email <span class="help">
															e.g. "example@gmail.com"</span></label> <input type="email"
														id="emp_email" name="emp_email" class="form-control"
														value="${employee.emp_email }" placeholder="Email">
												</div>
											</div>
										</div>
										<!--/span-->

										<div class="col-sm-6">
											<label>권한 <span class="help"> </span></label>
											<div class="form-group row pt-4">
												<div class="col-sm-6">
												<% 
													/* List.contains메소드를 사용하기 위해 String[] => List로 형변환함.  */
													List<String> auList = null;
													Authority authority = ((Authority)request.getAttribute("au"));
													if(authority != null)//이 조건이 없다면,취미체크박스에 하나도 체크하지 않았다면, Array.asList(null)=>NullPointerException 
														//auList = Arrays.asList(authority); 
												%>
													<div class="custom-control custom-checkbox">
														<input type="checkbox" name="emp_authority"
															class="custom-control-input" id="emp_authority1"
															value="인사" <%=authority != null && authority.getAuth_personnal().equals("Y")?"checked":""%>> <label class="custom-control-label"
															for="emp_authority1" >인사</label>
													</div>
												 	<div class="custom-control custom-checkbox">
														<input type="checkbox" name="emp_authority"
															class="custom-control-input" id="emp_authority2"
															value="자료실" <%=authority != null && authority.getAuth_data().equals("Y")?"checked":""%>> <label class="custom-control-label"
															for="emp_authority2" >자료실</label>
													</div>
													<div class="custom-control custom-checkbox">
														<input type="checkbox" name="emp_authority"
															class="custom-control-input" id="emp_authority3"
															value="회사일정" <%=authority != null && authority.getAuth_cal().equals("Y")?"checked":""%>> <label class="custom-control-label"
															for="emp_authority3" >회사일정</label>
													</div>
													<div class="custom-control custom-checkbox">
														<input type="checkbox" name="emp_authority"
															class="custom-control-input" id="emp_authority4"
															value="급여" <%=authority != null && authority.getAuth_pay().equals("Y")?"checked":""%>> <label class="custom-control-label"
															for="emp_authority4" >급여</label>
													</div> 
												</div>
												 <div class="col-sm-6">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" name="emp_authority"
															class="custom-control-input" id="emp_authority5"
															value="게시판" <%=authority != null && authority.getAuth_board().equals("Y")?"checked":""%>> <label class="custom-control-label"
															for="emp_authority5" >게시판</label>
													</div>
													<div class="custom-control custom-checkbox">
														<input type="checkbox" name="emp_authority"
															class="custom-control-input" id="emp_authority6"
															value="결재서류" <%=authority != null && authority.getAuth_approval().equals("Y")?"checked":""%>> <label class="custom-control-label"
															for="emp_authority6" >결재서류</label>
													</div>
													<div class="custom-control custom-checkbox">
														<input type="checkbox" name="emp_authority"
															class="custom-control-input" id="emp_authority7"
															value="권한관리" <%=authority != null && authority.getAuth_authority().equals("Y")?"checked":""%>> <label class="custom-control-label"
															for="emp_authority7" >권한관리</label>
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
														type="tel" id="example-tel-input"
														value="${employee.emp_phone }">
												</div>
											</div>
										</div>
										<div style="margin-left: 580px; margin-top: 40px;">
											<button class="btn btn-info" type="submit">변경하기</button>
											<button type="button"
												class="btn btn-danger waves-effect text-left"
												onclick="cancel();">취소하기</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="../common/bottomJquery.jsp" />
	<script>
		function cancel() {
			location.href = "${pageContext.request.contextPath}/employee/employeeList.do";
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