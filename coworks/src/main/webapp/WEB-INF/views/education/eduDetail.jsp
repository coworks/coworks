<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 교육 관리</title>
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
                        <h3 class="text-themecolor mb-0 mt-0">일정 상세보기</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Education</li>
                        </ol>
                    </div>
                </div>
				
				 <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                 				<div class="table-responsive"> 
				                 	<h3 class=" mb-0 mt-0">[${edu.edu_type}]&nbsp; ${edu.edu_title}</h3><br>
				                         <table class="table no-wrap">
				                              
				                              <tbody>
				                              <tr>
				                              	<th>교육일</th>
				                              	<td>${edu.edu_eduDate}</td>
				                              </tr> 
				                              <tr>
				                              	<th>교육명</th>
				                              	<td>${edu.edu_title}</td>
				                              </tr> 
				                              <tr>
				                              	<th>강사</th>
				                              	<td>${edu.edu_instructor} </td>
				                              </tr> 
				                              <tr>
				                              	<th>정원</th>
				                              	<td>${edu.edu_curCnt} / ${edu.edu_limitCnt}</td>
				                              </tr>  
				                              </tbody>
				                
				               		 </table>  
				               		 <!-- 바꿀꺼야... -->
				               		 <input type="hidden" id="edu_no" value="${edu.edu_no}"/>				               		
				               		 <input type="hidden" id="edu_curCnt" value="${edu.edu_curCnt}"/>
				               		 <input type="hidden" id="edu_limitCnt" value="${edu.edu_limitCnt}"/>				              
				               		 <input type="hidden" id="edu_applyBgDate" value="${edu.edu_applyBgDate}"/>
				               		 <input type="hidden" id="edu_applyEndDate" value="${edu.edu_applyEndDate}"/>
				                </div>
				                 <div class="float-right">
				                 	<input type="button" class="btn btn-info" id="apply" name="apply" value="신청하기"/>
				                 	<input type="button" class="btn btn-secondary" id="finished" name="finished" style="display:none" value="마 감"/>
				                 
				                 </div>
								
							</div>
							
				</div>
				<div class="card">
				
				<br>
					<h3 class=" mb-0 mt-0">&nbsp;&nbsp; 교육 안내</h3><br> 
					<div style="margin:0 auto;">
				     <img id="aaa" src="${pageContext.request.contextPath}/resources/images/educationImg/${edu.edu_image}"/>
					</div>
				</div>
				</div>
				
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	
	
	<script>  
			$('#apply').on("click",	function(){
			var no=($('#edu_no').val());
			var bg=new Date($('#edu_applyBgDate').val());
			var end=new Date($('#edu_applyEndDate').val());
			var limit=$('#edu_limitCnt').val();
			var curr=$('#edu_curCnt').val();
			console.log(bg);
			
			var $this = this;  
	    	 var now = new Date(); 
			
			if((now.getTime()>=bg.getTime() && now.getTime()<=end.getTime())
					&& limit-curr>0){
				$.ajax({
					  url : "${pageContext.request.contextPath}/education/insertEduApply.do",
	                  data : {edu_no : no},
	                  type:"post",
	                  dataType : "json",
	                  async:false,
	                  success : function(data){
	                      alert("신청 완료!");
	                      location.href="${pageContext.request.contextPath}/education/edcationview.do";
	                  },error: function(data){
	                      alert("신청 실패");
	                  }
				});
			}else{
				alert("신청 인원이 마감되었습니다."); 
				$('#apply').hide();
				$('#finished').show();
				
			}
			
			});
		 
	</script>
</body>
</html>