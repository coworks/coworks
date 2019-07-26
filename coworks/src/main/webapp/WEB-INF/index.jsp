<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.net.InetAddress, com.kh.coworks.attendance.model.vo.Attendance"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>CO-WORKS</title>
<!-- Calendar CSS -->
<link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColorPicker-master/dist/css/asColorPicker.css" rel="stylesheet">
    <!-- Date picker plugins css -->
    <link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker plugins css -->
    <link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet">
   
   <c:import url="views/common/header.jsp" />
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
									<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
									<h4 class="card-title">
										<c:out value="${today}" />
									</h4>
									<p class="card-text" id="time">
										출근 시간 : ${atten.atten_attTime }	</br>
										IP : ${atten.atten_attIP }				
										
									 
									 </p>
									  
									<button type="button" class="btn waves-effect waves-light btn-block btn-outline-danger">퇴근하기</button>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<div class="m-2 p-2">
									<h4 class="card-title">설문조사</h4>
									<p class="card-text">이 페이지가 마음에 드시나요?!</p>
									<p class="card-text">
										<small class="text-muted">2019-07-01 ~ 2019-07-31</small>
									</p>
									<h5 class="mt-4">
										YES!!<span class="float-right">85%</span>
									</h5>
									<div class="progress ">
										<div class="progress-bar bg-success wow animated progress-animated" style="width: 85%; height: 6px;" role="progressbar">
											<span class="sr-only">60% Complete</span>
										</div>
									</div>
									<h5 class="mt-4">
										No :(<span class="float-right">15%</span>
									</h5>
									<div class="progress ">
										<div class="progress-bar bg-danger wow animated progress-animated" style="width: 15%; height: 6px;" role="progressbar">
											<span class="sr-only">60% Complete</span>
										</div>
									</div>
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
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">
													<strong>일정 상세보기</strong>
												</h4>
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											</div>
											<div class="modal-body"></div>
											<div class="modal-footer">
												<button type="button" class="btn btn-white waves-effect" data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-success save-event waves-effect waves-light">수정</button>
												<button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">삭제</button>
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
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											</div>
											<div class="modal-body">
												<form>
													<div class="row">
														<div class="col-md-6">
															<label class="control-label">Category Name</label> <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
														</div>
														<div class="col-md-6">
															<label class="control-label">Choose Category Color</label>
															<select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
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
												<button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
												<button type="button" class="btn btn-white waves-effect" data-dismiss="modal">Close</button>
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
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script>
	<script src='${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.min.js'></script>
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/jquery.fullcalendar.js"></script>
	 <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
    
     <!-- Date range Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/daterangepicker/daterangepicker.js"></script>
     <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
       
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
	    CalendarApp.prototype.onEventClick =  function (calEvent, jsEvent, view) {
	    	 var $this = this; 
	           var startdate=moment(calEvent.start,'YYYY-MM-DD  HH:mm');
	           var enddate=moment(calEvent.end,'YYYY-MM-DD  HH:mm');
	               var form = $("<form></form>");
	              /*  form.append("<div><label>기간 :&nbsp;&nbsp;</label><span>"+startdate.format('YYYY-MM-DD  HH:mm')+" - "+enddate.format('YYYY-MM-DD  HH:mm')+"</span></div>")
	               */ 
	               form.append("<div><label>제목</label><div><div class='input-group'><input class='form-control' name='title' type='text' value='" + calEvent.title + "' /> </div></br>");
	               form.append("<div><label>내용</label><div><div><textarea class='form-control' name='content' row='3' type='text'>"+ calEvent.content+"</textarea>");
	               form.append("<div><label>날짜</label><div><div class='input-group mb-5' style='float:both;'><input type='text' name='datetime' class='form-control datetime/><div class='input-group-append'><span class='input-group-text'><span class='ti-calendar'></span></span></div>");
	              form.append("<input type='hidden' id='cal_beginDate2' name='cal_beginDate2' value='"+$.fullCalendar.formatDate(calEvent.start, 'YYYY-MM-DD HH:mm:ss.SSSSSSSSS')+"'/><input type='hidden' id='cal_endDate2' name='cal_endDate2' value='"+$.fullCalendar.formatDate(calEvent.end, 'YYYY-MM-DD HH:mm:ss.SSSSSSSSS')+"'/>"); 
	               $this.$modal.modal({
	                   backdrop: 'static'
	               });
	               
	               
	           
	               form.find('input[name=datetime]').daterangepicker({
	                        
	                        timePicker: true,
	                        timePickerIncrement: 30,
	                        startDate: calEvent.start,   // default주기
	                        endDate :calEvent.end,
	                        locale: {
	                            format: 'YY/MM/DD HH:mm'
	                        }
	                    }, 
	                    function(start, end) { 
	                    (form.find("input[name=cal_beginDate2]")).val(start.format('YYYY-MM-DD HH:mm:ss.SSSSSSSSS'));
	                    (form.find("input[name=cal_endDate2]")).val(end.format('YYYY-MM-DD HH:mm:ss.SSSSSSSSS'));
	                    // $('#cal_endDate2').val(end.format('YYYY-MM-DD HH:mm:ss'));
	                     console.log(start.format('YYYY-MM-DD HH:mm:ss')) + ' - ' + end.format(end.format('YYYY-MM-DD HH:mm:ss'));
	                     
	                    }
	                   );
	                  
	               
	            
	               
	               $this.$modal.find('.delete-event').show().end().find('.save-event').show().end().find('.modal-body').empty().prepend(form).end().find('.delete-event').unbind('click').click(function () {
	                  
	                  $this.$calendarObj.fullCalendar('removeEvents', function (ev) {
	                      // cal_no받은것 input에넣기
	                         console.log(calEvent);
	                            console.log(calEvent.id);   // 삭제할 id찾기
	                      console.log(calEvent);   
	                         var result=(ev.id == calEvent.id);
	                       $.ajax({
	                       
	                       url : "${pageContext.request.contextPath}/calendar/deleteCalendar.do",
	                       data : {cal_no : calEvent.id},
	                       dataType : "json",
	                       async:false,
	                       success : function(data){
	                           console.log("삭제??");
	                       },error: function(data){
	                          result=false;
	                       }
	                       
	                       
	                });  
	                       return result;
	                   });
	                    $this.$modal.modal('hide');
	               });
	               
	               var result;
	               // 일정 칸 클릭시 해당 일정 내용 수정
	               $this.$modal.find('.save-event').unbind('click').click(function () {
	               //$this.$modal.on('submit', function () {
	                   calEvent.title = form.find("input[name=title]").val();
	                   calEvent.start = form.find("input[name=cal_beginDate2]").val();
	                   console.log(calEvent.start); 
	                   
	                   calEvent.end = form.find("input[name=cal_endDate2]").val();
	                   calEvent.content = form.find("textarea[type=text]").val();
	                   $this.$calendarObj.fullCalendar('updateEvent', calEvent);
	                   $this.$modal.modal('hide');
	                   
	                   $.ajax({
	                    	url : "${pageContext.request.contextPath}/calendar/updateCalendar2.do",
	                    	data : {cal_no:calEvent.id, cal_name:calEvent.title, cal_content:calEvent.content,
	                          		cal_beginDate:calEvent.start, cal_endDate:calEvent.end},
		                    type:"post",
		                    dataType : "json",
		                    async:false,
		                    success : function(data){
		                       
		                         result=false;
		                         console.log(result);
		                         
		                    },error: function(data){
		                       
		                    
	                       result=true;
	                        console.log(result);
	                    }
	                   
	                   });
	                   
	                   return result;
	               });
	    },
	    /* on select */
	    CalendarApp.prototype.onSelect = function (start, end, allDay) {
           var $this = this;
           
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
	               id:'${calendar.cal_no}'   // id값 넣어야 삭제가능...ㅠ
	               
	               
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
	                right: 'month,agendaWeek,agendaDay'
	            },
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

 	</script>
 
 
 </body>

</html>
