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
<title>CO-WORKS : 메일 상세 보기</title>
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
                <c:import url ="mail-location.jsp"/>
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
                                <c:import url="mail-common.jsp"/>
                                <div class="col-xlg-10 col-lg-8 col-md-8">
                                    <%-- <c:import url="mail-topbar.jsp"/> --%>
                                    <div class="card-body">
                                   	</div>
                                    <div class="card-body pt-0">
                                        <div class="card b-all shadow-none">
                                            <div class="card-body">
                                                <h3 class="card-title mb-0">제목: ${mail.getMail_subject()}</h3>
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
                                                        <h4 class="mb-0">From : ${mail.getMail_name() } <small class="text-muted"> &lt;${mail.getMail_from_email() } &gt;</small></h4>
                                                        <small class="text-muted">Date: ${mail.getMail_sendDate()}</small>
                                                    </div>
                                                </div>
                                                ${mail.getMail_content()}
                                          		</div>
                                            <div>
                                                <hr class="mt-0">
                                            </div>
                                           
                                            
                                            <div class="card-body">
                                                <h4><i class="fa fa-paperclip mr-2 mb-2"></i> Attachments <span>${attachList.size() }</span></h4>
                                                <div class="row" style="padding-left:4%">
                                                
                                                 
                                      	
                                                    <c:forEach items="${attachList}" var="at">
														<a href= "<c:url value='/mail/fileDownload?name=${at.attach_oriname }&path=${at.attach_path}/${at.attach_rename }'/>">
														<div 
															class="btn btn-outline-primary waves-effect waves-light">
															<i class="ti-download" style="color: black"></i>&nbsp;&nbsp;
															${at.attach_oriname }
														</div>&nbsp; 
														</a>
														</c:forEach>
							
                                                </div>
                                                
                                                
                                                
                                                <div class="b-all mt-3 p-3">
                                                    <p class="pb-3">click here to <a href="${pageContext.request.contextPath}/mail/replyMail.do/${mail.getMail_no()}/${type}">Reply</a>
                                                     or <a href="${pageContext.request.contextPath}/mail/forwardMail.do/${mail.getMail_no()}/${type}">Forward</a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             
			</div>
			<c:import url="../common/footer.jsp" />
			<script>

			</script>
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
</body>
</html>