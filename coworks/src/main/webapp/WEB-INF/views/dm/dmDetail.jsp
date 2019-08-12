<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style>
   .m-center{
      margin: 0 auto;
   }
</style>
<meta charset="UTF-8">
<title>CO-WORKS : Insert title here</title>
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
               <%--  <c:import url ="dmLocation.jsp"/> --%>
                           <div class="row page-titles">
	<div class="col-md-6 col-8 align-self-center">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><span>메인페이지</span> <i
				class="fas fa-chevron-right"></i><span class="text-primary"> 쪽지 상세보기</span></li>
		</ol>
	</div>
</div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="row">
                                <c:import url="dmCommon.jsp"/>
                                <div class="col-xlg-10 col-lg-8 col-md-8">
                                   <%--  <c:import url="dmTopbar.jsp"/> --%>
									<div class="card-body">
                                   	</div>
                                    <div class="card-body pt-0">
                                        <div class="card b-all shadow-none">
                                            <div class="card-body">
                                                <h3 class="card-title mb-0 ">제목: ${dm.dm_subject}</h3>
                                            </div>
                                            <div>
                                                <hr class="mt-0">
                                            </div>
                                            <div class="card-body">
                                                <div class="d-flex mb-5">
                                                    <!-- <div>
                                                        <a href="javascript:void(0)"><img src="#" alt="user" width="40" class="img-circle" /></a>
                                                    </div> -->
                                                    <div class="pl-2">
                                                        <h4 class="mb-0">From : ${dm.dm_from_name } <small class="text-muted"> &lt;${dm.dm_from_dept } : ${dm.dm_from_job } &gt;</small>
                                                        To : ${emp.emp_name } <small class="text-muted"> &lt;${emp.dept_name } : ${emp.job_title } &gt;
                                                        </h4>
                                                        <small class="text-muted">Date: <fmt:formatDate value="${dm.dm_date}" pattern="yyyy-MM-dd / HH:mm" /></small>
                                                       
                                                    </div>
                                                </div>
                                               
                                                <p>${dm.dm_content}</p>
                                          		</div>
                                            <div>
                                                <hr class="mt-0">
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                   
                                                </div>
                                                    <!-- <p class="pb-3"> -->
                                                    <div >
                                                    <a href="${pageContext.request.contextPath}/dm/replyDm.do/${dm.dm_no}" id="btnAction" >
                                                    	<div class="btn waves-effect waves-light btn-primary col-2"  >답장</div></a>
                                                   <a href="${pageContext.request.contextPath}/dm/forwardDm.do/${dm.dm_no}">
                                                   		<div class="btn waves-effect waves-light btn-warning col-2"  id="btnAction" >전달</div></a></a>
                                                    </div>
                                                     <!-- </p> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
</body>
</html>