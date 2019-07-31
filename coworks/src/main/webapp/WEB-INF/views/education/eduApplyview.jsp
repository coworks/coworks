<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 교육 신청 현황</title>
<c:import url="../common/header.jsp" />
<style>
	a:hover{
		text-decoration:underline;
		text-color:blue;
	}
</style>
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				 
				
				 <div class="col-12">
                        <div class="card">
                            <div class="card-body"> 
	                            <div class=" align-self-center">
	                            		<div class="float-left">
	                            		<h3 class="card-title mb-7">교육 신청 현황</h3>
	                            		
	                            		</div>
	                            		</br></br></br>
		                      			  <div class="dropdown float-right ">
					                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">교육 유형</button>
					                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> 
					                            	<input type="button" class="dropdown-item" id="type1" name="type1" value="회계" onclick="fnonclick($('input[name=month1]').val())"/>
					                            	<input type="button" class="dropdown-item" id="type2" name="type2" value="마케팅" onclick="fnonclick($('input[name=month2]').val())"/>
					                            	<input type="button" class="dropdown-item" id="type3" name="type3" value="컴퓨터" onclick="fnonclick($('input[name=month3]').val())"/> 
					                            	<input type="button" class="dropdown-item" id="type4" name="type4" value="외국어" onclick="fnonclick($('input[name=month3]').val())"/> 
					                            </div>
					                      </div>
					            </div>
					            
					            </br></br></br>
                 				<div class="table-responsive"> 
                 					<table class="table" style="text-align: center;">
                 						<thead class="bg-warning text-white">
                 							<tr>
                 								<th>인덱스</th> 
                 								<th>교육유형</th>
                 								<th>교육명</th>
                 								<th>강사</th>
                 								<th>교육일</th>
                 								<th>취소</th>
                 								
                 							</tr>
                 						</thead>
                 						
                 						 <tbody>  	
                                       	 <c:forEach items="${list}" var="list" varStatus="idx">
                                         
											<tr>
												<td>${idx.count}</td>
												<td>${list.edu_type}</td>
												<td id="title" >
													<a href="${pageContext.request.contextPath}/education/eduDetail.do?edu_no=${list.edu_no}" style="color:black;">
														${list.edu_title}
													</a>
												</td>
												<td>${list.edu_instructor}</td>
												<td>
													<input type="hidden" id="eduDate" name="eduDate" value="${list.edu_eduDate}"/>
													<fmt:formatDate value="${list.edu_eduDate}" pattern="yyyy-MM-dd" />
												</td>
												<td> 
													<button id="report" name="report"  class="btn btn-info" onclick="fnWriteReport('${list.edu_no}');">보고서 작성</button>
													<button id="cancel" name="cancel"  class="btn btn-danger" onclick="fnCancel('${list.edu_no}');">취소</button>
												</td>
											</tr>
										</c:forEach>
                 						</tbody>
                 						
                 					</table>
                 					<c:if test="${list.size() == 0 }">
										<div align="center">
										</br>
											<img src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png" style="width: 150px; vertical-align: middle; border: 0" />
											</br><h4 style="font-weight: bold;">신청한 교육이 없습니다.</h4>
										</div>
									</c:if>
                 				</div>
                 				<div style="height:100px;">
                 				
                 				</div>
                 			</div>
                 		</div>
                 </div>
				
				
				
				
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	
	
	<script>
	$( function(){
		$('#cancel').show(); 
		var edu=$('#eduDate').val();
		var edudate=new Date(edu);  
		var today=new Date();  
		console.log(today.getTime());	//오늘
		var d=new Date(edudate.getFullYear(),edudate.getMonth(),edudate.getDate());	// 교육일
		var startReport=new Date(d.setDate(d.getDate()+1));
		console.log(startReport.getTime()); // 교육 다음날
		var endReport=new Date(d.setDate(d.getDate()+7));
		console.log(endReport.getTime()); //교육 일주일 후
		
		var d2=new Date(edudate.getFullYear(),edudate.getMonth(),edudate.getDate()); // 교육날
		console.log(startReport.getTime()<=today.getTime() && today.getTime()<=endReport.getTime());
		
		if(startReport.getTime()>today.getTime() || today.getTime()>endReport.getTime()){
			$('#report').hide(); 
		}
		if(d2.getTime()<today){
			$('#cancel').hide();
		}
		 
 	});
	
	function fnWriteReport(edu_no){
		location.href="${pageContext.request.contextPath}/education/insertEduReport.do?edu_no="+edu_no;
		
	}
	function fnCancel(edu_no){
		 
		$.ajax({
			  url : "${pageContext.request.contextPath}/education/deleteEduApply.do",
            data : {edu_no : edu_no},
            type:"post",
            dataType : "json",
            async:false,
            success : function(data){
                if(data>0){
                	alert("취소 완료!!");
                
                } 
                else alert("취소 실패!!");
              
                location.href="${pageContext.request.contextPath}/education/eduApplyview.do";
            	 
                
            },error: function(data){
                alert("취소 실패");
            }
		});
		
		
		
	};
	</script>
</body>
</html>