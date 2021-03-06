<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.net.InetAddress, com.kh.coworks.attendance.model.vo.Attendance"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">

<title>CO-WORKS</title>
<!-- Calendar CSS -->
<link
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColorPicker-master/dist/css/asColorPicker.css"
	rel="stylesheet">
<!-- Date picker plugins css -->
<link
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker plugins css -->
<link
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/timepicker/bootstrap-timepicker.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/daterangepicker/daterangepicker.css"
	rel="stylesheet">

<c:import url="views/common/header.jsp" />

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
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<c:import url="views/common/topbar.jsp" />
		<c:import url="views/common/sidebar.jsp" />
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->

				<!-- Row -->
				<div class="row">
					<div class="col-lg-4">
						<div class="card">
							<div class="card-body">
								<div class="m-2">
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일"
										var="today" />
									<h4 class="card-title">
										<c:out value="${today}" />
									</h4>
									<p class="card-text" id="time">
										<c:if
											test="${atten.atten_date==null && atten.atten_date==null}">
											<p>
												출근가능시간 : 07:00 이후<br>
										</c:if>
										<c:if
											test="${atten.atten_attTime!=null && atten.atten_date!=null}">

											<span id="span1"> 출근 시간 : ${atten.atten_attTime}
												&nbsp; &nbsp; &nbsp; &nbsp; 출근 IP : ${atten.atten_attIP} </span>
										</c:if>
										<c:if
											test="${atten.atten_leaveTime!=null && atten.atten_leaveIP!=null}">
											<br>
											<span id="span2"> 퇴근 시간 : ${atten.atten_leaveTime}
												&nbsp; &nbsp; &nbsp; &nbsp; 퇴근 IP : ${atten.atten_leaveIP} </span>
											<br>
										</c:if>


									</p>
									<c:choose>
										<c:when
											test="${atten.atten_attTime==null && atten.atten_date==null}">
											<button type="button" id="attendFail"
												class="btn waves-effect waves-light btn-block btn-outline-warning">출근하기</button>
										</c:when>
										<c:when
											test="${atten.atten_leaveTime!=null && atten.atten_leaveIP!=null}">
											<button type="button" id="leaveSucess"
												class="btn waves-effect waves-light btn-block btn-outline-info"
												disabled="true">퇴근완료</button>
										</c:when>
										<c:otherwise>
											<button type="button" id="leavebutton"
												onclick="onclick1(${atten.atten_no});"
												class="btn waves-effect waves-light btn-block btn-outline-danger">퇴근하기</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

						<script>
						 
						$('#attendFail').on("click",function(){
							alert("출근 시간대가 아닙니다.");
						});
						 
						
						function onclick1(atten_no){ 
							
							if(confirm("퇴근하시겠습니까?")==true){
							$.ajax({
								url : "${pageContext.request.contextPath}/mypage/attendanceleave.do",
		                          dataType : "json", 
		                          data : {atten_no :atten_no}, 
		                          success : function(response){
		                      	 	 location.href="${pageContext.request.contextPath}/commonProcessing.do";
		                          },error: function(){
		                        	  alert("실패~"); 
		                          }  
							});
							}
							
						};
						</script>


						<!-- TODO -->
						<div class="card">
							<div class="card-body">
								<button class="float-right btn btn-sm btn-rounded btn-info"
									data-toggle="modal" data-target="#addtodohome">
									<i class="fas fa-plus"></i>
								</button>
								<h4 class="card-title">${ sessionScope.employee.emp_name }의
									To Do list
									<c:if test="${todoList.size() ne 0 }">
										<span class="badge badge-danger">${todoList.size() }</span>
									</c:if>
								</h4>
								<!-- ============================================================== -->
								<!-- To do list widgets -->
								<!-- ============================================================== -->
								<div class="to-do-widget mt-3">
									<!-- .modal for add task -->
									<div id="addtodohome" class="modal" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true"
										style="display: none;">
										<div
											class="modal-dialog  <modal-dialog-centered></modal-dialog-centered>">
											<form method="post" action="addtodohome.do"
												name="addtodohome">
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
																<option value="1"
																	style="color: orange; font-weight: bold;">보통</option>
																<option value="2"
																	style="color: green; font-weight: bold;">여유</option>
															</select>
														</div>
													</div>

													<div class="modal-body">
														<div class="col-md-13">
															<div class="form-group has-success">
																<label class="control-label">내용</label> <input
																	type="text" id="todo_content" name="todo_content"
																	class="form-control writtencontent"
																	placeholder="내용을 입력하세요">
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<input type="text"
															value="${ sessionScope.employee.emp_no }" name="emp_no"
															hidden />

														<button type="button" class="btn btn-light waves-effect"
															data-dismiss="modal">취소하기</button>
														<button type="submit" class="btn btn-success waves-effect"
															onclick="return convalidate();">등록하기</button>

													</div>
												</div>
											</form>
										</div>
									</div>
									<!-- BEGIN MODAL -->
						            <div class="modal none-border" id="my-event2">
						               <div class="modal-dialog">
						                  <div class="modal-content">
						                     <div class="modal-header">
						                        <h4 class="modal-title">
						                           <strong>일정 추가</strong>
						                        </h4>
						                        <button type="button" class="close" data-dismiss="modal"
						                           aria-hidden="true">&times;</button>
						                     </div>
						                     <div class="modal-body"></div>
						                     <div class="modal-footer">
						                        <button type="button" class="btn btn-white waves-effect"
						                           data-dismiss="modal">닫기</button>
						                        <button type="button"
						                           class='btn btn-success save-event waves-effect waves-light'>
						                           <i class='fa fa-check'></i> 추가
						                        </button> 
						                     </div>
						                  </div>
						               </div>
						            </div>
									<!-- /.modal -->
									<ul class="list-task todo-list list-group mb-0"
										data-role="tasklist">

										<c:if test="${todoList.size() eq 0 }">
											<div class="detail-box col-12">
												<div class="detail-list">
													<div>
														<img
															src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png"
															style="width: 50px; vertical-align: middle; border: 0" />
													</div>
													<h4 class="text-themecolor" style="margin: 10px 0;">등록된
														TODO가 없습니다.</h4>
												</div>
											</div>
										</c:if>

										<c:if test="${todoList.size() ne 0 }">
											<c:forEach items="${todoList}" var="todo">

												<li class="list-group-item" data-role="task">
													<div class="checkbox checkbox-info">
														<input type="checkbox" id="${todo.todo_no }"
															value="${todo.todo_no }" class="todoCk"> <label
															for="${todo.todo_no }" class="todoLabel"> <c:if
																test="${todo.todo_content.length() gt 30}">
																<c:choose>
																	<c:when test="${todo.todo_condition eq 0}">
																		<span class="label label-danger">긴급</span>
																	</c:when>
																	<c:when test="${todo.todo_condition eq 1 }">
																		<span class="label label-warning">보통</span>
																	</c:when>
																	<c:when test="${todo.todo_condition eq 2 }">
																		<span class="label label-success">여유</span>
																	</c:when>
																</c:choose>
																<span>${todo.todo_content.substring(0,29) } ...</span>
															</c:if> <c:if test="${todo.todo_content.length()le 30}">
																<c:choose>
																	<c:when test="${todo.todo_condition eq 0}">
																		<span class="label label-light-danger">긴급</span>
																	</c:when>
																	<c:when test="${todo.todo_condition eq 1 }">
																		<span class="label label-light-warning">보통</span>
																	</c:when>
																	<c:when test="${todo.todo_condition eq 2 }">
																		<span class="label label-light-success">여유</span>
																	</c:when>
																</c:choose>
																<span>${todo.todo_content }</span>
															</c:if>
														</label>
													</div>
												</li>
											</c:forEach>
										</c:if>
									</ul>
								</div>
							</div>
						</div>




						<div class="card">
							<div class="card-body">
								<div class="m-2 p-2">
									<c:set var="now" value="<%=new java.util.Date()%>" />
									<h4 class="card-title">설문조사</h4>
									<c:if test="${survey == null }">
										<div class="detail-box col-12">
											<div class="detail-list">
												<div>
													<img
														src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png"
														style="width: 50px; vertical-align: middle; border: 0" />
												</div>
												<h4 class="text-themecolor" style="margin: 10px 0;">현재
													진행 중인 설문조사가 없습니다.</h4>
											</div>
										</div>
									</c:if>
									<c:if test="${survey != null }">
										<c:set var="surveyApp" value="${surveyApply}" />
										<c:if test="${surveyApp == null}">
											<c:if test="${now <survey.survey_end}">
												<button class="float-right btn btn-sm btn-rounded btn-info"
													id="sa-success" onclick="return go(1);">투표하기</button>
											</c:if>
											<input type="hidden" value="${sessionScope.employee.emp_no }"
												name="emp_no" id="emp_no" />
											<input type="hidden" name="survey_no" id="survey_no"
												value="${survey.survey_no }" />

											<p class="card-text">
												<i class="fas fa-quote-left text-info"></i>
												<c:out value="${survey.survey_quest}" />
												<i class="fas fa-quote-right text-info"></i>
											</p>
											<p class="card-text">
												<c:if test="${now >survey.survey_end}">
													<small class="text-danger"
														style="text-decoration: line-through"><fmt:formatDate
															value="${survey.survey_start }" pattern="yyyy년MM월dd일 " />
														~ <fmt:formatDate value="${survey.survey_end }"
															pattern="yyyy년MM월dd일 " /></small>
													<small class="text-danger"> 기한만료 </small>
												</c:if>
											</p>

											<div class="radio radio-info pl-1">
												<c:forEach items="${salist}" var="sa">
													<li style="list-style: none;"><input type="radio"
														id="${sa.surveyAn_no }" name="radio"
														value="${sa.surveyAn_no }"> <label
														for="${sa.surveyAn_no }">&nbsp;<span>${sa.survey_content}
														</span>
													</label></li>
												</c:forEach>
											</div>
										</c:if>
										<c:set var="surveyApp" value="${surveyApply}" />
										<c:if test="${surveyApp != null}">
											<c:if test="${now <survey.survey_end}">
												<button class="float-right btn btn-sm btn-rounded btn-info"
													id="sa-success" onclick="return go(2);">투표수정</button>
											</c:if>
											<input type="hidden" value="${sessionScope.employee.emp_no }"
												name="emp_no" id="emp_no" />
											<input type="hidden" name="survey_no" id="survey_no"
												value="${survey.survey_no }" />
											<p class="card-text">
												<i class="fas fa-quote-left text-info"></i>
												<c:out value="${survey.survey_quest}" />
												<i class="fas fa-quote-right text-info"></i>
											</p>
											<p class="card-text">
												<c:if test="${now >survey.survey_end}">
													<small class="text-danger"
														style="text-decoration: line-through"><fmt:formatDate
															value="${survey.survey_start }" pattern="yyyy년MM월dd일 " />
														~ <fmt:formatDate value="${survey.survey_end }"
															pattern="yyyy년MM월dd일 " /></small>
													<small class="text-danger"> 기한만료 </small>
												</c:if>
											</p>

											<div class="radio radio-info pl-1">
												<c:forEach items="${salist}" var="sa">
													<c:if test="${surveyApp.surveyan_no == sa.surveyAn_no}">
														<li style="list-style: none;"><input type="radio"
															id="${sa.surveyAn_no }" name="radio"
															value="${sa.surveyAn_no }" checked> <label
															for="${sa.surveyAn_no }">&nbsp;<span>${sa.survey_content}
															</span>
														</label></li>
													</c:if>
													<c:if test="${surveyApp.surveyan_no != sa.surveyAn_no}">
														<li style="list-style: none;"><input type="radio"
															id="${sa.surveyAn_no }" name="radio"
															value="${sa.surveyAn_no }"> <label
															for="${sa.surveyAn_no }">&nbsp;<span>${sa.survey_content}
															</span>
														</label></li>
													</c:if>
												</c:forEach>
											</div>
										</c:if>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<div id="calendar"></div>
								<!-- BEGIN MODAL -->
								<div class="modal fade none-border" id="my-event">
									<div class="modal-dialog  modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">
													<strong>일정 상세보기</strong>
												</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
											</div>
											<div class="modal-body"></div>
											<div class="modal-footer">
												<button type="button" class="btn btn-white waves-effect"
													data-dismiss="modal">Close</button>
												<button type="button"
													class="btn btn-success save-event waves-effect waves-light">
													<i class='fa fa-check'></i>수정
												</button>
												<button type="button"
													class="btn btn-danger delete-event waves-effect waves-light"
													data-dismiss="modal">삭제</button>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal Add Category -->
								<div class="modal fade none-border" id="add-new-event">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">
													<strong>Add</strong> a category
												</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="row">
														<div class="col-md-6">
															<label class="control-label">Category Name</label> <input
																class="form-control form-white" placeholder="Enter name"
																type="text" name="category-name" />
														</div>
														<div class="col-md-6">
															<label class="control-label">Choose Category
																Color</label> <select class="form-control form-white"
																data-placeholder="Choose a color..."
																name="category-color">
																<option value="success">Success</option>
																<option value="danger">Danger</option>
																<option value="info">Info</option>
																<option value="primary">Primary</option>
																<option value="warning">Warning</option>
																<option value="inverse">Inverse</option>
															</select>
														</div>
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button"
													class="btn btn-danger waves-effect waves-light save-category"
													data-dismiss="modal">Save</button>
												<button type="button" class="btn btn-white waves-effect"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
								<!-- END MODAL -->
							</div>
						</div>
					</div>

				</div>

				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->

			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<c:import url="views/common/footer.jsp" />
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- This page plugins -->
	<!-- ============================================================== -->


	<c:import url="views/common/bottomJquery.jsp" />
	<!-- Calendar JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script>
	<script
		src='${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.min.js'></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/jquery.fullcalendar.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>

	<!-- Date range Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"
		aria-hidden="true"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"
		aria-hidden="true"></script>

	<script>
 	
 	
	!function($) {
	    "use strict";

	    var CalendarApp = function() {
	        this.$body = $("body")
	        this.$calendar = $('#calendar'),
	        this.$event = ('#calendar-events div.calendar-events'),
	        this.$categoryForm = $('#add-new-event form'),
	        this.$extEvents = $('#calendar-events'),
	        this.$modal = $('#my-event'),
	        //this.$modal = $('#my-event2'),
	        this.$saveCategoryBtn = $('.save-category'),
	        this.$calendarObj = null
	    };
	    

	    /* on drop */
	    CalendarApp.prototype.onDrop = function (eventObj, date) { 
	        var $this = this;
	            // retrieve the dropped element's stored Event Object
	            var originalEventObject = eventObj.data('eventObject');
	            var $categoryClass = eventObj.attr('data-class');
	            // we need to copy it, so that multiple events don't have a reference to the same object
	            var copiedEventObject = $.extend({}, originalEventObject);
	            // assign it the date that was reported
	            copiedEventObject.start = date;
	            if ($categoryClass)
	                copiedEventObject['className'] = [$categoryClass];
	            // render the event on the calendar
	            $this.$calendar.fullCalendar('renderEvent', copiedEventObject, true);
	            // is the "remove after drop" checkbox checked?
	            if ($('#drop-remove').is(':checked')) {
	                // if so, remove the element from the "Draggable Events" list
	                eventObj.remove();
	            }
	    },
	    /* on click on event */
	   /* on click on event */
                     CalendarApp.prototype.onEventClick = function(
                           calEvent, jsEvent, view) {
						console.log(calEvent);
                        console.log($('input[name=calcate_no]').val());
                         var $this = this;
                        var today = new Date($.now());
                        if (calEvent.end == null) {
                           calEvent.end = today;
                        }
                        var startdate = moment(calEvent.start,
                              'YYYY-MM-DD  HH:mm');
                        var enddate = moment(calEvent.end,
                              'YYYY-MM-DD  HH:mm');
                        //   (startdate+","+enddate+","+calEvent.content+","+calEvent.title); 확인용
                        var form = $("<form></form>");
                        /*  form.append("<div><label>기간 :&nbsp;&nbsp;</label><span>"+startdate.format('YYYY-MM-DD  HH:mm')+" - "+enddate.format('YYYY-MM-DD  HH:mm')+"</span></div>")
                         */
                        form.append("<div><label>제목</label><div><div class='input-group'><input class='form-control' name='title' type='text' value='" + calEvent.title + "' /> </div></br>");
                        form.append("<div><label>내용</label><div><div><textarea class='form-control' name='content' row='3' type='text'>"
                                    + calEvent.content
                                    + "</textarea>");
                        form.append("<div><label>색상</label><div>");
                        var select=$("<select class='form-control' id='cal_color' name='cal_color'>");
                        select.append("<option value='bg-danger'>빨강</option>");
                        select.append("<option value='bg-success'>초록</option>");
                        select.append("<option value='bg-purple'>보라</option>");
                        select.append("<option value='bg-info'>파랑</option>");
                        select.append("<option value='bg-warning'>노랑</option>");
                        form.append(select);
                        form.append("<div><label>분류</label><div>");
                        var select2=$("<select class='form-control' id='cal_type' name='cal_type'>"); 
                        select2.append("<option value='개인'>개인</option>");
                        select2.append("<option value='부서'>부서</option>");
                        select2.append("<option value='회사'>회사</option>");
                        form.append(select2);
                        form.find('#cal_color').val(calEvent.className);
                        form.find('#cal_type').val(calEvent.type);
                        form.append("<div><label>날짜</label><div><div class='input-group mb-5' style='float:both;'><input type='text' name='datetime' class='form-control datetime/><div class='input-group-append'><span class='input-group-text'><span class='ti-calendar'></span></span></div>");
                        form.append("<input type='hidden' id='cal_beginDate2' name='cal_beginDate2' value='"+ $.fullCalendar
                                 .formatDate(calEvent.start,'YYYY-MM-DD HH:mm:ss.SSSSSSSSS')+ "'/><input type='hidden' id='cal_endDate2' name='cal_endDate2' value='"
                                 + $.fullCalendar.formatDate(calEvent.end,'YYYY-MM-DD HH:mm:ss.SSSSSSSSS')+ "'/>");
                        form.find('input[name=datetime]').daterangepicker({
                                       timePicker : true,
                                       timePickerIncrement : 30,
                                       startDate : calEvent.start, // default주기
                                       endDate : calEvent.end,
                                       locale : {
                                          format : 'YY/MM/DD HH:mm'
                                       }
                                    },
                                    function(start, end) {
                                       (form.find("input[name=cal_beginDate2]"))
                                             .val(start.format('YYYY-MM-DD HH:mm:ss.SSSSSSSSS'));
                                       (form.find("input[name=cal_endDate2]"))
                                             .val(end.format('YYYY-MM-DD HH:mm:ss.SSSSSSSSS'));
                                       // $('#cal_endDate2').val(end.format('YYYY-MM-DD HH:mm:ss'));
                                    
                                    });
                        $this.$modal.modal({
                           backdrop : 'static'
                        });
                        $this.$modal.find('.delete-event').show().end().find('.save-event').show().end()
                              .find('.modal-body').empty().prepend(form).end().find('.delete-event').unbind('click')
                              .click(function() {
                            	  var auth='${sessionScope.authority.auth_cal}';
                                  
                            	  if((auth=='N' && calEvent.type=='회사')){

                            		  alert("권한이 없습니다.");
                            	  }else{
                            		  $this.$calendarObj.fullCalendar('removeEvents',function(ev) {
                                          // cal_no받은것 input에넣기
                                          console.log(calEvent);
                                          console.log(calEvent.id); // 삭제할 id찾기
                                          console.log(calEvent);
                                          var result = (ev.id == calEvent.id);
                                          $.ajax({
                                                   url : "${pageContext.request.contextPath}/calendar/deleteCalendar.do",
                                                   data : {cal_no : calEvent.id},
                                                   dataType : "json",
                                                   async : false,
                                                   success : function(data) {
                                                   },
                                                   error : function(data) {
                                                      result = false;
                                                   }
                                                });
                                          return result;
                                       });
                           $this.$modal.modal('hide'); 
                            	  }
                                    });
                        var result;
                        // 일정 칸 클릭시 해당 일정 내용 수정
                        $this.$modal.find('.save-event').unbind('click').click(function() {
                        	var auth='${sessionScope.authority.auth_cal}';
                       	 var type2=form.find("select[name=cal_type]").val();
                            console.log(calEvent.cal_color);
                            console.log(calEvent.cal_type);
                            console.log(calEvent.start);
                            console.log(calEvent.end);
                            if((auth=='N' && type2=='회사') ||(auth=='N' && calEvent.type=='회사')){

                      		  alert("권한이 없습니다.");
                      	  }else{    
                                      //$this.$modal.on('submit', function () {
                                       
                       	 calEvent.end = form.find("input[name=cal_endDate2]").val();
                            calEvent.content = form.find("textarea[type=text]").val();
                            calEvent.cal_color=form.find("select[name=cal_color]").val();
                            calEvent.cal_type=form.find("select[name=cal_type]").val(); 
                            calEvent.title = form.find("input[name=title]").val();
                            calEvent.start = form.find("input[name=cal_beginDate2]").val();
                            
                                       if(calEvent.start==calEvent.end){ 
                                          alert("시간은 30분이상 차이나야 합니다.");
                                       }else{
                                          
                                          $this.$calendarObj.fullCalendar('updateEvent',calEvent);
                                          $this.$modal.modal('hide');
                                       $.ajax({
                                                url : "${pageContext.request.contextPath}/calendar/updateCalendar2.do",
                                                data : {
                                                   cal_no : calEvent.id,
                                                   cal_name : calEvent.title,
                                                   cal_content : calEvent.content,
                                                   cal_beginDate : calEvent.start,
                                                   cal_endDate : calEvent.end,
                                                   cal_color:calEvent.cal_color,
                                                   cal_type:calEvent.cal_type
                                                },
                                                type : "post",
                                                dataType : "json",
                                                async : false,
                                                success : function(data) {

                                                    location.href="${pageContext.request.contextPath}/commonProcessing.do";
                                                },
                                                error : function(data) {
                                                   result = true;
                                                }
                                             });
                                       
                                       return result;
                                       }
                                       }
                                    });
                     },
                     /* on select */
                     CalendarApp.prototype.onSelect = function(start,
                           end, allDay) {
                        var $this = this;
                        console.log(start);
                        console.log(end);
                     /*      $this.$modal2.modal({
                                  backdrop: 'static'
                              });
                              var form2 = $("<form action='${pageContext.request.contextPath}/calendar/insertCalendar.do' method='post'></form>"); 
                            
                        form2.append("<div><label>제목</label><div><div class='input-group'><input class='form-control' id= 'cal_name' name='cal_name' type='text'/> </div></br>");
                        form2.append("<div><label>내용</label><div><div><textarea class='form-control' id='cal_content' name='cal_content' row='3' type='text'></textarea>");
                        form2.append("<div><label>색상</label><div>");
                        var select=$("<select class='form-control' id='cal_color' name='cal_color'>");
                        select.append("<option value='bg-danger'>빨강</option>");
                        select.append("<option value='bg-success'>초록</option>");
                        select.append("<option value='bg-purple'>보라</option>");
                        select.append("<option value='bg-info'>파랑</option>");
                        select.append("<option value='bg-warning'>노랑</option>");
                        form2.append(select);
                        form2.append("<div><label>분류</label><div>");
                        var select2=$("<select class='form-control' id='cal_type' name='cal_type'>"); 
                        select2.append("<option value='개인'>개인</option>");
                        select2.append("<option value='부서'>부서</option>");
                        select2.append("<c:if test='${sessionScope.authority.auth_cal eq "Y"}'>");
                        select2.append("<option value='회사'>회사</option>");
                        select2.append("</c:if>");
                        form2.append(select2);
                        form2.append("<div><label>날짜</label><div><div class='input-group mb-5' style='float:both;'><input type='text' name='datetime' id='date2' class='form-control datetime/><div class='input-group-append'><span class='input-group-text'><span class='ti-calendar'></span></span></div>");
                        form2.append("<input type='hidden' id='cal_beginDate' name='cal_beginDate'/><input type='hidden' id='cal_endDate' name='cal_endDate'/>");

                        form2.find('input[name=datetime]').daterangepicker({
                                       timePicker : true,
                                       timePickerIncrement : 30, 
                                       locale : {
                                          format : 'YY/MM/DD HH:mm'
                                       },
                                       startDate :start,
                                       endDate:end
                                    },
                                    function(start, end) {
                                    
                                    });
                        

                         (form2.find('input[id=date2]')).val(start.format('YYYY/MM/DD HH:mm') + " - "+end.format('YYYY/MM/DD HH:mm') );
                        (form2.find("input[name=cal_beginDate]"))
                              .val(start.format('YYYY-MM-DD HH:mm:ss.SSSSSSSSS'));
                        (form2.find("input[name=cal_endDate]"))
                              .val(end.format('YYYY-MM-DD HH:mm:ss.SSSSSSSSS'));
                        // $('#cal_endDate2').val(end.format('YYYY-MM-DD HH:mm:ss')); 
                        console.log(form2.find("input[name=cal_beginDate]")
                        .val());
                        console.log(form2.find("select[name=cal_color]")
                              .val());
                        console.log(form2.find("select[name=cal_type]")
                              .val());
                         console.log((form2.find("input[name=cal_beginDate]")).val());
                              $this.$modal2.find('.save-event').show().end().find('.modal-body').empty().prepend(form2).end().find('.save-event').unbind('click').click(function () {
                             
                                 form2.submit();
                                  
                              });
                              $this.$modal2.find('form2').on('submit', function () {
                                 
                                  return false;
                                  
                              });
                         */
                        $this.$calendarObj.fullCalendar('unselect');
                     },
	    CalendarApp.prototype.enableDrag = function() {
	        //init events
	        $(this.$event).each(function () {
	            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
	            // it doesn't need to have a start or end
	            var eventObject = {
	                title: $.trim($(this).text()) // use the element's text as the event title
	            };
	            // store the Event Object in the DOM element so we can get to it later
	            $(this).data('eventObject', eventObject);
	            // make the event draggable using jQuery UI
	            $(this).draggable({
	                zIndex: 999,
	                revert: true,      // will cause the event to go back to its
	                revertDuration: 0  //  original position after the drag
	            });
	        });
	    }
	    
	    
	 
	    
	    /* Initializing */
	    CalendarApp.prototype.init = function() {
	        this.enableDrag();
	        /*  Initialize the calendar  */
	        var date = new Date();
	        var d = date.getDate();
	        var m = date.getMonth();
	        var y = date.getFullYear();
	        var form = '';
	        var today = new Date($.now());

	         
	        var defaultEvents = [];
	           
	           // 일정 받아오기
	           <c:forEach items="${list}" var="calendar">
	         
	            
	            // db넣은것 출력
	              defaultEvents.push({
	              content :  '${calendar.cal_content}',   // 일정 내용
	              title   :  '${calendar.cal_name}',   // 일정 제목
	               start   :  '${calendar.cal_beginDate}',   // 시작일
	               end      :  '${calendar.cal_endDate}',   // 종료일
	               className : '${calendar.cal_color}',   // 색상변경(탬플릿적용 색)
	               id:'${calendar.cal_no}',  // id값 넣어야 삭제가능...ㅠ
	               type:'${calendar.cal_type}'
	               
	               
	           })
	           </c:forEach>

	        var $this = this;
	        
	        
	        $this.$calendarObj = $this.$calendar.fullCalendar({
	            slotDuration: '00:15:00', /* If we want to split day time each 15minutes */
	            minTime: '08:00:00',
	            maxTime: '19:00:00',  
	            defaultView: 'month',  
	            handleWindowResize: true,   
	             
	            header: {
	                left: 'prev,next today',
	                center: 'title',
	                right: 'month,agendaWeek,agendaDay,listWeek'
	            },
	            titleFormat: 'YYYY년   M월',
	            events: defaultEvents,	//이벤트 불러오기
	            editable: true,
	            droppable: true, // this allows things to be dropped onto the calendar !!!
	            eventLimit: true, // allow "more" link when too many events
	            selectable: true,
	            drop: function(date) { $this.onDrop($(this), date); },
	            select: function (start, end, allDay) { $this.onSelect(start, end, allDay); },
	            eventClick: function(calEvent, jsEvent, view) { $this.onEventClick(calEvent, jsEvent, view); },
	            eventDrop : function(event, delta, revertFun){ 
	                   
	                  var id= event.id;   //해당  일정의 cal_no 넘버값 찾기
	                    var start= $.fullCalendar.formatDate(event.start, "YYYY-MM-DD HH:mm:ss.SSSSSSSSS");   //옮겨진 시작날
	                    var end =$.fullCalendar.formatDate(event.end, "YYYY-MM-DD HH:mm:ss.SSSSSSSSS");   //옮겨진 마지막날
	                
	                 
	              // 일정 드래그시 날짜수정
	                $.ajax({
	                    url: "${pageContext.request.contextPath}/calendar/updateCalendar.do",
	                    dataType : "json",
	                    data:{cal_no:event.id, cal_begindate:start, cal_enddate:end},
	                     
	                    success:function(){
	                       //alert("succes drag");
	                    },error:function(){ 
	                       // alert("error drag !!!!");
	                    }
	                });
	                   
	               }
	           
	        });

	       
	    },

	   //init CalendarApp
	    $.CalendarApp = new CalendarApp, $.CalendarApp.Constructor = CalendarApp
	    
	}(window.jQuery),

	//initializing CalendarApp
	function($) {
	    "use strict";
	    $.CalendarApp.init()
	}(window.jQuery);

	
	// todo : 완료로 바꾸기
	$(".todoCk").on("click", function(){
		var todo_no = $(this).attr("id");
		var todo_checked =$(this).prop('checked');
		console.log(todo_checked);
			
		$.ajax({
			url  : "${pageContext.request.contextPath}/todo/finishtodohome.do",
					data:{todo_no : todo_no , todo_checked : todo_checked},
		 dataType: "json",
         type : "get",
         success : function(data){
         	 $('.todoCk').next().eq(todo_no).toggleClass('task-done');
        	 
         }, error : function(jqxhr, textStatus, errorThrown){
        	 alert("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
         }
         
         
		});
			
	});

	// todo 내용 입력해야 넘어감
		function convalidate() {
			var boardContent = $(".writtencontent").val();
			
			if (boardContent == "") {
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ   내용을 입력하세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}
			return true;
		}
		
		function go(num){
			
			
			var checkVal = $("input:radio[name=radio]:checked").val();
			
			if(checkVal == null){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  답변이 선택되지 않았습니다.",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}
			if(num==1)
				location.href="${pageContext.request.contextPath}/survey/surveyInsertApply.do?emp_no="+$('#emp_no').val()+"&survey_no="+$('#survey_no').val()+"&surveyyan_no="+checkVal
			else
				location.href="${pageContext.request.contextPath}/survey/surveyUpdateApply.do?emp_no="+$('#emp_no').val()+"&survey_no="+$('#survey_no').val()+"&surveyyan_no="+checkVal
		}
	
	
 	</script>


</body>

</html>
