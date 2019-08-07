<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<div class="card-body">
	<div class="btn-group mb-2 mr-2" role="group"
		aria-label="Button group with nested dropdown">
		
		<div onclick="storeMail();" class="btn btn-secondary font-18 text-dark" alt="내부메일로 저장">
			<i class="mdi mdi-inbox-arrow-down"></i> 
		</div>
		<div onclick="readMail();" class="btn btn-secondary font-18 text-dark" alt="읽기">
			<i class="mdi mdi-alert-octagon"></i>
		</div>
		<%-- "location.href='${pageContext.request.contextPath}/mail/deleteMail.do'"  --%>
		
		<div onclick="deleteMail();"class="btn btn-secondary font-18 text-dark"alt="삭제">
			<i class="mdi mdi-delete"></i>
		</div>
	</div>
	<div class="btn-group mb-2 mr-2" role="group"
		aria-label="Button group with nested dropdown">
		<div class="btn-group" role="group">
			<div id="btnGroupDrop1" 
				class="btn btn-secondary text-dark dropdown-toggle"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" alt="즐겨찾기 등록">
				<i class="mdi mdi-star font-18"></i>
			</div>
			<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
				<li class="dropdown-item" onclick="updateStar('Y');">즐겨찾기 등록</li> 
				<li class="dropdown-item" onclick="updateStar('N');">즐겨찾기 취소</li>
			</div>
		</div>
		<div class="btn-group" role="group">
			<div id="btnGroupDrop1" 
				class="btn text-dark btn-secondary dropdown-toggle"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="mdi mdi-label font-18"></i>
			</div>
			<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
				<a class="dropdown-item" onclick="updateMark(1);">COMP</a> 
				<a class="dropdown-item" onclick="updateMark(2);">DEPT</a>
				<a class="dropdown-item" onclick="updateMark(3);">INDT</a>
				<a class="dropdown-item" onclick="updateMark(4);">WORK</a>
				<a class="dropdown-item" onclick="updateMark(5);">SOCI</a>
				<a class="dropdown-item" onclick="updateMark(6);">NONE</a>
			</div>
		</div>
	</div>
	<div onclick="location.reload();" class="btn btn-secondary mr-2 mb-2 text-dark">
		<i class="mdi mdi-reload font-18"></i>
	</div>
	
</div>

<script>
	
	 /* $("input[name='chkMail']").on("change",function(){
	 	$("input[name='chkMail']:checked").each(function(i) {
	        chkMails.push($(this).val());
	        console.log(chkMails.push($(this).val()));
	    });
	 }); */
	/*     
	 var allData = { "mail_no": mail_no, "chkMails": chkMail };  */
	     /*  onclick="location.href='${pageContext.request.contextPath}/mail/selectOneMail.do/${m.getMail_no()}/${type}' */
	   
	</script>