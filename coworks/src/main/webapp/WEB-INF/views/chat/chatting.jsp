<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 채팅하기</title>
<c:import url="../common/header.jsp" />
<link href="${pageContext.request.contextPath }/resources/templates/resources/css/hummingbird-treeview.css" rel="stylesheet" type="text/css">
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">

				<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									메신저</span></li>
						</ol>
					</div>
				</div>


				<div class="col-12">
					<div class="card m-b-0">
						<!-- .chat-row -->
						<div class="chat-main-box">

							<!-- .chat-left-panel -->
							<div class="chat-left-aside">
								<div class="open-panel">
									<i class="ti-angle-right"></i>
								</div>
								<div class="chat-left-inner">
									<div class="form-material">
										<input class="form-control p-3" type="text" placeholder="검색" id="chat-search">
									</div>
									<ul class="chatonline style-none ">
										<li><button class="btn text-info btn-block" data-target="#create-chatroom" data-toggle="modal">
												<i class="fa fa-plus"></i> 채팅방 개설하기
											</button></li>
										<c:if test="${croomList.size() ne 0 }">
											<c:forEach var="chatroom" items="${croomList }">
												<li><a href="${pageContext.request.contextPath}/chat/croom/${chatroom.croom_no}" id="room${chatroom.croom_no }" class="croom" room_title="${chatroom.croom_title }"> <span><b>${chatroom.croom_title } </b>
															<span class='label label-warning chat-Notify' style="display: none; color: white;">New</span>
															<p class="text-muted ml-2 text-overflow chat-content">${chatroom.chat_content }</p> <small class="text-mute text-right"><fmt:formatDate value="${chatroom.chat_sendtime }"
																	pattern="yyyy-MM-dd HH:mm"
																/></small></span></a></li>
											</c:forEach>
										</c:if>
										<li class="p-3"></li>
									</ul>
								</div>
							</div>
							<!-- .chat-left-panel -->
							<!-- .chat-right-panel -->
							<div class="chat-right-aside">
								<c:if test="${croom ne null }">
									<div class="chat-main-header">
										<div class="p-3 border-bottom">
											<h3 class="box-title">
												${croom.croom_title} <a href="javascript:void(0)" id="exitChatRoom"><i class="mdi-exit-to-app mdi float-right text-danger ml-3"></i></a><a href="javascript:void(0)"
													data-target="#invite-chatroom" data-toggle="modal"
												><i class="mdi-account-plus mdi text-muted float-right ml-3"></i></a><a href="javascript:void(0)" data-target="#renameCroomTitle" data-toggle="modal"><i
													class="mdi-lead-pencil mdi float-right"
												></i></a>
											</h3>
											<input type="hidden" id="croom_no" value="${croom.croom_no }" />
										</div>
									</div>
									<div class="chat-rbox">
										<ul class="chat-list p-5" id="chatList">

										</ul>
									</div>
									<div class="card-body border-top">
										<div class="row">
											<div class="col-9">
												<textarea placeholder="메세지를 입력하세요" class="form-control b-0" id="sendMSG"></textarea>
											</div>
											<div class="col-3 text-right">
												<button type="button" class="btn btn-info btn-circle btn-lg" id="sendChat">
													<i class="fa fa-paper-plane"></i>
												</button>
											</div>
										</div>
									</div>
								</c:if>
							</div>
							<!-- .chat-right-panel -->
						</div>
						<!-- /.chat-row -->
					</div>
				</div>
			</div>
			<div id="create-chatroom" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form action="${pageContext.request.contextPath }/chat/insertChatRoom" onsubmit="return createCk()">
							<div class="modal-header">
								<h4 class="modal-title">채팅방 개설하기</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
							</div>
							<div class="modal-body">
								<div class="m-2">
									<label for="inputTitle" class="col-2">제목 : </label><input type="text" name="croom_title" id="inputTitle" class="form-control col-10" required="required" />
								</div>
								<div id="treeview_container" class="hummingbird-treeview p-3" style="overflow: auto; height: 300px;">
									<label>채팅 멤버 선택하기</label>
									<c:set var="index" value="0" />
									<ul class="hummingbird-base list-group treeview">
										<c:forEach var="dept" items="${deptList }" varStatus="vs">
											<li class="list-group-item"><i class="fa fa-plus"></i> <label>${dept.DEPT_NAME }</label>
												<ul>
													<c:forEach var="deptEmp" begin="1" end="${dept.COUNT }" step="1">
														<li><label> <input class="hummingbirdNoParent" name="emp_no" value="${empList[index].emp_no}" type="checkbox"> ${empList[index].emp_name } (
																${empList[index].job_title } )
														</label></li>
														<c:set var="index" value="${index+1 }"></c:set>
													</c:forEach>
												</ul></li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-success waves-effect waves-light">저장하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="renameCroomTitle" class="modal show" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true" style="display: none; padding-right: 17px;">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<form action="${pageContext.request.contextPath }/chat/renameCroom">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">채팅방 이름 변경하기</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
							</div>
							<div class="modal-body">
								<input type="text" value="${croom.croom_title }" class="form-control" name="croom_title" required="required" /> <input type="hidden" value="${croom.croom_index }" name="croom_index" /><input
									type="hidden" value="${croom.croom_no }" name="croom_no"
								/>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-success waves-effect waves-light">저장하기</button>
							</div>
						</form>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<div id="invite-chatroom" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">

						<form action="${pageContext.request.contextPath }/chat/inviteEmp" onsubmit="return inviteCk()">
							<div class="modal-header">
								<h4 class="modal-title">멤버 초대하기</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
							</div>
							<div class="modal-body row">
								<div class="col-8">
									<div class="m-2">
										<label for="inviteTitle" class="col-2">제목 : </label><input type="text" name="croom_title" id="inviteTitle" class="form-control col-10" value="${croom.croom_title}" />
									</div>
									<input type="hidden" name="croom_no" value="${croom.croom_no }" />
									<div id="treeview_container" class="hummingbird-treeview p-3" style="overflow: auto; height: 300px;">
										<label>초대할 멤버 선택하기</label>
										<c:set var="index" value="0" />
										<ul class="hummingbird-base list-group treeview">
											<c:forEach var="dept" items="${deptList }" varStatus="vs">
												<li class="list-group-item"><i class="fa fa-plus"></i> <label>${dept.DEPT_NAME }</label>
													<ul>
														<c:forEach var="deptEmp" begin="1" end="${dept.COUNT }" step="1">
															<li><label> <input class="hummingbirdNoParent" name="emp_no" value="${empList[index].emp_no}" type="checkbox"> ${empList[index].emp_name } (
																	${empList[index].job_title } )
															</label></li>
															<c:set var="index" value="${index+1 }"></c:set>
														</c:forEach>
													</ul></li>
											</c:forEach>
										</ul>
									</div>
								</div>
								<div class="col-4">
									<label><b>현재 채팅 멤버</b></label>
									<div style="overflow: auto; height: 300px;">
										<ul class="list-icons" id="chatEmp">
											
										</ul>
									</div>
								</div>
							</div> 
							<div class="modal-footer">
								<button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-success waves-effect waves-light">저장하기</button>
							</div>
						</form>

					</div>
				</div>
			</div>

			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script src="${pageContext.request.contextPath}/resources/templates/resources/js/chat.js"></script>
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/resources/js/hummingbird-treeview.js"></script>
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script>
	<script type="text/javascript">
		var chattingSock = new SockJS("<c:url value='/chatting'/>");
		if(${!empty croom.croom_no}){
			var croom_no = '${croom.croom_no}';
		}
		$('.treeview').hummingbird();  
		
		$(function() {
			var emp_no=${employee.emp_no};
			$('#create-chatroom input[value='+emp_no+']').prop('checked','checked').attr('disabled', 'disabled');
			
			$('#room' + croom_no).addClass('active');

			var chatListJson = ${chatList};
			for (var i = 0; i < chatListJson.length; i++) {
				appendMSG(chatListJson[i]);
			}

			/* $('#chatList').scrollTop($('#chatList').get(0).scrollHeight); */
			pageDown();
			
			
			var chatEmp=${chatEmp };
			
			for(var i=0;i<chatEmp.length;i++){
			   $('#chatEmp').append("<li><i class='ti-angle-right'></i>"+chatEmp[i].emp_name+"/"+chatEmp[i].dept_name+"/"+chatEmp[i].job_title+"</li>");
			   $('#invite-chatroom input[value='+chatEmp[i].emp_no+']').prop('checked','checked').attr('disabled', 'disabled');
			}
			

			$('#sendChat').on('click', sendMSG);
			$('#sendMSG').keypress(function(e) {
				if (e.which == 13 && !e.shiftKey) {
					sendMSG();
					event.preventDefault();
				}
			});
			
	
			  $("#exitChatRoom").click(function () {
		            Swal.fire({
		                title: '이 채팅방을 나가시겠습니까?',
		                type: 'warning',
		                showCancelButton: true,
		                confirmButtonColor: '#3085d6',
		                cancelButtonColor: '#d33',
		                confirmButtonText: 'OK!'
		            }).then((result) => {
		                if (result.value) {
		                    /* Swal.fire(
		                        '성공!',
		                        '채팅방을 나가셨습니다.',
		                        'success'
		                    ) */
		                    location.href="${pageContext.request.contextPath}/chat/exitCroom/"+'${croom.croom_index}';
		                }
		            })
		        });
			  
			  
			  $('#chat-search').on('change',function(){
				  var search_val=$(this).val();
				  $('.croom').each(function(i,e){
					  if($(this).attr('room_title').indexOf(search_val) == -1)
						  $(this).css('display','none');
					  else $(this).css('display','block');
				  });
				  
			  })

		});

		chattingSock.onmessage = function(evt) {
			var data = JSON.parse(evt.data);
			$('#room' + data.croom_no+' .chat-content').html(data.chat_content);
			$('#room' + data.croom_no+' small').html(moment(data.chat_sendtime).format("YYYY-MM-DD HH:mm"));
			if(data.croom_no==croom_no){
				appendMSG(data);
				pageDown();
			} else {
				console.log($('#room'+data.croom_no));
				$('#room'+data.croom_no+' .chat-Notify').show();
			}
		}

		function pageDown() {
			$('#chatList').animate({
				scrollTop : $('#chatList').get(0).scrollHeight
			}, 10);
		}

		function sendMSG() {
			if ($('#sendMSG').val() != "") {
				var msg = {
					'croom_no' : $('#croom_no').val(),
					'chat_content' : $('#sendMSG').val()
				};

				chattingSock.send(JSON.stringify(msg));
				$('#sendMSG').val('');
				$('#sendMSG').focus();
			} else {
				alert("보내실 메세지를 입력하세요!");
			}
		}

		function appendMSG(data) {
			var isME = (data.chat_sendno == '${sessionScope.employee.emp_no}');

			var chatList = $('#chatList');
			var chatli = $("<li>");
			if (isME)
				chatli.attr('class', 'reverse');
			var chatDiv = $('<div>').attr('class', 'chat-content');
			chatDiv.append('<h5>' + data.senderName + '</h5>');

			chatDiv.append("<div class='box "
					+ (isME ? 'bg-light-inverse' : 'bg-light-info') + "'>"
					+ data.chat_content + "</div>");

			chatli.append(chatDiv).append(
					"<div class='chat-time'>"
							+ new Date(data.chat_sendtime).toLocaleTimeString()
							+ "</div>");
			chatList.append(chatli);

		}
		
		function createCk() {
			if($("#create-chatroom input[name=emp_no]:checked").length < 2){
				alert("초대할 멤버를 선택해주세요");
				return false;
			}
			else {
				return true;
			}
		}
		
		function inviteCk() {
			if($('#invite-chatroom input[name=emp_no]:checked').not('input[disabled=disabled]').length < 1){
				alert('초대할 멤버를 선택해주세요');
				return false;
			}
			else {
				return true;
			}
		}

		
	</script>
</body>
</html>





