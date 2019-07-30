<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : Insert title here</title>

<!-- Calendar CSS -->
<link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColorPicker-master/dist/css/asColorPicker.css" rel="stylesheet">
    <!-- Date picker plugins css -->
    <link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker plugins css -->
    <link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet">
   
<c:import url="../common/header.jsp" />


</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				
				<div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">교육 일정</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Education</li>
                        </ol>
                    </div>
                </div>
				
				
				
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
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	
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
	    

	    
	    /* on click on event */
	    CalendarApp.prototype.onEventClick =  function (calEvent, jsEvent, view) {
	    	 var $this = this;  
	    	 var now = new Date();   
 			 
			var start=new Date(calEvent.start);
			var end=new Date(calEvent.end);  
			
			if((now.getTime()>=start.getTime() && now.getTime()<=end.getTime())
					&& calEvent.limitCnt-calEvent.curCnt>0){
				location.href="${pageContext.request.contextPath}/education/eduDetail.do?edu_no="+calEvent.no; 
	              
			}else{
				alert("신청 인원이 마감되었습니다.");
			}
			 
		
	             
	              
	    },
	    /* on select */
	    CalendarApp.prototype.onSelect = function (start, end, allDay) {
           var $this = this;
           
               $this.$calendarObj.fullCalendar('unselect');
        
	    },
	    CalendarApp.prototype.enableDrag = function() {
	        //init events
	        $(this.$event).each(function () {
	        	console.log(this.$event);
	            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
	            // it doesn't need to have a start or end
	            var eventObject = {
	                title: $.trim($(this).text()) // use the element's text as the event title
	            };
	            // store the Event Object in the DOM element so we can get to it later
	            $(this).data('eventObject', eventObject);
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
	              no:'${edu.edu_no}',
	              title   :  '${edu.edu_title}', 
	              limitCnt :  '${edu.edu_limitCnt}',   // 일정 내용
	              curCnt: '${edu.edu_curCnt}',
	              eduDate:'${edu.edu_eduDate}',
	               start   :  '${edu.edu_applyBgDate}',   // 시작일
	               end   :  '${edu.edu_applyEndDate}',
	               state   :  '${edu.edu_applyState}', 
	               className : '${edu.edu_color}',   // 색상변경(탬플릿적용 색)
	               edu_image:'${edu.edu_image}' 
	               
	               
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
	                right: 'month'
	            },
	            events: defaultEvents,	//이벤트 불러오기
	            editable: true,
	            droppable: true, // this allows things to be dropped onto the calendar !!!
	            eventLimit: true, // allow "more" link when too many events
	            selectable: true,
	            drop: function(date) { $this.onDrop($(this), date); },
	            select: function (start, end, allDay) { $this.onSelect(start, end, allDay); },
	            eventClick: function(calEvent, jsEvent, view) { $this.onEventClick(calEvent, jsEvent, view); } 
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
	
</body>
</html>