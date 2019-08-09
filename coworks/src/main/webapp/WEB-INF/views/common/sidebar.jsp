<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- ============================================================== -->
<!-- Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->
<aside class="left-sidebar">
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar">
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav">
				<li><a
					href="${pageContext.request.contextPath}/common/gomain.do"
					aria-expanded="false"><i class="mdi mdi-home"></i><span
						class="hide-menu">메인</span></a></li>
				<li><a href="${pageContext.request.contextPath}/employee/contactList.do"
					aria-expanded="false"><i class="mdi mdi-phone"></i><span class="hide-menu">연락처</span></a>
				<li><a
					href="${pageContext.request.contextPath}/mail/authCheck.do"
					aria-expanded="false"><i class="mdi mdi-email"></i><span
						class="hide-menu">메일</span></a></li>
				
					<li><a
					href="${pageContext.request.contextPath}/dm/dmList.do"	
					aria-expanded="false"><i class="mdi mdi-comment-alert"></i><span
						class="hide-menu">쪽지</span></a></li>
				<li><a
					href="${pageContext.request.contextPath}/calendar/calendarview.do"
					aria-expanded="false"><i class="mdi mdi-calendar-multiple"></i><span
						class="hide-menu">일정</span></a></li>
				
				<li><a
					href="${pageContext.request.contextPath}/todo/todolist.do"
					aria-expanded=false"><i
						class="mdi mdi-checkbox-multiple-marked"></i><span
						class="hide-menu">TODO</span></a></li>
				<li><a href="${pageContext.request.contextPath}/chat/croom/0" aria-expanded="false"><i
						class="mdi mdi-message-text-outline"></i><span class="hide-menu">메신저</span></a></li>
				
				<li><a class="has-arrow " href="#" aria-expanded="false"><i
						class="mdi mdi-pen"></i><span class="hide-menu">전자결재</span></a>
					<ul aria-expanded="false" class="collapse">
						<li><a
							href="${pageContext.request.contextPath}/approval/approvalSelectForm.do">작성하기</a></li>
						<li><a
							href="${pageContext.request.contextPath}/approval/approvalWait.do">상신
								/ 기안함</a></li>
						<!-- 내가 결재서류 올리고 아직 완료되지 않은 문서 -->
						<li><a
							href="${pageContext.request.contextPath}/approval/approvalSubmit.do">승인
								/ 반려함</a></li>
						<!-- 내가 결재서류 올리고 모든 결재가 끝난 문서 -->
						<li><a
							href="${pageContext.request.contextPath}/approval/approvalReceive.do">미결함</a></li>
						<!-- 내가 결재해야할 문서 -->
						<li><a
							href="${pageContext.request.contextPath}/approval/approvalComplete.do">완료함</a></li>
						<!-- 내가 결재서류 올리고 모든 결재가 끝난 문서 -->
					</ul></li>
				
				
				<li><a class="has-arrow " href="#" aria-expanded="false"><i
						class="mdi mdi-package-variant-closed"></i><span class="hide-menu">자료실</span></a>
					<ul aria-expanded="false" class="collapse">
						<li><a
							href="${pageContext.request.contextPath}/documentboard/D50">사규
						</a></li>
						<li><a href="#" class="has-arrow">통합자료실</a>
							<ul aria-expanded="false" class="collapse">
								<li><a
									href="${pageContext.request.contextPath}/documentboard/D51">업무문서</a></li>
								<li><a
									href="${pageContext.request.contextPath}/documentboard/D52">교육문서</a></li>
							</ul>
						<li hidden><a
							href="${pageContext.request.contextPath}/documentboard/deptdocSelect.do">부서별
								자료실</a></li>
					</ul></li>
				
				<c:set var="auboard" value="${sessionScope.authority.auth_board}" />
				<c:if test="${auboard eq 'Y'}">
				<li><a class="has-arrow " href="#" aria-expanded="false"><i
						class="mdi mdi-bulletin-board"></i><span class="hide-menu">게시판</span></a>
					<ul aria-expanded="false" class="collapse">
						<li><a
							href="${pageContext.request.contextPath}/documentboard/D53">공지사항</a></li>
						<li><a
							href="${pageContext.request.contextPath}/documentboard/D55">조직개편
								및 인사발령</a></li>
						<li><a
							href="${pageContext.request.contextPath}/documentboard/D54">경조사</a></li>
						<li><a
							href="${pageContext.request.contextPath}/documentboard/D56">NEWS</a></li>
						<li><a
							href="${pageContext.request.contextPath}/documentboard/D57">자유게시판</a></li>
						<li><a
							href="${pageContext.request.contextPath}/documentboard/${ sessionScope.employee.dept_code }">부서게시판</a></li>
					</ul></li>
				</c:if>
				<li><a class="has-arrow " href="#" aria-expanded="false"><i
						class="mdi mdi-book-open-variant"></i><span class="hide-menu">교육</span></a>
					<ul aria-expanded="false" class="collapse">
						<li><a
							href="${pageContext.request.contextPath}/education/edcationview.do">일정
								& 신청</a></li>
						<li><a
							href="${pageContext.request.contextPath}/education/eduApplyview.do">교육
								신청 현황</a></li>

					</ul></li>
				<li><a href="${pageContext.request.contextPath}/survey/surveyList.do" aria-expanded="false"><i
						class="mdi mdi-file-chart"></i><span class="hide-menu">설문조사</span></a>
				</li>
				<c:set var="auper" value="${sessionScope.authority.auth_personnal}" />
				<c:if test="${auper eq 'Y'}">
					<li><a
						href="${pageContext.request.contextPath}/employee/employeeList.do"
						aria-expanded="false"><i
							class="mdi mdi-account-settings-variant"></i> <span
							class="hide-menu">인사 관리</span></a></li>
				</c:if>
				<c:set var="auauthor" value="${sessionScope.authority.auth_authority}" />
				<c:if test="${auauthor eq 'Y'}">		
				<li><a
					href="${pageContext.request.contextPath}/authority/authorityList.do"
					aria-expanded="false"><i class="mdi mdi-account-key"></i> <span
						class="hide-menu">권한관리</span></a></li>
				</c:if>
				<c:set var="aupay" value="${sessionScope.authority.auth_pay}" />
				<c:if test="${aupay eq 'Y'}">
				<li><a
					href="${pageContext.request.contextPath}/pay/employeeList.do"
					aria-expanded="false"><i class="mdi mdi-account-star"></i> <span
						class="hide-menu">급여관리</span></a></li>
				</c:if>

			</ul>
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->

</aside>
<!-- ============================================================== -->
<!-- End Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->