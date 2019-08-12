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

		<!-- TODO 추가 모달 → -->
		<div id="addtodo" class="modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<form method="post" action="addtodo.do" name="addtodo">
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
									<option value="1"></option>
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
										id="todo_content" name="todo_content"
										class="form-control writtencontent" placeholder="내용을 입력하세요">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<input type="text" value="${ sessionScope.employee.emp_no }"
								name="emp_no" hidden />

							<button type="button" class="btn btn-light waves-effect"
								data-dismiss="modal">취소하기</button>
							<button type="submit" class="btn btn-success waves-effect"
								onclick="return validate();">등록하기</button>

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
				<form method="post" action="correcttodo.do" name="correcttodo">
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
									<option value="1"></option>
									<option value="0" style="color: red; font-weight: bold;">긴급</option>
									<option value="1" style="color: orange; font-weight: bold;">보통</option>
									<option value="2" style="color: green; font-weight: bold;">여유</option>
								</select>
							</div>
						</div>

						<div class="modal-body">
							<div class="col-md-13">
								<div class="form-group has-success">
									<label for="recipient-name" class="control-label">내용</label> <input
										type="text" id="recipient-name" name="todo_content"
										class="form-control rewrittencontent">
								</div>
							</div>
						</div>
						<input type="text" value="${ sessionScope.employee.emp_no }"
							name="emp_no" hidden />
						<div class="modal-footer">
							<label for="recip1-name" class="control-label" hidden></label> <input
								type="text" id="recip1-name" name="todo_no" class="form-control"
								hidden />

							<button type="button" class="btn btn-light waves-effect"
								data-dismiss="modal">취소하기</button>
							<button type="submit" class="btn btn-success waves-effect"
								onclick="return corrvalidate();">수정하기</button>
							<!--   -->

						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- TODO 수정 모달 ← -->

		<!-- 고양이 있는 모달 -->
		<!-- <div class="swal2-container swal2-center swal2-fade swal2-shown"
			style="background: url(&quot;../assets/images/background/nyan-cat.gif&quot;) left center no-repeat rgba(0, 0, 123, 0.4); overflow-y: auto;">
			<div aria-labelledby="swal2-title" aria-describedby="swal2-content"
				class="swal2-popup swal2-modal swal2-show" tabindex="-1"
				role="dialog" aria-live="assertive" aria-modal="true"
				style="width: 600px; padding: 3em; background: url(&quot;../assets/images/background/active-bg.png&quot;) rgb(255, 255, 255); display: flex;">
				<div class="swal2-header">
					<ul class="swal2-progress-steps" style="display: none;"></ul>
					<div class="swal2-icon swal2-error" style="display: none;">
						<span class="swal2-x-mark"><span
							class="swal2-x-mark-line-left"></span><span
							class="swal2-x-mark-line-right"></span></span>
					</div>
					<div class="swal2-icon swal2-question" style="display: none;"></div>
					<div class="swal2-icon swal2-warning" style="display: none;"></div>
					<div class="swal2-icon swal2-info" style="display: none;"></div>
					<div class="swal2-icon swal2-success" style="display: none;">
						<div class="swal2-success-circular-line-left"></div>
						<span class="swal2-success-line-tip"></span> <span
							class="swal2-success-line-long"></span>
						<div class="swal2-success-ring"></div>
						<div class="swal2-success-fix"></div>
						<div class="swal2-success-circular-line-right"></div>
					</div>
					<img class="swal2-image" style="display: none;">
					<h2 class="swal2-title" id="swal2-title" style="display: flex;">Custom
						width, padding, background.</h2>
					<button type="button" class="swal2-close"
						aria-label="Close this dialog" style="display: none;">×</button>
				</div>
				<div class="swal2-content">
					<div id="swal2-content" style="display: none;"></div>
					<input class="swal2-input" style="display: none;"><input
						type="file" class="swal2-file" style="display: none;">
					<div class="swal2-range" style="display: none;">
						<input type="range">
						<output></output>
					</div>
					<select class="swal2-select" style="display: none;"></select>
					<div class="swal2-radio" style="display: none;"></div>
					<label for="swal2-checkbox" class="swal2-checkbox"
						style="display: none;"><input type="checkbox"><span
						class="swal2-label"></span></label>
					<textarea class="swal2-textarea" style="display: none;"></textarea>
					<div class="swal2-validation-message" id="swal2-validation-message"
						style="display: none;"></div>
				</div>
				<div class="swal2-actions" style="display: flex;">
					<button type="button" class="swal2-confirm swal2-styled"
						aria-label=""
						style="display: inline-block; border-left-color: rgb(48, 133, 214); border-right-color: rgb(48, 133, 214);">OK</button>
					<button type="button" class="swal2-cancel swal2-styled"
						aria-label="" style="display: none;">Cancel</button>
				</div>
				<div class="swal2-footer" style="display: none;"></div>
			</div>
		</div> -->
		<!--  -->

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
						<div class="modal-body">
							<div class="col-md-13" style="text-align: center;">
								<img
									src="${pageContext.request.contextPath}/resources/images/boardImg/noun_Warning.png"
									style="width: 70px; vertical-align: middle; border: 0" /> <br>
								<br>
								<h4 class="dltcontent">[ TODO_CONTENT가져오기 ]를 삭제하시겠습니까?</h4>
							</div>
						</div>
						<input type="text" value="${ sessionScope.employee.emp_no }"
							name="emp_no" hidden />
						<div class="modal-footer">

							<label for="recip1-name" class="control-label" hidden></label> <input
								type="text" id="recip1-name" name="todo_no" class="form-control"
								hidden />

							<button type="button" class="btn btn-light waves-effect"
								data-dismiss="modal">취소하기</button>
							<button type="submit" class="btn btn-danger waves-effect">삭제하기</button>

						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- TODO 삭제 모달 ← -->



		<div class="page-wrapper">
			<div class="container-fluid">

				<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									TODO</span></li>
						</ol>
					</div>
				</div>


				<!-- 시작 -->

				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-body">
							<h6 class="card-subtitle">
								<i class="icon-heart"></i> ${ sessionScope.employee.emp_name }님의
								TODO List!
								</code>
							</h6>
							<div style="float: right; display: inline-border;">
								<button type="button" data-toggle="modal" data-target="#addtodo"
									class="btn btn-info btn-circle waves-effect waves-light">
									<i class="fas fa-plus" data-toggle="tooltip"
										data-original-title="TODO 추가" aria-describedby="tooltip859564"></i>
								</button>


							</div>
							<br>
							<!-- Nav tabs -->
							<div class="vtabs col-12">
								<ul class="nav nav-tabs tabs-vertical" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home9" role="tab"
										aria-selected="true"> <span>할 일 <c:if
													test="${todoList.size() ne 0 }">
													<span class="badge badge-danger">${todoList.size() }</span>
												</c:if>
										</span>
									</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#profile9" role="tab" aria-selected="false"><span>완료</span></a>
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
																style="border: 1px solid lightgray;">
																<c:choose>
																	<c:when test="${todo.todo_condition eq 0}">
																		<div class="ribbon ribbon-danger">
																			<i class="ti-bell"></i> 긴급
																		</div>
																	</c:when>
																	<c:when test="${todo.todo_condition eq 1 }">
																		<div class="ribbon ribbon-warning">
																			<i class="ti-bell"></i> 보통
																		</div>
																	</c:when>
																	<c:when test="${todo.todo_condition eq 2 }">
																		<div class="ribbon ribbon-success">
																			<i class="ti-bell"></i> 여유
																		</div>
																	</c:when>
																</c:choose>

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
																	<a class="dropdown-item sa-position"
																		id="${todo.todo_no }" value="${todo.todo_no }"><i
																		class="mdi mdi-playlist-check"></i> 완료! </a> <a
																		class="dropdown-item" data-toggle="modal"
																		data-target="#correcttodo"
																		data-whatever="${todo.todo_content }"
																		data-whatever1="${todo.todo_no }"> <i
																		class="mdi mdi-refresh"></i> 수정하기
																	</a> <a class="dropdown-item" data-toggle="modal"
																		data-target="#deletetodo"
																		data-whatever="${todo.todo_content }"
																		data-whatever1="${todo.todo_no }"> <i
																		class="mdi mdi-playlist-remove"></i> 삭제하기
																	</a>
																</div>

																<c:if test="${todo.todo_content.length() gt 48}">
																	<p class="ribbon-content">${todo.todo_content.substring(0,47) }
																		...</p>
																</c:if>
																<c:if test="${todo.todo_content.length()le 48}">
																	<p class="ribbon-content">${todo.todo_content }</p>
																</c:if>
															</div>
														</div>
													</c:forEach>
												</c:if>

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

		$(".sa-position")
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

		// (입력)todo 내용 입력해야 넘어감
		function validate() {
			var boardContent = $(".writtencontent").val();

			if (boardContent == "") {
				Swal.fire({
					title : "ʕ•ᴥ•ʔ   등록할 내용을 입력하세요!",
					timer : 1300,
					showConfirmButton : false
				});
				return false;
			}
			return true;
		}

		// (수정)todo 내용 입력해야 넘어감
		  		function corrvalidate() {
		 var boardContent = $(".rewrittencontent").val();
		
		 if(boardContent == "") {
				Swal.fire({
					title : "ʕ•ᴥ•ʔ   수정할 내용을 입력하세요!",
					timer : 1300,
					showConfirmButton : false
				});
				return false;
			}
		 else return true;
		}
	</script>


</body>
</html>