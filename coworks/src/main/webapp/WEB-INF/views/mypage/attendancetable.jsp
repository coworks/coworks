<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 근태 현황</title>
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
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">메인페이지</a></li>
                            <li class="breadcrumb-item active">근태 현황</li>
                        </ol>
                    </div>
                </div>



            <div class="col-12">
               <div class="card">
                  <div class="card-body">
 
                     <div class="align-self-center">
                        <h3 class="card-title float-left">${sessionScope.employee.emp_name}
                           님의 근태 현황</h3><br>
                             
                        <div class=" align-self-center">
                         
                           <div class="dropdown float-right ">
                              <button class="btn btn-secondary dropdown-toggle"
                                 type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                 aria-haspopup="true" aria-expanded="false" >${select_date}</button>
                              <div class="dropdown-menu"
                                 aria-labelledby="dropdownMenuButton">
                                 <input type="button" class="dropdown-item" id="month1"
                                    name="month1"
                                    onclick="fnonclick($('input[name=month1]').val())" /> <input
                                    type="button" class="dropdown-item" id="month2"
                                    name="month2"
                                    onclick="fnonclick($('input[name=month2]').val())" /> <input
                                    type="button" class="dropdown-item" id="month3"
                                    name="month3"
                                    onclick="fnonclick($('input[name=month3]').val())" />
                              </div>
                           </div>
                        </div>

                     </div>
                     <script>
                        $(function() {
                           var date = new Date();
                           if (date.getMonth() < 10) {
                              var m = '0' + (date.getMonth() + 1);
                           } else {
                              var m = date.getMonth() + 1;
                           }
                           var y = date.getFullYear();
                           var form = '';
                           var today = new Date($.now());

                           console.log(date);
                           $('input[name=month1]').val(
                                 y + "년 " + m + "월");
                           if (m == 1) {
                              m = 12;
                           } else {
                              if (m < 11)
                                 m = '0' + (m - 1);
                              else
                                 m = m - 1;
                           }
                           ;
                           $('input[name=month2]').val(
                                 y + "년 " + m + "월");
                           if (m == 1) {
                              m = 12;
                           } else {
                              if (m < 11)
                                 m = '0' + (m - 1);
                              else
                                 m = m - 1;
                           }
                           ;
                           $('input[name=month3]').val(
                                 y + "년 " + m + "월");

                        });
                        function fnonclick(date) {

                           var d = date;

                           location.href = "${pageContext.request.contextPath}/attendance/selectTypeAttendance.do?select_date="
                                 + date;

                        };
                     </script>
                     </br>
                     </br>
                     </br>
                     </br>
                        
                     <div class="table-responsive">
                        <table class="table no-wrap">
                           <thead>
                              <tr>
                                 <th></th>
                                 <th>날짜</th>
                                 <th>출근</th>
                                 <th>퇴근</th>
                                 <th>지각</th>
                                 <th>조퇴</th>
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
                                    <td>${attend.atten_attLate}</td>
                                    <td>${attend.atten_leaveEarly}</td>
                                    <td>${attend.atten_hours}</td>
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