<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<div class="card-body">
	<div class="btn-group mb-2 mr-2" role="group"
		aria-label="Button group with nested dropdown">
		<button type="button" onclick="storeDm();" class="btn btn-secondary font-18 text-dark">
			<i class="mdi mdi-inbox-arrow-down"></i>
		</button>
		
		<%-- "location.href='${pageContext.request.contextPath}/mail/deleteMail.do'"  --%>
		<button type="button" onclick="deleteDm();"class="btn btn-secondary font-18 text-dark">
			<i class="mdi mdi-delete"></i>
		</button>
	</div>
	
	<button type="button" onclick="location.reload();" class="btn btn-secondary mr-2 mb-2 text-dark">
		<i class="mdi mdi-reload font-18"></i>
	</button>
	
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