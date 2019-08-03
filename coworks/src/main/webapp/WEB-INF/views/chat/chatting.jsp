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
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
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
										<input class="form-control p-3" type="text" placeholder="사원 조회">
									</div>
									<ul class="chatonline style-none ">
										<c:forEach var="chatroom" items="${croomList }">
											<li><a href="javascript:void(0)"> <span>${chatroom.croom_title } <small class="text-success">online</small></span></a></li>
										</c:forEach>
										<li><a href="javascript:void(0)" class="active"> <span>Genelia Deshmukh <small class="text-warning">Away</small></span></a></li>
										<li><a href="javascript:void(0)"> <span>Ritesh Deshmukh <small class="text-danger">Busy</small></span></a></li>
										<li><a href="javascript:void(0)"> <span>Arijit Sinh <small class="text-muted">Offline</small></span></a></li>
										<li><a href="javascript:void(0)"> <span>Govinda Star <small class="text-success">online</small></span></a></li>
										<li><a href="javascript:void(0)"> <span>John Abraham<small class="text-success">online</small></span></a></li>
										<li><a href="javascript:void(0)"><span>Hritik Roshan<small class="text-success">online</small></span></a></li>
										<li><a href="javascript:void(0)"><span>Pwandeep rajan <small class="text-success">online</small></span></a></li>
										<li class="p-3"></li>
									</ul>
								</div>
							</div>
							<!-- .chat-left-panel -->
							<!-- .chat-right-panel -->
							<div class="chat-right-aside">
								<div class="chat-main-header">
									<div class="p-3 border-bottom">
										<h3 class="box-title">채팅 메세지</h3>
										<input type="hidden" id="croom_no" value="1" />
									</div>
								</div>
								<div class="chat-rbox">
									<ul class="chat-list p-5" id="chatList">
										<!--chat Row -->
										<li>
											<div class="chat-content">
												<h5>James Anderson</h5>
												<div class="box bg-light-info">Lorem Ipsum is simply dummy text of the printing & type setting industry.</div>
											</div>
											<div class="chat-time">10:56 am</div>
										</li>
										<!--chat Row -->
										<li>
											<div class="chat-content">
												<h5>Bianca Doe</h5>
												<div class="box bg-light-info">It’s Great opportunity to work.</div>
											</div>
											<div class="chat-time">10:57 am</div>
										</li>
										<!--chat Row -->
										<li class="reverse">
											<div class="chat-content">
												<h5>Steave Doe</h5>
												<div class="box bg-light-inverse">It’s Great opportunity to work.</div>
											</div>
											<div class="chat-time">10:57 am</div>
										</li>
										<!--chat Row -->
										<li class="reverse">
											<div class="chat-content">
												<h5>Steave Doe</h5>
												<div class="box bg-light-inverse">It’s Great opportunity to work.</div>
											</div>
											<div class="chat-time">10:57 am</div>
										</li>
										<!--chat Row -->
										<li>
											<div class="chat-content">
												<h5>Angelina Rhodes</h5>
												<div class="box bg-light-info">Well we have good budget for the project</div>
											</div>
											<div class="chat-time">11:00 am</div>
										</li>
										<!--chat Row -->
									</ul>
								</div>
								<div class="card-body border-top">
									<div class="row">
										<div class="col-8">
											<textarea placeholder="Type your message here" class="form-control b-0" id="sendMSG"></textarea>
										</div>
										<div class="col-4 text-right">
											<button type="button" class="btn btn-info btn-circle btn-lg" id="sendChat">
												<i class="fa fa-paper-plane"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- .chat-right-panel -->
						</div>
						<!-- /.chat-row -->
					</div>
				</div>
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script src="${pageContext.request.contextPath}/resources/templates/resources/js/chat.js"></script>
	<script type="text/javascript">
		var chattingSock = new SockJS("<c:url value='/chatting'/>");

		$(function() {
			pageDown();

			$('#sendChat').on('click', sendMSG);
			$('#sendMSG').keypress(function(e) {
				if (e.which == 13 && !e.shiftKey) {
					sendMSG();
					event.preventDefault();
				}
			});
		});

		chattingSock.onmessage = function(evt) {
			var data = JSON.parse(evt.data);
			console.log(data);

			var isME = (data.sendno == '${employee.emp_no}');

			var chatList = $('#chatList');
			var chatli = $("<li>");
			if (!isME)
				chatli.attr('class', 'reverse');
			var chatDiv = $('<div>').attr('class', 'chat-content');
			chatDiv.append('<h5>' + data.senderName + '</h5>');

			chatDiv.append("<div class='box "
					+ (isME ? 'bg-light-info' : 'bg-light-inverse') + "'>"
					+ data.chat_content + "</div>");

			chatli.append(chatDiv).append(
					"<div class='chat-time'>"
							+ new Date(data.chat_sendtime).toLocaleTimeString()
							+ "</div>");
			chatList.append(chatli);

			pageDown();
		}

		function pageDown() {
			$('#chatList').animate({
				scrollTop : $('#chatList').get(0).scrollHeight
			}, 100);
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
	</script>
</body>
</html>





