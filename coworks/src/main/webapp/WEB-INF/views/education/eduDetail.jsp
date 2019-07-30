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
				                </div>
				                 <div class="float-right">
				                 	<input type="button" class="btn btn-secondary" id="apply" name="apply" value="신청하기"/>
				                 </div>
								
							</div>
							
				</div>
				<div class="card">
				
				<br>
					<h3 class=" mb-0 mt-0">&nbsp; [${edu.edu_type}] 교육 안내</h3><br> 
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
</body>
</html>