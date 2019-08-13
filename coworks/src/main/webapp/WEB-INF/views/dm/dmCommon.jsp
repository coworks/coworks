<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!-- <div class="col-12"> -->
<div class="col-xlg-2 col-lg-3 col-md-3">
	<div class="card-body inbox-panel">
		<a href="${pageContext.request.contextPath}/dm/dmWriteForm.do"
			class="btn btn-primary mb-3 p-2 btn-block waves-effect waves-light">쪽지 보내기</a>
		<ul class="list-group list-group-full">
		<!-- active -->
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/dm/dmList.do"><i
					class="mdi mdi-cookie"></i>받은 쪽지</a><%-- <span
				class="badge badge-success ml-auto"> ${readCount}</span> --%></li>
	
			<li class="list-group-item "><a href="${pageContext.request.contextPath}/dm/sendDmList.do"> <i
					class="mdi mdi-file-document-box"></i> 보낸 쪽지
			</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/dm/delDmList.do"> <i
					class="mdi mdi-delete"></i> 휴지통
			</a></li>
		</ul>
	</div>
</div>
<!-- </div> -->