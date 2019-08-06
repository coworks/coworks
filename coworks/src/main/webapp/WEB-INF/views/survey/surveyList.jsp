<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : ${ sessionScope.employee.emp_name }의 TODO</title>
<c:import url="../common/header.jsp" />
<style>
.detail-box {
	border-bottom: solid #E6E6E6 1px !important;
}

.detail-list {
	border: solid #E6E6E6 1px !important;
	padding: 85px 0;
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />

		<div class="modal" id="insertSurvey" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-l">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="myLargeModalLabel">설문조사 등록하기</h2>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="form-body">
						<form method="post" action="surveyInsert.do" name="surveyInsert">
							<div class="card-body">
								<div class="row pt-3">
									<div class="col-md-12">
										<div class="form-group">
											<label class="control-label">제목 </label> <input type="text"
												id="survey_quest" name="survey_quest" class="form-control"
												placeholder="">
											<!-- <small class="form-control-feedback"> This is inline help </small> -->
										</div>
									</div>
								</div>
								<!--/span-->

								<div class="col-md-13">
									<div class="form-group">
										<label class="control-label">시작일시 </label> <input type="date"
											id="survey_start" name="survey_start" class="form-control">
										<!-- <small class="form-control-feedback"> This is inline help </small> -->
									</div>
								</div>

								<div class="col-md-13">
									<div class="form-group">
										<label class="control-label">종료일시 </label> <input type="date"
											id="survey_end" name="survey_end" class="form-control">
										<!-- <small class="form-control-feedback"> This is inline help </small> -->
									</div>
								</div>

								<div id="surveyadditem" class="col-md-13">
									<div class="form-group">
										<label class="control-label">항목 </label> 
											<input type="text" id="survey_content" name="survey_content" class="form-control"> 
											<input style="margin-top: 10px;" type="text" id=survey_content	name="survey_content" class="form-control">
											<input style="margin-top: 10px;" type="text" id="survey_content"	name="survey_content" class="form-control">
											<input style="margin-top: 10px;" type="text" id="survey_content"	name="survey_content" class="form-control">
										<!-- <small class="form-control-feedback"> This is inline help </small> -->
									</div>
								</div>

								<div style="margin-left: 280px; margin-top: 40px;">
									<button class="btn btn-info" type="submit">등록하기</button>
									<button type="button"
										class="btn btn-danger waves-effect text-left"
										data-dismiss="modal">취소하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</div>

	<div class="page-wrapper">
		<div class="container-fluid">

			<div class="row page-titles">
				<div class="col-md-6 col-8 align-self-center">
					<h3 class="text-themecolor mb-0 mt-0">설문조사</h3>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">메인페이지</a></li>
						<li class="breadcrumb-item active">설문조사</li>
					</ol>
				</div>
			</div>
			<!-- 시작 -->
			<div class="col-lg-12 col-md-12">
				<div class="card">
					<div class="card-body">
						<h6 class="card-subtitle">
							<i class="icon-heart"></i> 설문에 응답해주세요!
							</code>
						</h6>
						<div style="float: right; display: inline-border;">
							<button type="button" data-toggle="modal"
								data-target="#insertSurvey"
								class="btn btn-info">설문조사 등록
							</button>
						</div>
						<br>
						<!-- Nav tabs -->
						<div class="vtabs col-12">
							<ul class="nav nav-tabs tabs-vertical" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#home9" role="tab" aria-selected="true">
										<span>진행중</span>
								</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#profile9" role="tab" aria-selected="false"><span>종료</span></a>
								</li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active" id="home9" role="tabpanel">
									<div class="p-3">

										<!-- 반복문으로 할 일 내역 나올 곳 -->
										<div class="row">

											<!-- 등록된 todoList가 없을 때 -->
											<c:if test="${todoList.size() eq 0 }">
												<div class="detail-box col-12">
													<div class="detail-list">
														<div>
															<img
																src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png"
																style="width: 70px; vertical-align: middle; border: 0" />
														</div>
														<h4 class="text-themecolor" style="margin: 10px 0;">등록된
															TODO가 없습니다.</h4>

													</div>
												</div>
											</c:if>
											<c:if test="${todoList.size() ne 0 }">
												<c:forEach items="${todoList}" var="todo">

													<div class="col-lg-4 col-md-6 col-xs-12">
														<div class="ribbon-wrapper card"
															style="border: 1px solid lightgray;"></div>
													</div>
												</c:forEach>
											</c:if>


											<c:forEach items="${list}" var="survey">
												<div class="col-lg-4 col-md-6 col-xs-12">
													<div class="ribbon-wrapper card"
														style="border: 1px solid lightgray;">
														<div class="card" style="border-style: groove">
															<h4 class="card-title">설문조사</h4>
															<p class="card-text">${survey.survey_quest}</p>
															<p class="card-text">
																<small class="text-muted"><fmt:formatDate
															value="${survey.survey_start }" pattern="yyyy년MM월dd일 " /> ~
																	<fmt:formatDate
															value="${survey.survey_end }" pattern="yyyy년MM월dd일 " /></small>
															</p>
															<h5 class="mt-4">
																YES!!<span class="float-right">10%</span>
															</h5>
															<div class="progress ">
																<div
																	class="progress-bar bg-success wow animated progress-animated"
																	style="width: 85%; height: 6px;" role="progressbar">
																	<span class="sr-only">60% Complete</span>
																</div>
															</div>
															<h5 class="mt-4">
																No :(<span class="float-right">20%</span>
															</h5>
															<div class="progress ">
																<div
																	class="progress-bar bg-danger wow animated progress-animated"
																	style="width: 15%; height: 6px;" role="progressbar">
																	<span class="sr-only">60% Complete</span>
																</div>
															</div>
														</div>

													</div>
												</div>
											</c:forEach>
										</div>
										<!-- row -->
									</div>
								</div>
								<!-- ←┘ 여기까지가 '할 일' 부분이유~ -->
								<div class="tab-pane" id="profile9" role="tabpanel">
									<div class="p-3">

										<!-- 반복문으로 완료 내역 나올 곳 -->
										<div class="row">

											<!-- 완료된 todoList가 없을 때 -->
											<c:if test="${finList.size() eq 0 }">
												<div class="detail-box col-12">
													<div class="detail-list">
														<div>
															<img
																src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png"
																style="width: 70px; vertical-align: middle; border: 0" />
														</div>
														<h4 class="text-themecolor" style="margin: 10px 0;">완료된
															TODO가 없습니다.</h4>

													</div>
												</div>
											</c:if>
											<c:if test="${finList.size() ne 0 }">
												<c:forEach items="${finList}" var="fintodo">

													<!-- 반복될 리본 -->
													<div class="col-lg-4 col-md-6 col-xs-12">
														<div class="ribbon-wrapper card"
															style="border: 1px solid lightgray;">
															<button type="button"
																class="ribbon btn btn-sm btn-light dropdown-toggle flipInY"
																data-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false"
																style="margin-left: 70%; color: black;">
																<i class="ti-settings"></i>
															</button>
															<div class="dropdown-menu animated flipInY"
																x-placement="bottom-start"
																style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
																<a class="dropdown-item" data-toggle="modal"
																	data-target="#deletetodo"
																	data-whatever="${fintodo.todo_content }"
																	data-whatever1="${fintodo.todo_no }"> <i
																	class="mdi mdi-playlist-remove"></i> 삭제하기
																</a>
															</div>
															<div class="ribbon ribbon-default">완료</div>
															<c:if test="${fintodo.todo_content.length() gt 48}">
																<p class="ribbon-content">${fintodo.todo_content.substring(0,47) }
																	...</p>
															</c:if>
															<c:if test="${fintodo.todo_content.length()le 48}">
																<p class="ribbon-content">${fintodo.todo_content }</p>
															</c:if>
														</div>
													</div>
												</c:forEach>
											</c:if>
										</div>

									</div>
								</div>
								<!-- ←┘ 여기까지가 '완료' 부분이유~ -->
							</div>
						</div>
					</div>
				</div>
				<c:out value="${pageBar}" escapeXml="false" />
			</div>


			<!-- 끝 -->

		</div>
		<c:import url="../common/footer.jsp" />
	</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />

	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"
		aria-hidden="true"></script>
	<script>
		$('#correcttodo').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget)
			var recipient = button.data('whatever')
			var recip1 = button.data('whatever1')
			var modal = $(this)
			modal.find('.modal-body input').val(recipient)
			modal.find('.modal-footer input').val(recip1)
		});

		$('#deletetodo').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget)
			var recipient = button.data('whatever')
			var recip1 = button.data('whatever1')
			var modal = $(this)
			modal.find('.dltcontent').text('[' + recipient + '] 을 삭제하시겠습니까?')
			modal.find('.modal-footer input').val(recip1)
		});

		$("a[id]")
				.on(
						"click",
						function() {
							var todo_no = $(this).attr("id");

							Swal.fire({
								position : 'top-middle',
								type : 'success',
								title : '완료!',
								showConfirmButton : false,
								timer : 1000
							});

							location.href = "${pageContext.request.contextPath}/todo/finishtodo.do?todo_no="
									+ todo_no;
						});

	
	</script>


</body>
</html>