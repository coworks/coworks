<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : TODO</title>
<c:import url="../common/header.jsp" />
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />

		<!-- TODO 추가 모달 → -->
		<div id="addtodo" class="modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<form method="post" action="todolist.do" name="addtodo">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="myModalLabel">TODO 추가하기</h2>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="col-md-12">
							<div class="form-group has-success">
								<br> <label class="control-label">상태</label> <select
									id="todo_condition" name="todo_condition"
									class="form-control custom-select">
									<option value="null"></option>
									<option value="0" style="color: red; font-weight: bold;">긴급</option>
									<option value="1" style="color: orange; font-weight: bold;">보통</option>
									<option value="2" style="color: green; font-weight: bold;">여유</option>
								</select>
							</div>
						</div>

						<div class="modal-body">
							<div class="col-md-13">
								<div class="form-group has-success">
									<label class="control-label">내용</label> <input type="text"
										id="todo_content" name="todo_content" class="form-control"
										placeholder="내용을 입력하세요">
								</div>
							</div>
						</div>
						<input type="text" value="${ sessionScope.employee.emp_no }"
							name="emp_no" hidden />
						<div class="modal-footer">
							<button type="button" class="btn btn-light waves-effect"
								data-dismiss="modal">취소하기</button>
							<button type="submit" class="btn btn-success waves-effect">등록하기</button>

						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- TODO 추가 모달 ← -->

		<!-- TODO 수정 모달 → -->
		<div id="correcttodo" class="modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<form method="post" action="updatetodo.do" name="correcttodo">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="myModalLabel">TODO 수정하기</h2>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="col-md-12">
							<div class="form-group has-success">
								<br> <label class="control-label">상태</label> <select
									id="todo_condition" name="todo_condition"
									class="form-control custom-select">
									<option value="null"></option>
									<option value="0" style="color: red; font-weight: bold;">긴급</option>
									<option value="1" style="color: orange; font-weight: bold;">보통</option>
									<option value="2" style="color: green; font-weight: bold;">여유</option>
								</select>
							</div>
						</div>

						<div class="modal-body">
							<div class="col-md-13">
								<div class="form-group has-success">
									<label class="control-label">내용</label> <input type="text"
										id="todo_content" name="todo_content" class="form-control"
										value="기존 내용 받아오쟈~~~">
								</div>
							</div>
						</div>
						<input type="text" value="${ sessionScope.employee.emp_no }"
							name="emp_no" hidden />
						<div class="modal-footer">
							<button type="button" class="btn btn-light waves-effect"
								data-dismiss="modal">취소하기</button>
							<button type="submit" class="btn btn-success waves-effect">등록하기</button>

						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- TODO 수정 모달 ← -->



		<!-- TODO 삭제 모달 → -->
		<div id="deletetodo" class="modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<form method="post" action="deletetodo.do" name="deletetodo">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="myModalLabel">TODO 삭제하기</h2>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="col-md-12">
							<div
								class="swal2-icon swal2-question swal2-arabic-question-mark swal2-animate-question-icon"
								style="display: flex;"></div>
						</div>

						<div class="modal-body">
							<div class="col-md-13">
								<h4>[ TODO_CONTENT가져오기 ]를 삭제하시겠습니까?</h4>
							</div>
						</div>
						<input type="text" value="${ sessionScope.employee.emp_no }"
							name="emp_no" hidden />
						<div class="modal-footer">
							<button type="button" class="btn btn-light waves-effect"
								data-dismiss="modal">취소하기</button>
							<button type="submit" class="btn btn-success waves-effect">삭제하기</button>

						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- TODO 삭제 모달 ← -->



		<div class="page-wrapper">
			<div class="container-fluid">

				<!-- 시작 -->

				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">TODO</h4>
							<h6 class="card-subtitle">${ sessionScope.employee.emp_name }님의
								TODO List!
								</code>
							</h6>
							<div style="float: right; display: inline-border;">
								<button type="button" data-toggle="modal" data-target="#addtodo"
									class="btn btn-info btn-circle waves-effect waves-light">
									<i class="fas fa-plus"></i>
								</button>
							</div>
							<br>
							<!-- Nav tabs -->
							<div class="vtabs col-12">
								<ul class="nav nav-tabs tabs-vertical" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home9" role="tab"
										aria-selected="true"><span>할 일</span></a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#profile9" role="tab" aria-selected="false"><span>완료</span></a>
									</li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane active" id="home9" role="tabpanel">
										<div class="p-3">

											<!-- 반복문으로 내역 뽑으면 될 듯 -->
											<div class="row">
											
											<c:forEach items="${todoList}" var="todo">
												<div class="col-lg-4 col-md-6 col-xs-12">
													<div class="ribbon-wrapper card"
														style="border: 1px solid lightgray;">

														<div class="ribbon ribbon-danger">
															<i class="ti-bell"></i> 긴급 + ${todo.todo_condition}
														</div>
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
																data-target="#correcttodo"><i
																class="mdi mdi-lead-pencil"></i> 수정하기</a>
															<a class="dropdown-item" data-toggle="modal"
																data-target="#deletetodo"><i class="mdi mdi-delete"></i>
																삭제하기</a>
														</div>
														<p class="ribbon-content">${todo.todo_content }</p>
													</div>
												</div>
												</c:forEach>
												<!-- <div class="col-lg-4 col-md-6 col-xs-12">
													<div class="ribbon-wrapper card"
														style="border: 1px solid lightgray;">
														<div class="ribbon ribbon-warning">
															<i class="ti-bell"></i> 보통
														</div>
														<button type="button"
															class="ribbon btn btn-sm btn-light dropdown-toggle"
															data-toggle="dropdown" aria-haspopup="true"
															aria-expanded="false"
															style="margin-left: 70%; color: black;">
															<i class="ti-settings"></i>
														</button>
														<div class="dropdown-menu animated flipInY"
															x-placement="bottom-start"
															style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
															<a class="dropdown-item" data-toggle="modal"
																data-target="#correcttodo"><i
																class="mdi mdi-lead-pencil"></i> 수정하기</a>
															<a class="dropdown-item" data-toggle="modal"
																data-target="#deletetodo"><i class="mdi mdi-delete"></i>
																삭제하기</a>
														</div>
														<p class="ribbon-content">이거 저거 요고 고거 그거 해야 함. 몬G알G</p>
													</div>
												</div>
												<div class="col-lg-4 col-md-6 col-xs-12">
													<div class="ribbon-wrapper card"
														style="border: 1px solid lightgray;">
														<div class="ribbon ribbon-success">
															<i class="ti-bell"></i> 여유
														</div>
														<button type="button"
															class="ribbon btn btn-sm btn-light dropdown-toggle"
															data-toggle="dropdown" aria-haspopup="true"
															aria-expanded="false"
															style="margin-left: 70%; color: black;">
															<i class="ti-settings"></i>
														</button>
														<div class="dropdown-menu animated flipInY"
															x-placement="bottom-start"
															style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 37px, 0px);">
															<a class="dropdown-item" name="todo_status"><i
																class="mdi mdi-flag-checkered"></i> 완료</a>
															<a class="dropdown-item" data-toggle="modal"
																data-target="#correcttodo"><i
																class="mdi mdi-lead-pencil"></i> 수정하기</a>
															<a class="dropdown-item" data-toggle="modal"
																data-target="#deletetodo"><i class="mdi mdi-delete"></i>
																삭제하기</a>
														</div>
														<p class="ribbon-content">이거 저거 요고 고거 그거 해야 함. 몬G알G</p>
													</div>
												</div> -->

											</div>
											<!-- row -->
										</div>
									</div>
									<div class="tab-pane p-3" id="profile9" role="tabpanel">2</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 글자 수 제한 넘으면 ...으로 표시되게!! -->
				<!--    <c:if test="${m.getMail_subject().length() gt 20}">
                                                               ${m.getMail_subject().substring(0,20) } ...
                                                            </c:if>
                                                             <c:if test="${m.getMail_subject().length()le 20}">
                                                                ${m.getMail_subject() }
                                                             </c:if>  -->

				<!-- 끝 -->

			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />

	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>




</body>
</html>