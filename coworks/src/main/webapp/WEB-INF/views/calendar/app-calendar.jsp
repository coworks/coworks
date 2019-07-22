<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 일정 관리</title>
   <!-- Calendar CSS -->
    <link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.css" rel="stylesheet" />
     
    <link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
    <!-- Color picker plugins css -->
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
                        <h3 class="text-themecolor mb-0 mt-0">일정관리</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Calendar</li>
                        </ol>
                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                         <button class="btn btn-success float-right" id="individual">개인</button>  
                         <button class="btn btn-info float-right" id="department">부서</button>  
                         <button class="btn btn-danger float-right" id="company">회사</button> 
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12 col-lg-3">
                       <!--  <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Drag and Drop Your Event</h4>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div id="calendar-events" class="mt-3">
                                            <div class="calendar-events" data-class="bg-info"><i class="fa fa-circle mb-3 text-info"></i> My Event One</div>
                                            <div class="calendar-events" data-class="bg-success"><i class="fa fa-circle mb-3 text-success"></i> My Event Two</div>
                                            <div class="calendar-events" data-class="bg-danger"><i class="fa fa-circle mb-3 text-danger"></i> My Event Three</div>
                                            <div class="calendar-events" data-class="bg-warning"><i class="fa fa-circle mb-3 text-warning"></i> My Event Four</div>
                                        </div> 
                                        <div class="checkbox mb-3">
                                            <input id="drop-remove" type="checkbox">
                                            <label for="drop-remove">
                                                Remove after drop
                                            </label>
                                        </div>
                                        <a href="#" data-toggle="modal" data-target="#add-new-event" class="btn btn-danger btn-block waves-effect waves-light">
                                            <i class="ti-plus"></i> Add New Event
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>   -->
                         <div class="card">
                            <div class="card-body">
                            <form name="insertCalendar" action="${pageContext.request.contextPath}/calendar/insertCalendar.do" method="post">
			
                                <h4 class="card-title">일정 추가</h4>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class='col-md-12'>
	                 						<div class='form-group'>
	                 							<label class='control-label'>일정 명</label>
	                 							<input class='form-control' placeholder='Insert Event Name' type='text' id="cal_name" name="cal_name"/>
	                 							
	                 						</div>
	                 					</div> <div class='col-md-12'>
	                 						<div class='form-group'>
	                 							<label class='control-label'>일정 내용</label>
	                 							<textarea class='form-control' row="3"type='text' id="cal_content" name="cal_content" ></textarea>
	                 						
	                 						</div>
	                 					</div> 
	                 						 
						                 <div class='col-md-12'>
						                 	<div class='form-group' >
						                 		<label class='control-label'>색상</label>
						                 		<select class='form-control' id="category" name='category' onchange="changeCategory();">
						                 			 <option value='bg-danger'>빨강</option> 
									                 <option value='bg-success'>초록</option> 
									                 <option value='bg-purple'>보라</option>  
									                 <option value='bg-info'>파랑</option> 
									                 <option value='bg-warning'>노랑</option>
						                 		<input type="hidden" id="cal_color" name="cal_color" value="bg-danger"/>
						                 		</select>
						                 	</div>
						                 </div>
										 <div class='col-md-12'>
						                 	<div class='form-group' >
						                 		<label class='control-label'>분류</label>
						                 		<select class='form-control' id= "category2" name='category2'  onchange="changeCategory2();">
						                 			 <option value='개인'>개인</option> 
									                 <option value='부서'>부서</option> 
									                 <option value='회사'>회사</option>   
						                 		</select>
						                 		<input type="hidden" id="cal_type" name="cal_type" value="개인"/>
						                 	</div>
						                 </div>
										
	                 					<div class='input-group mb-3' style="float:both;">  
	                 						<input type='text' class='form-control datetime' />
			                 					<div class='input-group-append'>
				                 					<span class='input-group-text'>
				                 						<span class='ti-calendar'></span>
				                 					</span>
			                 					</div>
	                 					</div> 
	                 					<script>
	                 					function changeCategory(){ 
	                 						console.log($("#category").find(":selected").val()); 
	                 						 
	                 						var calcolor=$('#category option:selected').val();
	                 						$('#cal_color').val(calcolor);
	                 					};
	                 					
	                 					function changeCategory2(){
	                 						console.log($("#category2").find(":selected").val());  
	                 						 
	                 						var caltype=$('#category2 option:selected').val();
	                 						$('#cal_type').val(caltype);
	                 					};
	                 					</script>
		       					          
	                					<input id="cal_beginDate" name="cal_beginDate" type="text"/> 
	                					<input id="cal_endDate" name="cal_endDate" type="text"/>
                                        
                                        <button type="submit" class="btn btn-danger btn-block waves-effect waves-light">
                                             		 추가
                                        </button>
                                    </div>
                                </div>
                            </div>
                       
                     
                		</div>
                    </div>
                    <div class="col-md-12 col-lg-9">
                        <div class="card">
                            <div class="card-body">
                                <div id="calendar"></div>
                            </div>
                        </div>
                    </div>
                    <!-- *********** ---- -->
                    
                      
                       
                    
                    
                </div>
                
                <!-- BEGIN MODAL -->
                <div class="modal none-border" id="my-event">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>일정 수정</strong></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-white waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                <button type="button" class="btn btn-danger delete-event waves-effect waves-light">  Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <!-- Modal Add Category -->
                <div class="modal fade none-border" id="add-new-event">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>Add</strong> a category</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form role="form">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Category Name</label>
                                            <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
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
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <div class="right-sidebar">
                    <div class="slimscrollright">
                        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
                        <div class="r-panel-body">
                            <ul id="themecolors" class="mt-3">
                                <li><b>With Light sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default" class="default-theme">1</a></li>
                                <li><a href="javascript:void(0)" data-theme="green" class="green-theme">2</a></li>
                                <li><a href="javascript:void(0)" data-theme="red" class="red-theme">3</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue" class="blue-theme working">4</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple" class="purple-theme">5</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna" class="megna-theme">6</a></li>
                                <li class="d-block mt-4"><b>With Dark sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default-dark" class="default-dark-theme">7</a></li>
                                <li><a href="javascript:void(0)" data-theme="green-dark" class="green-dark-theme">8</a></li>
                                <li><a href="javascript:void(0)" data-theme="red-dark" class="red-dark-theme">9</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue-dark" class="blue-dark-theme">10</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple-dark" class="purple-dark-theme">11</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna-dark" class="megna-dark-theme ">12</a></li>
                            </ul>
                            <ul class="mt-3 chatonline">
                                <li><b>Chat option</b></li>
                                <li>
                                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/resources/template/assets/images/users/1.jpg" alt="user-img" class="img-circle"> <span>Varun Dhavan <small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/resources/template/assets/images/users/2.jpg" alt="user-img" class="img-circle"> <span>Genelia Deshmukh <small class="text-warning">Away</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/resources/template/assets/images/users/3.jpg" alt="user-img" class="img-circle"> <span>Ritesh Deshmukh <small class="text-danger">Busy</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/resources/template/assets/images/users/4.jpg" alt="user-img" class="img-circle"> <span>Arijit Sinh <small class="text-muted">Offline</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/resources/template/assets/images/users/5.jpg" alt="user-img" class="img-circle"> <span>Govinda Star <small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/resources/template/assets/images/users/6.jpg" alt="user-img" class="img-circle"> <span>John Abraham<small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/resources/template/assets/images/users/7.jpg" alt="user-img" class="img-circle"> <span>Hritik Roshan<small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/resources/templates/assets/images/users/8.jpg" alt="user-img" class="img-circle"> <span>Pwandeep rajan <small class="text-success">online</small></span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
             
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
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
      <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/jquery-ui.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
      <!--stickey kit -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/template/js/custom.min.js"></script>
    <!-- Calendar JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/jquery-ui.min.js"></script>
