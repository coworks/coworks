<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ============================================================== -->
<!-- Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->
<aside class="left-sidebar">
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar">
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav">
				<li><a href="${pageContext.request.contextPath}" aria-expanded="false"><i class="mdi mdi-home"></i><span class="hide-menu">메인</span></a></li>
				<li><a href="#" aria-expanded="false"><i class="mdi mdi-phone"></i><span class="hide-menu">연락처</span></a>
				<li><a href="${pageContext.request.contextPath}/mail/app-email.do" aria-expanded="false"><i class="mdi mdi-email"></i><span class="hide-menu">메일</span></a></li>
				<li><a href="${pageContext.request.contextPath}/calendar/calendarview.do" aria-expanded="false"><i class="mdi mdi-calendar-multiple"></i><span class="hide-menu">일정</span></a></li>
				<li><a href="#" aria-expanded="false"><i class="mdi mdi-message-text-outline"></i><span class="hide-menu">메신저</span></a></li>
				<li><a class="has-arrow " href="#" aria-expanded="false"><i class="mdi mdi-pen"></i><span class="hide-menu">결재</span></a>
					<ul aria-expanded="false" class="collapse">
						<li><a href="${pageContext.request.contextPath}/approval/approvalWrite.do">작성하기</a></li>
						<li><a href="${pageContext.request.contextPath}/error.do">미결함</a></li>
						<li><a href="#">진행함</a></li>
						<li><a href="#">완료함</a></li>
					</ul></li>
				<li><a class="has-arrow " href="#" aria-expanded="false"><i
						class="mdi mdi-package-variant-closed"></i><span class="hide-menu">자료실</span></a>
					<ul aria-expanded="false" class="collapse">
						<li><a href="${pageContext.request.contextPath}/board/companyrulesdata.do">사규</a></li>
						<li><a href="#" class="has-arrow">통합자료실</a>
							<ul aria-expanded="false" class="collapse">
								<li><a href="${pageContext.request.contextPath}/board/businessdocdata.do">업무문서</a></li>
								<li><a href="${pageContext.request.contextPath}/board/empedudocdata.do">교육문서</a></li>
							</ul>
						<li><a href="${pageContext.request.contextPath}/board/deptdocdata.do">부서별 자료실</a></li>
					</ul></li>
				<li><a class="has-arrow " href="#" aria-expanded="false"><i class="mdi mdi-bulletin-board"></i><span class="hide-menu">게시판</span></a>
					<ul aria-expanded="false" class="collapse">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">조직개편 및 인사발령</a></li>
						<li><a href="#">경조사</a></li>
						<li><a href="#">NEWS</a></li>
						<li><a href="#">자유게시판</a></li>
						<li><a href="#">부서별 게시판</a></li>
					</ul></li>
				<li><a class="has-arrow " href="#" aria-expanded="false"><i
						class="mdi mdi-book-open-variant"></i><span class="hide-menu">교육</span></a>
					<ul aria-expanded="false" class="collapse">
						<li><a href="#">일정 & 신청</a></li>
						<li><a href="#">보고서 작성하기</a></li>

					</ul></li>
				<li><a href="#" aria-expanded="false"><i
						class="mdi mdi-file-chart"></i><span class="hide-menu">설문조사</span></a>
				</li>
				<li><a href="${pageContext.request.contextPath}/authority/authorityList.do" aria-expanded="false"><i class="mdi mdi-account-settings-variant"></i>
				<span class="hide-menu">인사 관리</span></a></li>
				<li><a href="#" aria-expanded="false"><i class="mdi mdi-account-key"></i>
				<span class="hide-menu">권한관리</span></a></li>
				 
			</ul>
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->

</aside>
<!-- ============================================================== -->
<!-- End Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->