<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>CO-WORKS : Login</title>
<c:import url="./common/header.jsp" />
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<section id="wrapper">
		<div class="login-register" style="background-image: url(${pageContext.request.contextPath}/resources/images/login_background.jpg);">
			<div class="login-box card">
				<div class="card-body">
					<form class="form-horizontal form-material" id="loginform" action="${pageContext.request.contextPath}/common/goLogin.do" method="post">
						<h3 class="box-title mb-3">Login</h3>
						<div class="form-group ">
							<div class="col-xs-12">
								<input class="form-control" name="emp_no" type="text" required="" placeholder="사원번호">
							</div>
						</div> 
						<div class="form-group">
							<div class="col-xs-12">
								<input class="form-control" name="emp_password" type="password" required="" placeholder="비밀번호">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<div class="checkbox checkbox-primary float-left pt-0">
								<!-- 	<input id="checkbox-signup" type="checkbox"> <label for="checkbox-signup"> Remember ID </label> -->
								</div>
								<a href="javascript:void(0)" id="to-recover" class="text-dark float-right"><i class="fa fa-lock mr-1"></i> 비밀번호 찾기</a>
							</div>
						</div>
						<div class="form-group text-center mt-3">
							<div class="col-xs-12">
								<button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Login</button>
							</div>
						</div>
					</form>
					<form class="form-horizontal" id="recoverform" action="index.html">
						<div class="form-group ">
							<div class="col-xs-12">
								<h3>비밀번호 찾기</h3>
								<p class="text-muted">회원 정보에 입력된 이메일을 입력하세요!</p>
							</div>
						</div>
						<div class="form-group ">
							<div class="col-xs-12">
								<input class="form-control" type="text" required="" placeholder="Email">
							</div>
						</div>
						<div class="form-group text-center mt-3">
							<div class="col-xs-12">
								<button class="btn btn-warning btn-block text-uppercase waves-effect waves-light" type="submit">확인</button>
								<button type="button" class="btn btn-block btn-outline-secondary waves-effect waves-light text-uppercase" id="back-login">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</section>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<c:import url="./common/bottomJquery.jsp" />
</body>

</html>