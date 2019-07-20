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
				
				<!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">근태 관리</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Attendance</li>
                        </ol>
                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        <div class="dropdown float-right mr-2 hidden-sm-down">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> January 2019 </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> <a class="dropdown-item" href="#">February 2019</a> <a class="dropdown-item" href="#">March 2019</a> <a class="dropdown-item" href="#">April 2019</a> </div>
                        </div>
                    </div>
                </div>
				
				
				 <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">ooo 님의 근태 현황</h4> 
                                <div class="table-responsive">
                                    <table class="table no-wrap">
                                        <thead>
                                            <tr>
                                                <th>인덱스</th>
                                                <th>날짜</th>
                                                <th>출근</th>
                                                <th>퇴근</th>
                                                <th>지각</th>
                                                <th>결석</th>
                                                <th>근무시간</th>
                                                <th>출근 IP</th>
                                                <th>퇴근 IP</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>2019/01/04</td>
                                                <td>08:00</td>
                                                <td>17:40</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td><span class="label label-danger">9:30</span></td>
                                                <td>192.32.313.95</td>
                                                <td>192.32.313.95 </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>2019/01/05</td>
                                                <td>08:00</td>
                                                <td>17:40</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td><span class="label label-info">9:30</span> </td>
                                                <td>192.32.313.95</td>
                                                <td>192.32.313.95</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>2019/01/06</td>
                                                <td>08:00</td>
                                                <td>17:40</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td><span class="label label-warning">9:30</span> </td>
                                                <td>192.32.313.95</td>
                                                <td>192.32.313.95</td> 
                                            </tr>
                                            <tr>
                                                
                                                <td>4</td>
                                                <td>2019/01/09</td>
                                                <td>08:00</td>
                                                <td>17:40</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td><span class="label label-success">9:30</span> </td>
                                                <td>192.32.313.95</td>
                                                <td>192.32.313.95</td>
                                            </tr>
                                            <tr>
                                                
                                                <td>5</td>
                                                <td>2019/01/10</td>
                                                <td>08:00</td>
                                                <td>17:40</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td><span class="label label-info">9:30</span> </td>
                                                <td>192.32.313.95</td>
                                                <td>192.32.313.95</td>
                                            </tr>
                                            <tr>
                                                
                                                <td>6</td>
                                                <td>2019/01/11</td>
                                                <td>08:00</td>
                                                <td>17:40</td>
                                                <td>0</td>
                                                <td>0</td>
                                                <td><span class="label label-success">9:30</span> </td>
                                                <td>192.32.313.95</td>
                                                <td>192.32.313.95</td>
                                            </tr>
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