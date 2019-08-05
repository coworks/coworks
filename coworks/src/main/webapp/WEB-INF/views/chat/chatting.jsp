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
										<input class="form-control p-3" type="text" placeholder="검색">
									</div>
									<ul class="chatonline style-none ">
										<li><a href=""><i class="fa fa-plus"></i> 채팅방 개설하기</a></li>
										<c:forEach var="chatroom" items="${croomList }">
											<li><a href="${pageContext.request.contextPath}/chat/croom/${chatroom.croom_no}" value="link${chatroom.croom_no }"> <span><b>${chatroom.croom_title } </b>
														<p class="text-mute ml-2">${chatroom.chat_content }</p> <small class="text-mute text-right"><fmt:formatDate value="${chatroom.chat_sendtime }" pattern="yyyy-MM-dd HH:mm" /></small></span></a></li>
										</c:forEach>
										<li class="p-3"></li>
									</ul>
								</div>
							</div>
							<!-- .chat-left-panel -->
							<!-- .chat-right-panel -->
							<div class="chat-right-aside">
								<div class="chat-main-header">
									<div class="p-3 border-bottom">
										<h3 class="box-title">${croom.croom_title}  <a href=""><i class="mdi-exit-to-app mdi float-right text-danger ml-3"></i></a><a href=""><i class="mdi-plus-box-outline mdi float-right text-success ml-3"></i></a><a href=""><i class="mdi-lead-pencil mdi float-right"></i></a> </h3>
										<input type="hidden" id="croom_no" value="${croom.croom_no }" />
									</div>
								</div>
								<div class="chat-rbox">
									<ul class="chat-list p-5" id="chatList">

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
		var croom_no = ${croom.croom_no};
		$(function() {
			$('a[value=link' + croom_no + ']').addClass('active');

			var chatListJson = ${chatList};
			console.log(chatListJson);
			for (var i = 0; i < chatListJson.length; i++) {
				appendMSG(chatListJson[i]);
			}

			/* $('#chatList').scrollTop($('#chatList').get(0).scrollHeight); */
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
			if(data.croom_no==croom_no){
			appendMSG(data);
			pageDown();}

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
	</script>
</body>
</html>





