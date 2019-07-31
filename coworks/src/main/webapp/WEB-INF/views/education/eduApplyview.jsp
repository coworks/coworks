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
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				
				<div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">교육 신청 현황</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Education</li>
                        </ol>
                    </div>
                </div>
				
				 <div class="col-12">
                        <div class="card">
                            <div class="card-body""> 
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
												<td>${list.edu_title}</td>
												<td>${list.edu_instructor}</td>
												<td>${list.edu_eduDate}</td>
												<td> <button id="cancel" name="cancel"  class="btn btn-danger" onclick="fnCancel('${list.edu_no}');">취소</button></td>
											</tr>
										</c:forEach>
                 						</tbody>
                 						
                 					</table>
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