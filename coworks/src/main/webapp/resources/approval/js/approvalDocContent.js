$(function(){		
		console.log(docType);
		console.log(content);
		
		
		if(docType=="휴가신청서"){
			var docContentList=$('<ol>');
			docContentList.append("<li>휴가 종류 : "+content.vacation_type+"</li><br />");
			docContentList.append("<li>휴가 기간 : "+content.vacation_range+" ("+content.vacation_period+" 일간)</li><br />");
			docContentList.append("<li>휴가 사유 : "+content.vacation_reason+"</li><br />"); 
	
			var subCon=$('<p>').text("위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.").css("text-align","center")
			
			$('#docContent').append(docContentList);
			$('#docContent').append('<br>').append(subCon);
			
		} else if(docType=="시말서"){
			var docContent=$('<p>');
			docContent.append("<b>위반내용</b><br>&thinsp;"+content.apology_reason);
			var subCon=$('<p>');
			subCon.append("위 본인은 직원으로서 제 사규를 준수하고 맡은바 책임과 의무를 다하여 성실히 복무하여야 함에도 불구하고 위와 같이 회사의 관련 규정을 위반하였는바 이에 시말서를 제출하고 그에 따른 처벌을 감수하며 차후 본건을 계기로 과오의 재발이 없을 것임을 서약합니다. ").css("text-align","center")

			$('#docContent').append(docContent);
			$('#docContent').append('<br>').append(subCon);
			
		}

})
;	