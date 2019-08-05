<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.coworks.employee.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ============================================================== -->
<!-- Topbar header - style you can find in pages.scss -->
<!-- ============================================================== -->
<header class="topbar">
	<nav class="navbar top-navbar navbar-expand-md navbar-light">
		<!-- ============================================================== -->
		<!-- Logo -->
		<!-- ============================================================== -->
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/common/gomain.do"> <!-- Logo icon --> <b> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //--> <!-- Dark Logo icon -->
					<img src="${pageContext.request.contextPath}/resources/images/coworks_logo.PNG" alt="homepage" class="dark-logo" style="width: 33px; height: 34px" /> <!-- Light Logo icon --> <img
					src="${pageContext.request.contextPath}/resources/images/coworks_logo.PNG" alt="homepage" class="light-logo" style="width: 33px; height: 34px"
				/>
			</b> <!--End Logo icon --> <!-- Logo text --> <span> <!-- dark Logo text --> <img src="${pageContext.request.contextPath}/resources/images/coworks_logoT.PNG" alt="homepage" class="dark-logo"
					style="width: 148px; height: 25px"
				/> <!-- Light Logo text --> <img src="${pageContext.request.contextPath}/resources/images/coworks_logoT.PNG" class="light-logo" alt="homepage" style="width: 148px; height: 25px" /></span>
			</a>
		</div>
		<!-- ============================================================== -->
		<!-- End Logo -->
		<!-- ============================================================== -->
		<div class="navbar-collapse">
			<!-- ============================================================== -->
			<!-- toggle and nav items -->
			<!-- ============================================================== -->
			<ul class="navbar-nav mr-auto mt-md-0 ">
				<!-- This is  -->
				<li class="nav-item"><a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a></li>
				<li class="nav-item"><a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="icon-arrow-left-circle"></i></a></li>
				<!-- ============================================================== -->
				<!-- Comment -->
				<!-- ============================================================== -->
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-muted text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="mdi mdi-bell"></i>
						<div class="notify" id="approvalHeartbit" style="display: none;">
							<span class="heartbit"></span> <span class="point"></span>
						</div>
				</a>
					<div class="dropdown-menu mailbox animated slideInDown">
						<ul>
							<li>
								<div class="drop-title">결재 대기 문서</div>
							</li>
							<li id="approvalNotify"></li>
							<li><a class="nav-link text-center" href="${pageContext.request.contextPath }/approval/approvalReceive.do"> <strong id="approvalCnt"></strong> <i class="fa fa-angle-right"></i>
							</a></li>
						</ul>
					</div></li>
				<!-- ============================================================== -->
				<!-- End Comment -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Messages -->
				<!-- ============================================================== -->
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-muted text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="mdi mdi-cookie"></i>
						<div class="notify" id="DMHeartbit" style="display: none;">
							<span class="heartbit"></span> <span class="point"></span>
						</div>
				</a>
					<div class="dropdown-menu mailbox animated slideInDown">
						<ul>
							<li>
								<div class="drop-title">쪽지함</div>
							</li>
							<li id="DMNotify"></li>
							<li><a class="nav-link text-center" href="${pageContext.request.contextPath }/dm/dmList.do"> <strong id="DMCnt"></strong> <i class="fa fa-angle-right"></i>
							</a></li>
						</ul>
					</div></li>
				<!-- ============================================================== -->
				<!-- End Messages -->
				<!-- ============================================================== -->

				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" id="2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i
						class="mdi mdi-message-reply-text"
					></i> <!-- <div class="notify">
							<span class="heartbit"></span> <span class="point"></span>
						</div> -->
				</a>
					<div class="dropdown-menu mailbox animated slideInDown" aria-labelledby="2">
						<ul>
							<li>
								<div class="drop-title">메신저</div>
							</li>
							<li id="chatNotify"></li>
							<li><a class="nav-link text-center" href="${pageContext.request.contextPath }/chat/chatview.do"> <strong>메신저 바로가기</strong> <i class="fa fa-angle-right"></i>
							</a></li>
						</ul>
					</div></li>
			</ul>
			<!-- ============================================================== -->
			<!-- User profile and search -->
			<!-- ============================================================== -->
			<ul class="navbar-nav my-lg-0">
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${sessionScope.employee.emp_name}</a>
					<div class="dropdown-menu dropdown-menu-right animated flipInY">
						<ul class="dropdown-user">

							<li><a href="${pageContext.request.contextPath}/mypage/mypage.do"><i class="ti-user"></i> 마이 페이지</a></li>
							<li><a href="${pageContext.request.contextPath}/mypage/attendanceview.do"><i class="mdi mdi-calendar-clock"></i> 근태</a></li>
							<li><a href="${pageContext.request.contextPath}/logout.do"><i class="fa fa-power-off"></i> Logout</a></li>
						</ul>
					</div></li>

			</ul>
		</div>
	</nav>
</header>
<!-- ============================================================== -->
<!-- End Topbar header -->
<!-- ============================================================== -->