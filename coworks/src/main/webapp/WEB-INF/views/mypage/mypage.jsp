<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 마이페이지</title>
<c:import url="../common/header.jsp" />
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="card">
					<div class="card-body">
							<div class="form-body mb-5">
								<h3 class="box-title">회원정보</h3>
								<hr class="mt-0 mb-5">
								<div class="row">
									<div class="col-lg-6  col-12">
										<div class="form-group row">
											<label class="control-label text-right col-3">이름 : </label>
											<div class=" col-9">
												<p class="form-control-static">${ sessionScope.employee.emp_name }</p>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6  col-12">
										<div class="form-group row">
											<label class="control-label text-right  col-3">부서 : </label>
											<div class="col-9">
												<p class="form-control-static">${ sessionScope.employee.dept_name }</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-12">
										<div class="form-group row">
											<label class="control-label text-right  col-3">직급 : </label>
											<div class=" col-9">
												<p class="form-control-static">${ sessionScope.employee.job_title }</p>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-12">
										<div class="form-group row">
											<label class="control-label text-right col-3">연락처 : </label>
											<div class="col-9">
												<p class="form-control-static">${ sessionScope.employee.emp_phone }</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-12">
										<div class="form-group row">
											<label class="control-label text-right col-3">이메일 : </label>
											<div class=" col-9">
												<p class="form-control-static">${ sessionScope.employee.emp_email }</p>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-12">
										<div class="form-group row">
											<label class="control-label text-right col-3">주소 : </label>
											<div class=" col-9">
												<p class="form-control-static">서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F 길이 테스트ㅡ으응으ㅡ으으으으으ㅡ으으으으으ㅡ으으으으으으으으ㅡ으으으으으으ㅡ</p>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6  col-12">
										<div class=" row">
											<label class="control-label text-right col-3">개인서명 : </label>
											<div class="col-9">
												<img src="${pageContext.request.contextPath}/resources/images/empSign/${ sessionScope.employee.emp_signature }" alt="개인서명" height="50px" width="50px" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-actions">
								<div class="row">
									<div class="col-md-6"></div>
									<div class="col-md-6">
										<div class="row">
											<div class="col-md-offset-3 col-md-9 " align="right">
												<a class="btn btn-info " href="editMypage.do">
													<i class="fa fa-pencil"></i>수정하기
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp" />

	<c:import url="../common/bottomJquery.jsp" />
</body>
</html>