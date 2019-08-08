<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html> 
<head>

<meta charset="UTF-8">
<title>CO-WORKS : 교육일정</title>

<!-- Calendar CSS -->
<link
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.css?ver=1"
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

<c:import url="../common/header.jsp" />

<style>
.fc-event-container :hover {
	cursor: pointer;
}
</style>
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<h3 class="text-themecolor mb-0 mt-0">COWORKS</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span> 교육</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									일정 / 신청</span></li>
						</ol>
					</div>
				</div>



				<div class="card">
					<div class="card-body">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div id="calendar-events" class="mt-3">
								<span class="calendar-events" data-class="bg-info"><i
									class="fa fa-circle mb-3 text-info"></i>&nbsp;접수 예정</span>&nbsp; <span
									class="calendar-events" data-class="bg-success"><i
									class="fa fa-circle mb-3 text-success"></i>&nbsp;&nbsp;접수 진행중</span>&nbsp;
								<span class="calendar-events" data-class="bg-warning"><i
									class="fa fa-circle mb-3 text-warning"></i>&nbsp;&nbsp;마감 임박</span>
								&nbsp; <span class="calendar-events" data-class="bg-danger"><i
									class="fa fa-circle mb-3 text-danger"></i>&nbsp;&nbsp;마감 </span>
							</div>
							<div id="calendar"></div>


							<!-- BEGIN MODAL -->
							<div class="modal none-border" id="my-event">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">
												<strong>교육 일정</strong>
											</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body"></div>
										<div class="modal-footer">
											<button type="button" class="btn btn-white waves-effect"
												data-dismiss="modal">Close</button>
											<button type="button"
												class='btn btn-success go-event waves-effect waves-light'>
												<i class='fa fa-check'></i> 신청
											</button>
											<button type="button"
												class="btn btn-danger detail-event waves-effect waves-light">
												상세보기</button>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>




				</div>
				<c:import url="../common/footer.jsp" />
			</div>
		</div>
		<c:import url="../common/bottomJquery.jsp" />

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
		<!-- 한글화 -->
		<script
			src="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/lang-all.js"></script>

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
									this.$saveCategoryBtn = $('.save-category'),
									this.$calendarObj = null
						};

								/* on click on event */
								CalendarApp.prototype.onEventClick = function(
										calEvent, jsEvent, view) {
									/*var begin2 = $.fullCalendar.formatDate(calEvent.bgDate, "yyyy-MM-dd HH:mm:ss");
									var end2 = $.fullCalendar.formatDate(calEvent.endDate, "yyyy-MM-dd HH:mm:ss");
									console.log(calEvent.bgDate());*/
									var begin = moment(calEvent.bgDate).format(
											'YYYY/MM/DD HH:mm');
									var end = moment(calEvent.endDate).format(
											'YYYY/MM/DD HH:mm');
									console.log(calEvent);
									var $this = this;
									var today = new Date($.now());
									if (calEvent.end == null) {
										calEvent.end = today;
									}

									console.log(calEvent.start);
									console.log(calEvent.endDate);
									var form = $("<form></form>");

									form
											.append("<div><label>교육명</label><div> <div class='input-group'><span class='form-control' name='title' type='text'>"
													+ calEvent.title
													+ "</span> </div></br>");
									form
											.append("<div><label>강사</label><div> <div class='input-group'><span class='form-control' name='instructor' type='text' >"
													+ calEvent.instructor
													+ "</span> </div></br>");
									form
											.append("<div><label>교육일시</label><div> <div class='input-group'><span class='form-control' name='edudate' type='text'>"
													+ $.fullCalendar
															.formatDate(
																	calEvent.start,
																	'YYYY년 MM월 DD일 HH시 mm분')
													+ "</span> </div></br>");
									form
											.append("<div><label>신청가능일</label><div> <div class='input-group'><span class='form-control' name='bgDate' type='text'>"
													+ begin
													+ " ~ "
													+ end
													+ "</span> </div></br>");
									form
											.append("<input type='hidden' name='edu_count' value='"+calEvent.emp_no+"'/>");
									form
											.append("<input type='hidden' name='edu_no' value='"+calEvent.no+"'/>");

									$this.$modal.modal({
										backdrop : 'static'
									});

									$this.$modal
											.find('.detail-event')
											.show()
											.end()
											.find('.go-event')
											.show()
											.end()
											.find('.modal-body')
											.empty()
											.prepend(form)
											.end()
											.find('.detail-event')
											.unbind('click')
											.click(
													function() {

														location.href = "${pageContext.request.contextPath}/education/eduDetail.do?edu_no="
																+ calEvent.no;

													});

									var result;
									// 일정 칸 클릭시 해당 일정 내용 수정
									$this.$modal
											.find('.go-event')
											.unbind('click')
											.click(
													function() {
														var edu_count = (form
																.find("input[name=edu_count]"))
																.val();
														var no = (form
																.find("input[name=edu_no]"))
																.val();
														console.log(edu_count);
														console.log(no);

														var now = new Date();
														var begin = new Date(
																(calEvent.bgDate));
														var end = new Date(
																(calEvent.endDate));
														console.log(begin
																.getTime());
														//$this.$modal.on('submit', function () { 

														if (edu_count != 0) {
															console
																	.log(calEvent.limitCnt
																			- calEvent.curCnt);
															alert("이미 신청하셨습니다!");
														} else if (now
																.getTime() >= begin
																.getTime()
																&& now
																		.getTime() <= end
																		.getTime()
																&& calEvent.limitCnt
																		- calEvent.curCnt > 0) {

															$
																	.ajax({
																		url : "${pageContext.request.contextPath}/education/insertEduApply.do",
																		data : {
																			edu_no : no
																		},
																		type : "post",
																		dataType : "json",
																		async : false,
																		success : function(
																				data) {
																			if (data > 0)
																				alert("신청 완료!!");
																			else if (data = 0)
																				alert("마감되었습니다.");
																			else {
																				alert()
																			}

																		},
																		error : function(
																				data) {
																			alert("신청 실패");
																		}
																	});
														} else {
															alert("신청할 수 없습니다.");
														}
													});
								},
								/* on select */
								CalendarApp.prototype.onSelect = function(
										start, allDay) {
									var $this = this;

									$this.$calendarObj.fullCalendar('unselect');

								},
								CalendarApp.prototype.enableDrag = function() {
									//init events
									$(this.$event).each(
											function() {
												console.log(this.$event);
												// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
												// it doesn't need to have a start or end
												var eventObject = {
													title : $.trim($(this)
															.text())
												// use the element's text as the event title
												};
												// store the Event Object in the DOM element so we can get to it later
												$(this).data('eventObject',
														eventObject);
												// make the event draggable using jQuery UI

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
							<c:forEach items="${list}" var="edu">

							// db넣은것 출력
							defaultEvents.push({
								no : '${edu.edu_no}',
								title : '${edu.edu_title}',
								instructor : '${edu.edu_instructor}',
								limitCnt : '${edu.edu_limitCnt}', // 일정 내용
								curCnt : '${edu.edu_curCnt}',
								start : '${edu.edu_eduDate}',
								bgDate : '${edu.edu_applyBgDate}', // 시작일
								endDate : '${edu.edu_applyEndDate}',
								state : '${edu.edu_applyState}',
								className : '${edu.edu_color}', // 색상변경(탬플릿적용 색)
								edu_image : '${edu.edu_image}',
								emp_no : '${edu.emp_no}'

							})
							</c:forEach>

							var $this = this;

							$this.$calendarObj = $this.$calendar
									.fullCalendar({
										slotDuration : '00:15:00', /* If we want to split day time each 15minutes */
										minTime : '08:00:00',
										maxTime : '19:00:00',
										defaultView : 'month',
										handleWindowResize : true,

										header : {
											left : 'prev,next today',
											center : 'title',
											right : 'month'
										},
										daysOfWeek : [ "일", "월", "화", "수", "목",
												"금", "토" ],
										monthNames : [ "1월", "2월", "3월", "4월",
												"5월", "6월", "7월", "8월", "9월",
												"10월", "11월", "12월" ],

										titleFormat : 'YYYY년   M월',
										events : defaultEvents, //이벤트 불러오기
										editable : false,
										droppable : true, // this allows things to be dropped onto the calendar !!!
										eventLimit : true, // allow "more" link when too many events
										selectable : true,
										drop : function(date) {
											$this.onDrop($(this), date);
										},
										select : function(start, end, allDay) {
											$this.onSelect(start, end, allDay);
										},
										eventClick : function(calEvent,
												jsEvent, view) {
											$this.onEventClick(calEvent,
													jsEvent, view);
										}
									});

						},

						//init CalendarApp
						$.CalendarApp = new CalendarApp,
								$.CalendarApp.Constructor = CalendarApp

					}(window.jQuery),

					//initializing CalendarApp
					function($) {
						"use strict";
						$.CalendarApp.init()
					}(window.jQuery);
		</script>
</body>

</body>
</html>