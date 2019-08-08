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
				                              	<td><fmt:formatDate value="${edu.edu_eduDate}" pattern="yyyy-MM-dd" /></td>
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
				                              	<td id="count">${edu.edu_curCnt} / ${edu.edu_limitCnt}</td>
				                              </tr>  
				                              </tbody>
				                
				               		 </table>   
				               		 
				                </div>
				                 <div class="float-right">
				                 	<input type="button" class="btn btn-info" id="apply" name="apply" style="display:none"  value="신청하기"/>
				                 	<input type="button" class="btn btn-success" id="applyExpected" name="applyExpected" style="display:none" style="display:none" value="신청 예정"/>
				                 
				                 	<input type="button" class="btn btn-danger" id="delete" name="delete"  style="display:none" value="취 소"/>
				                 	<input type="button" class="btn btn-secondary" id="finished" name="finished" style="display:none" value="마 감"/>
				                 
				                 </div>
								</h4>
								<!-- sample modal content -->
							 <input type="hidden" id="emp_no" name="emp_no" style="display:none" value="${edu.emp_no}"/>
				                 
							</div>
							
				</div>
				<div class="card">
				
				<br>
					<h3 class=" mb-0 mt-0">&nbsp;&nbsp; 교육 안내</h3><br> 
					<div style="margin:0 auto;">
				     <img id="aaa" src="${pageContext.request.contextPath}/resources/images/educationImg/${edu.edu_image}" style="max-width:100%; height:auto;">
					</div><br> 
					<div style="height:50px;">	
				</div>
				</div>
				
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	
	
	<script>  
	 	$(function(){
	 		var no="${edu.edu_no}";
			var bg=new Date("${edu.edu_applyBgDate}");
			var end=new Date("${edu.edu_applyEndDate}");
			var limit="${edu.edu_limitCnt}";
			var curr="${edu.edu_curCnt}";
			var $this = this;  
	    	 var now = new Date(); 
			var count=$("#emp_no").val();
    		
			console.log("count : "+count);
			if(count!=0){
			//	alert("이미신청하셨습니다!");
	    		 $('#applyExpected').hide();
	    		 $('#delete').show();
	    		 $('#apply').hide();
	    		 $('#finished').hide();
	 	}else if(now.getTime()<bg.getTime()){	// 교육 신청 시작일 전
	    		 $('#applyExpected').show();
	    		 $('#delete').hide();
	    		 $('#apply').hide();
	    		 $('#finished').hide();
	    	 }else if( now.getTime()>end.getTime() || limit-curr<=0){	//교육신청기간이 지났거나 인원이마감된경우

	    		 $('#applyExpected').hide();
	    		 $('#delete').hide();
	    		 $('#apply').hide();
	    		 $('#finished').show();
	    	 }else{
	    		 $('#applyExpected').hide();
	    		 $('#delete').show();
	    		 $('#apply').show();
	    		 $('#finished').hide();
	    	 }
	    $('#applyExpected').on("click",function(){

	    	var begin=moment(bg).format('YYYY/MM/DD HH:mm');
	    	alert("교육 신청 시작일은 "+begin +" 입니다.");
	    	
	    }); 
		$('#delete').on("click",function(){ 
			var edu_no="${edu.edu_no}";
			var limit="${edu.edu_limitCnt}";
			var curr="${edu.edu_curCnt}";
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
                  
                    location.href="${pageContext.request.contextPath}/education/eduDetail.do?edu_no="+${edu.edu_no};
                	
                	//	$('#count').text(curr+" / "+limit);
                },error: function(data){
                    alert("취소 실패");
                }
			});
			
			
			
		});
			$('#apply').on("click",	function(){
			
			console.log("시작");
			console.log(no);
			console.log(bg);
			console.log(end);
			console.log(limit);
			console.log(curr);
			
			
			
			if((now.getTime()>=bg.getTime() && now.getTime()<=end.getTime())
					&& limit-curr>0){
				$.ajax({
					  url : "${pageContext.request.contextPath}/education/insertEduApply.do",
	                  data : {edu_no : no},
	                  type:"post",
	                  dataType : "json",
	                  async:false,
	                  success : function(data){
	                      if(data>0) alert("신청 완료!!");
	                      else alert("신청 실패!!");  
	                      location.href="${pageContext.request.contextPath}/education/eduDetail.do?edu_no="+${edu.edu_no};
	                       
	                  },error: function(data){
	                      alert("신청 실패");
	                  }
				});
			}else{
				alert("마감되었습니다."); 
				$('#apply').hide();
				$('#delete').hide();
				$('#finished').show();
				
			}
			
			});
	 	});
	</script>
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script>
	
</body>
</html>