<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!-- <div class="col-12"> -->
<div class="col-xlg-2 col-lg-3 col-md-3">
	<div class="card-body inbox-panel">
		<a href="${pageContext.request.contextPath}/mail/app-compose.do"
			class="btn btn-danger mb-3 p-2 btn-block waves-effect waves-light">메일쓰기</a>
		<ul class="list-group list-group-full">
		<!-- active -->
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/mail/innerMail.do"><i
					class="mdi mdi-gmail"></i> 내부 메일함 </a><%-- <span
				class="badge badge-success ml-auto"> ${readCount}</span> --%></li>
				<li class="list-group-item "><a href="${pageContext.request.contextPath}/mail/outerMail.do"><i
					class="mdi mdi-gmail"></i> 외부 메일함 </a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/mail/selectStar.do"> <i
					class="mdi mdi-star"></i> 즐겨찾기
			</a></li>
		<!-- 	<li class="list-group-item"><a href="javascript:void(0)"> <i
					class="mdi mdi-send"></i> 임시저장
			</a><span class="badge badge-danger ml-auto">3</span></li> -->
			<li class="list-group-item "><a href="${pageContext.request.contextPath}/mail/sendMail.do"> <i
					class="mdi mdi-file-document-box"></i> 보낸 메일함
			</a></li>
			<li class="list-group-item"><a href="${pageContext.request.contextPath}/mail/deleteMail.do"> <i
					class="mdi mdi-delete"></i> 휴지통
			</a></li>
		</ul>
		<h3 class="card-title mt-5">분류</h3>
		<div class="list-group b-0 mail-list">
			<a href="${pageContext.request.contextPath}/mail/selectMark.do/1" class="list-group-item">
				<span class="fa fa-circle text-info mr-2"></span>COMP
			</a> 
			<a href="${pageContext.request.contextPath}/mail/selectMark.do/2" class="list-group-item">
				<span class="fa fa-circle text-warning mr-2"></span>DEPT
			</a> 
			<a href="${pageContext.request.contextPath}/mail/selectMark.do/3" class="list-group-item">
				<span class="fa fa-circle text-purple mr-2"></span>INDI
			</a> 
			<a href="${pageContext.request.contextPath}/mail/selectMark.do/4" class="list-group-item">
				<span class="fa fa-circle text-danger mr-2"></span>WORK
			</a> 
			<a href="${pageContext.request.contextPath}/mail/selectMark.do/5"class="list-group-item">
				<span class="fa fa-circle text-success mr-2"></span>SOCI
			</a>
		</div>
	</div>
</div>
<!-- </div> -->
<script>
	/* $(document).ready(function() { 
		$.ajax({
			url:"${pageContext.request.contextPath}/mail/readCount.do",
		    type:'POST',
	    	/* contentType : 'application/json; charset=UTF-8',
		    data: JSON.stringify(chkMails), */
	/*	    success:function(data){
				console.log("현재 메일 개수 : "+data)
		    	
		    },
		    error:function(){
		    	alert("내부 메일로 저장하는데 문제가 발생하였습니다! ㅜㅜ");
		    }
		});
	); */
</script>