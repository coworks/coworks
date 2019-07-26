<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.net.InetAddress, com.kh.coworks.attendance.model.vo.Attendance"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>CO-WORKS</title>
<!-- Calendar CSS -->
<link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.css" rel="stylesheet" />
<c:import url="views/common/header.jsp" />
</head>

<body class="fix-header fix-sidebar card-no-border">
   <!-- ============================================================== -->
   <!-- Main wrapper - style you can find in pages.scss -->
   <!-- ============================================================== -->
   <div id="main-wrapper">
      <c:import url="views/common/topbar.jsp" />
      <c:import url="views/common/sidebar.jsp" />
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper">
         <!-- ============================================================== -->
         <!-- Container fluid  -->
         <!-- ============================================================== -->
         <div class="container-fluid">
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->

            <!-- Row -->
            <div class="row">
               <div class="col-lg-4">
                  <div class="card">
                     <div class="card-body">
                        <div class="m-2">
                           <jsp:useBean id="now" class="java.util.Date" />
                           <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                           <h4 class="card-title">
                              <c:out value="${today}" />
                           </h4>
                           <p class="card-text" id="time">
                              출근 시간 : ${atten.atten_attTime }    </br>
                              IP :${atten.atten_attIP }         
                              
                            
                            </p>
                           <button type="button" class="btn waves-effect waves-light btn-block btn-outline-danger">퇴근하기</button>
                        </div>
                     </div>
                  </div>
                  <div class="card">
                     <div class="card-body">
                        <div class="m-2 p-2">
                           <h4 class="card-title">설문조사</h4>
                           <p class="card-text">이 페이지가 마음에 드시나요?!</p>
                           <p class="card-text">
                              <small class="text-muted">2019-07-01 ~ 2019-07-31</small>
                           </p>
                           <h5 class="mt-4">
                              YES!!<span class="float-right">85%</span>
                           </h5>
                           <div class="progress ">
                              <div class="progress-bar bg-success wow animated progress-animated" style="width: 85%; height: 6px;" role="progressbar">
                                 <span class="sr-only">60% Complete</span>
                              </div>
                           </div>
                           <h5 class="mt-4">
                              No :(<span class="float-right">15%</span>
                           </h5>
                           <div class="progress ">
                              <div class="progress-bar bg-danger wow animated progress-animated" style="width: 15%; height: 6px;" role="progressbar">
                                 <span class="sr-only">60% Complete</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-8">
                  <div class="card">
                     <div class="card-body">
                        <div id="calendar"></div>
                        <!-- BEGIN MODAL -->
                        <div class="modal fade none-border" id="my-event">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <h4 class="modal-title">
                                       <strong>Add Event</strong>
                                    </h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                 </div>
                                 <div class="modal-body"></div>
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-white waves-effect" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                    <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <!-- Modal Add Category -->
                        <div class="modal fade none-border" id="add-new-event">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <h4 class="modal-title">
                                       <strong>Add</strong> a category
                                    </h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                 </div>
                                 <div class="modal-body">
                                    <form>
                                       <div class="row">
                                          <div class="col-md-6">
                                             <label class="control-label">Category Name</label> <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
                                          </div>
                                          <div class="col-md-6">
                                             <label class="control-label">Choose Category Color</label>
                                             <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                <option value="success">Success</option>
                                                <option value="danger">Danger</option>
                                                <option value="info">Info</option>
                                                <option value="primary">Primary</option>
                                                <option value="warning">Warning</option>
                                                <option value="inverse">Inverse</option>
                                             </select>
                                          </div>
                                       </div>
                                    </form>
                                 </div>
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                                    <button type="button" class="btn btn-white waves-effect" data-dismiss="modal">Close</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <!-- END MODAL -->
                     </div>
                  </div>
               </div>

            </div>

            <!-- ============================================================== -->
            <!-- End PAge Content -->
            <!-- ============================================================== -->

         </div>
         <!-- ============================================================== -->
         <!-- End Container fluid  -->
         <!-- ============================================================== -->
         <c:import url="views/common/footer.jsp" />
      </div>
      <!-- ============================================================== -->
      <!-- End Page wrapper  -->
      <!-- ============================================================== -->
   </div>
   <!-- ============================================================== -->
   <!-- End Wrapper -->
   <!-- ============================================================== -->
   <!-- ============================================================== -->
   <!-- All Jquery -->
   <!-- ============================================================== -->
   <!-- ============================================================== -->
   <!-- This page plugins -->
   <!-- ============================================================== -->
   <c:import url="views/common/bottomJquery.jsp" />
   <!-- Calendar JavaScript -->
   <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script>
   <script src='${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/fullcalendar.min.js'></script>
   <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/jquery.fullcalendar.js"></script>
   <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/calendar/dist/cal-init.js"></script>
</body>

</html>