<!-- Calendar JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script>
	<script
		src='${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.min.js'></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/jquery.fullcalendar.js"></script>
 <script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.print.min.js"></script>
  

    <!-- ============================================================== -->
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
	            form.append("");
	            form.append("<div><label>기간 :&nbsp;&nbsp;</label><span>"+startdate.format('YYYY-MM-DD  HH:mm')+" - "+enddate.format('YYYY-MM-DD  HH:mm')+"</span></div>")
	            form.append("<div class='input-group'><input class='form-control' type=text value='" + calEvent.title + "' /><span class='input-group-btn'><button type='submit' class='btn btn-success waves-effect waves-light'><i class='fa fa-check'></i> Save</button></span></div></br>");
	            form.append("<div><textarea class='form-control' row='3' type='text'>"+ calEvent.content+"</textarea>");
	            form.append("<div>");
	            $this.$modal.modal({
	                backdrop: 'static'
	            });
	            $this.$modal.find('.delete-event').show().end().find('.save-event').hide().end().find('.modal-body').empty().prepend(form).end().find('.delete-event').unbind('click').click(function () {
	            	
	            	$this.$calendarObj.fullCalendar('removeEvents', function (ev) {
	                	// cal_no받은것 input에넣기
	                		console.log(calEvent);
	                			console.log(calEvent._id);	// 삭제할 _id찾기
	                	console.log(calEvent);	
	                		var result=(ev._id == calEvent._id);
	                	 $.ajax({
	     					
	     					url : "${pageContext.request.contextPath}/calendar/deleteCalendar.do",
	     					data : {cal_no : calEvent._id},
	     					dataType : "json",
	     					async:false,
	     					success : function(data){
	     						 
	     					},error: function(data){
	     						result=false;
	     					}
	     					
	     					
	 				});  
	                	 return result;
	                });
 	                $this.$modal.modal('hide');
	            });
	            $this.$modal.find('form').on('submit', function () {
	                calEvent.title = form.find("input[type=text]").val();
	                $this.$calendarObj.fullCalendar('updateEvent', calEvent);
	                $this.$modal.modal('hide');
	                return false;
	            });
	    },
	    
	    
	    /* on select */
	    
	    CalendarApp.prototype.onSelect = function (start, end, allDay) {
	        var $this = this;
	        
	        /*
	        // 일정 칸 클릭시 아무것도없으면 안나타나게하기
	            $this.$modal.modal({
	                backdrop: 'static'	
	            }); 
	        
	         칸 클릭시 일정추가 modal
	            var form = $("<form></form>");
	            form.append("<div class='row'></div>");
	            form.find(".row")
	                .append("<div class='col-md-6'><div class='form-group'><label class='control-label'>일정 명</label><input class='form-control' placeholder='Insert Event Name' type='text' name='title'/></div></div>")
	                .append("<div class='col-md-6'><div class='form-group'><label class='control-label'>색상</label><select class='form-control' name='category'></select></div></div>")
	                .append("<div class='input-group mb-3'><input type='text' class='form-control datetime' /><div class='input-group-append'><span class='input-group-text'><span class='ti-calendar'></span></span></div></div>")
	                .find("select[name='category']")
	                .append("<option value='bg-danger'>빨강</option>")
	                .append("<option value='bg-success'>초록</option>")
	                .append("<option value='bg-purple'>보라</option>") 
	                .append("<option value='bg-info'>파랑</option>")
	                .append("<option value='bg-warning'>노랑</option></div></div>") 
	                .append("<div class='col-md-6'><div class='form-group'><label class='control-label'>시작</label><input name='startDate' type='date' class='form-control'/></div></div>")
	                .append("<div class='col-md-6'><div class='form-group'><label class='control-label'>종료</label><input name='endDate' type='date' class='form-control'/></div></div>")
	                
	                 $this.$modal.find('.delete-event').hide().end().find('.save-event').show().end().find('.modal-body').empty().prepend(form).end().find('.save-event').unbind('click').click(function () {
	                form.submit();
	            });
	            
	                 $this.$modal.find('.delete-event').hide().end().find('.save-event').show().end().find('.modal-body').empty().prepend(form).end().find('.save-event').unbind('click').click(function () {
	                form.submit();
	            });
	            
	         */ 
	         /*
	            // ** render--> 만들기
	            $this.$modal.find('form').on('submit', function () {
	                var title = form.find("input[name='title']").val();
	                var beginning = form.find("input[name='beginning']").val();	//아직 없음
	                var ending = form.find("input[name='ending']").val();//아직 없음
	                var categoryClass = form.find("select[name='category'] option:checked").val();
	                if (title !== null && title.length != 0) {
	                    $this.$calendarObj.fullCalendar('renderEvent', {
	                        title: title,
	                        start:start,
	                        end: end,
	                        allDay: false,
	                        className: categoryClass	
	                    }, true);  
	                    $this.$modal.modal('hide');
	                }
	                else{
	                    alert('일정 명을 입력하세요');
	                }
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
	            
	            	
	            $(this).draggable({	
	                zIndex: 999,
	                revert: true,      // will cause the event to go back to its
	                revertDuration: 0  //  original position after the drag
	                
	                // ajax update 날짜
	            });
	        });
	    }
	    
	    
	 
	    
	    /* Initializing */
	    CalendarApp.prototype.init= function() {
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
	     		content :  '${calendar.cal_content}',	// 일정 내용
	        	title   :  '${calendar.cal_name}',	// 일정 제목
	            start   :  '${calendar.cal_beginDate}',	// 시작일
	            end		:  '${calendar.cal_endDate}',	// 종료일
	            className : '${calendar.cal_color}',	// 색상변경(탬플릿적용 색)
	            _id:'${calendar.cal_no}'	// id값 넣어야 삭제가능...ㅠ
	        })
	    	</c:forEach>
	        
	 
	        var $this = this;
	        
	        
	        $this.$calendarObj = $this.$calendar.fullCalendar({
	            slotDuration: '00:30:00', /* If we want to split day time each 15minutes */
	            minTime: '06:00:00',
	            maxTime: '24:30:00',  
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
	
	
	 $('.datetime').daterangepicker({
         timePicker: true,
         timePickerIncrement: 30,
         locale: {
             format: 'MM/DD/YYYY h:mm A'
         }
     }, 
     function(start, end) {
      console.log("Callback has been called!");
      $('#cal_beginDate').val(start.format('YYYY-MM-DD HH:mm:ss'));
      $('#cal_endDate').val(end.format('YYYY-MM-DD HH:mm:ss'));
      console.log(start.format('yyyy-mm-dd hh:mm:ss')) + ' - ' + end.format(end.format('YY-MM-DD HH:mm:ss.S'));
      startDate = start;
      endDate = end;  
     }
	 );
	
	</script>	
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	 
</body>
</html>