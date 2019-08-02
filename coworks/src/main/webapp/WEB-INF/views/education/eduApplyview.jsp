<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
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
.table td {
	cursor: pointer;
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
		                      		<!-- 	  <div class="dropdown float-right ">
					                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">교육 유형</button>
					                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> 
					                            	<input type="button" class="dropdown-item" id="type1" name="type1" value="회계" onclick="fnonclick($('input[name=month1]').val())"/>
					                            	<input type="button" class="dropdown-item" id="type2" name="type2" value="마케팅" onclick="fnonclick($('input[name=month2]').val())"/>
					                            	<input type="button" class="dropdown-item" id="type3" name="type3" value="컴퓨터" onclick="fnonclick($('input[name=month3]').val())"/> 
					                            	<input type="button" class="dropdown-item" id="type4" name="type4" value="외국어" onclick="fnonclick($('input[name=month3]').val())"/> 
					                            </div>
					                      </div> -->
					            </div>
					            
					            </br></br></br>
                 				<div class="table-responsive"> 
                 					<table class="table table-hover" style="text-align: center;">
                 						<thead class="bg-warning text-white">
                 							<tr>
                 								<th></th> 
                 								<th>교육유형</th>
                 								<th>교육명</th>
                 								<th>강사</th>
                 								<th>교육일</th>
                 								<th></th>
                 								
                 							</tr>
                 						</thead>
                 						
                 						 <tbody>  	
                                       	 <c:forEach items="${list}" var="list" varStatus="idx">
                                       	 
											 
											
												<input type="hidden" id="eduDate" name="eduDate" value="${list.edu_eduDate}"/>
													<c:set var="now" value="<%=new java.util.Date()%>" />
													<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd HH:mm"/>
													<fmt:formatDate var="edudate" value="${list.edu_eduDate}" pattern="yyyy-MM-dd HH:mm" />
												
												 <fmt:parseDate var="a" value="${list.edu_eduDate}" pattern="yyyy-MM-dd HH:mm"/> 
												 
													<c:set var="start2" value="${a.getTime()+60*60*24*1000}"/>
													<c:set var="end2" value="${a.getTime()+60*60*24*1000*7}"/>
													
													<jsp:useBean id="convtSt" class="java.util.Date">
														<c:set target="${convtSt}" property="time" value="${ start2 }"/>
													</jsp:useBean>
													
													<jsp:useBean id="convtEd" class="java.util.Date">
														<c:set target="${convtEd}" property="time" value="${ end2 }"/>
													</jsp:useBean>
													<fmt:formatDate var="start2_cvt" value="${convtSt}" pattern="yyyy-MM-dd HH:mm"/>
													<fmt:formatDate var="end2_cvt" value="${convtEd}" pattern="yyyy-MM-dd HH:mm" />
													
													<fmt:parseDate var="startReport" value="${start2_cvt}" pattern="yyyy-MM-dd HH:mm"/>
													<fmt:parseDate var="endReport" value="${end2_cvt}" pattern="yyyy-MM-dd HH:mm"/> 
															
											
											
											<tr onclick="location.href='${pageContext.request.contextPath}/education/eduDetail.do?edu_no=${list.edu_no}'">
												<td>${idx.count}</td>
												<td>${list.edu_type}</td>
												<td id="title" >
													
														${list.edu_title}
													
												</td>
												<td>${list.edu_instructor}</td>
												 
												<td  onclick="event.cancelBubble=true"> 
													<c:if test="${list.edurep_no==0}">
														<c:choose> 
														<c:when test="${today lt edudate}">
															<button id="cancel" name="cancel"  class="btn btn-danger" onclick="fnCancel('${list.edu_no}');">취소</button>
														</c:when>
														<c:when test="${today ge start2_cvt && today le end2_cvt}">
															<button id="report" name="report" class="btn btn-info" onclick="fnWriteReport('${list.edu_no}');">보고서 작성</button>
														</c:when>
														</c:choose>
														
													</c:if>
													
													<c:if test="${list.edurep_no!=0  }">
														<button id="reportView" class="btn btn-secondary" onclick="fnReportView('${list.edurep_no}');">보고서 보기</button>
														<c:if test="${today ge start2_cvt && today le end2_cvt}">
															<button id="reportEdit" name="report" class="btn btn-info" onclick="fnReportEdit('${list.edurep_no}');">보고서 수정</button>
														</c:if> 
													</c:if>
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
		/* $('#cancel').show(); 
		var edu=$('#eduDate').val();
		var edudate=new Date(edu);  
		var today=new Date();  
		console.log(today.getTime());	//오늘
		
		var d=new Date(edudate.getFullYear(),edudate.getMonth(),edudate.getDate());	// 교육일
		var startReport=new Date(d.setDate(d.getDate()+1));
		
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
		 */
		 
 	});
	
	function fnWriteReport(edu_no){
		location.href="${pageContext.request.contextPath}/education/insertEduReport.do?edu_no="+edu_no;
		
	}
	
	function fnReportView(edurep_no){
		location.href="${pageContext.request.contextPath}/education/eduReport/v/"+edurep_no;
	}
	
	function fnReportEdit(edurep_no){
		location.href="${pageContext.request.contextPath}/education/eduReport/edit/"+edurep_no;
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