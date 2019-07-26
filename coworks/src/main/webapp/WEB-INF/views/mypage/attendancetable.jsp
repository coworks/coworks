<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 관리</title>
<c:import url="../common/header.jsp" />
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
                            
                            
	                            <div class="align-self-center">
	                                <h4 class="card-title float-left">ooo 님의 근태 현황</h4> 
	                                <div class=" align-self-center">
	                      			  <div class="dropdown float-right ">
				                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> January 2019 </button>
				                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> <a class="dropdown-item" href="#">February 2019</a> <a class="dropdown-item" href="#">March 2019</a> <a class="dropdown-item" href="#">April 2019</a> </div>
				                      </div>
				                    </div>
				                    	
	                             </div>
	                             
	                             </br></br></br></br>
	                             
	                             
                                <div class="table-responsive">
                                    <table class="table no-wrap">
                                        <thead>
                                        <tr>
                                                <th>인덱스</th>
                                                <th>날짜</th>
                                                <th>출근</th>
                                                <th>퇴근</th>
                                                <th>근무시간</th>
                                                <th>출근 IP</th>
                                                <th>퇴근 IP</th>
                                            </tr> 
                                        </thead>
                                        <tbody>
                                        
                                        <c:forEach items="${list}" var="attend" varStatus="idx">
                                        
											<tr>
												<td>${idx.count}
                                                <td>${attend.atten_date}</td>
                                                <td>${attend.atten_attTime}</td>
                                                <td>${attend.atten_leaveTime}</td>
                                                <td>임시</td>
                                                <td>${attend.atten_attIP}</td>
                                                <td>${attend.atten_leaveIP}</td>  
                                            </tr>
                                           </c:forEach>
                                             
                                        </tbody>
                                    </table>
                                </div>
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