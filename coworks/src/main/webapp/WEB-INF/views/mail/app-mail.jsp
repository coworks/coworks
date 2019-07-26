<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 메일함</title>
<c:import url="../common/header.jsp" />
</head>

<style>
   .m-center{
      margin: 0 auto;
   }
</style>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">   
		<div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <c:import url ="mail-location.jsp"/>
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
                                <!-- lg-8 md-8 -->
                                <div class="col-xlg-10 col-lg-9 col-md-9">
                                   <c:import url="mail-topbar.jsp"/>
                                    <!-- 
                                    <td class="max-texts"><a href="app-email-detail.html"><span class="label label-info mr-2">Work</span> Lorem ipsum perspiciatis unde omnis iste natus error sit voluptatem</a></td>
                                    <span class="label label-info mr-2">내용 jstl 로 추가</span> 
                                    <span class="label label-warning">내용 jstl 로 추가</span>
                                    <span class="label label-purple">내용 jstl 로 추가</span>
                                    <span class="label label-danger">내용 jstl 로 추가</span>
                                    <span class="label label-success">내용 jstl 로 추가</span>  얘가 라벨 
                                    
                                     <td style="width:40px" class="hidden-xs-down"><i class="fa fa-star-o"></i></td>
                                    <i class="fa fa-star text-warning"></i> 얘가 별
                                    -->
                                    <div class="card-body pt-0">
                                        <div class="card b-all shadow-none">
                                            <div class="inbox-center b-all table-responsive">
                                                <table class="table table-hover no-wrap">
                                                    <tbody>
                                                    <c:forEach items="${mails}" var="m"> 
                                                        <%-- <a href="/mail/selectOneMail.do/${m.getMail_no()}">  --%>
                                                    	<input type="text" name="mail_no" value="${m.getMail_no()}" id="mail_no" hidden/>
                                                        <tr class="unread mailRow" >
                                                            <td style="width:40px">
                                                                <div class="checkbox">
                                                                    <input type="checkbox" id="checkbox${m.getMail_no() }" name="chkMails" value="check${m.getMail_no() }">
                                                                    <label for="checkbox${m.getMail_no() }"></label>
                                                                </div>
                                                            </td>
                                                            <td style="width:40px" class="hidden-xs-down"><i class="fa fa-star-o"></i></td>
                                                           	
                                                            <td class="hidden-xs-down"> 
                                                            
															<c:if test="${m.getMail_from_email().length() gt 30}">
                                                            	${m.getMail_from_email().substring(0,30) } ...
                                                            </c:if>
                                                          	<c:if test="${m.getMail_from_email().length() le 30}">
                                                          		${m.getMail_from_email() }
                                                          	</c:if></td><!-- <a href="app-email-detail.do"/> -->
                                                            <td class="max-texts"  onclick="location.href='${pageContext.request.contextPath}/mail/selectOneMail.do/${m.getMail_no()}/${type}'"> <span class="label label-info mr-2">Work</span> 
                                                          	<c:if test="${m.getMail_subject().length() gt 30}">
                                                            	${m.getMail_subject().substring(0,10) } ...
                                                            </c:if>
                                                          	<c:if test="${m.getMail_subject().length()le 30}">
                                                          		${m.getMail_subject() }
                                                          	</c:if> 
                                                          	
                                                            </td>
                                                           
                                                            <td class="hidden-xs-down"><i class="fa fa-paperclip"></i></td>
                                                            <td class="text-right"><%-- <fmt:formatDate value=" ${m.getMail_sendDate()}" pattern="MM/dd/yyyy" /> --%> </td>
                                                        </tr>  
                                                      <!--   </a>  -->
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 페이지네이션 -->
                                    <c:out value="${pageBar}" escapeXml="false"/>
                                    <!-- <nav aria-label="Page navigation example m-center">
                                            <ul class="pagination">
                                                <li class="page-item">
                                                    <a class="page-link" href="javascript:void(0)" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="javascript:void(0)">1</a></li>
                                                <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="javascript:void(0)" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <div class="right-sidebar">
                    <div class="slimscrollright">
                        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
                        <div class="r-panel-body">
                            <ul id="themecolors" class="mt-3">
                                <li><b>With Light sidebar</b></li>
                                <!-- <li><a href="javascript:void(0)" data-theme="default" class="default-theme">1</a></li>
                                <li><a href="javascript:void(0)" data-theme="green" class="green-theme">2</a></li>
                                <li><a href="javascript:void(0)" data-theme="red" class="red-theme">3</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue" class="blue-theme working">4</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple" class="purple-theme">5</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna" class="megna-theme">6</a></li>
                                <li class="d-block mt-4"><b>With Dark sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default-dark" class="default-dark-theme">7</a></li>
                                <li><a href="javascript:void(0)" data-theme="green-dark" class="green-dark-theme">8</a></li>
                                <li><a href="javascript:void(0)" data-theme="red-dark" class="red-dark-theme">9</a></li>
                                <li><a href="javascript:void(0)" data-theme="blue-dark" class="blue-dark-theme">10</a></li>
                                <li><a href="javascript:void(0)" data-theme="purple-dark" class="purple-dark-theme">11</a></li>
                                <li><a href="javascript:void(0)" data-theme="megna-dark" class="megna-dark-theme ">12</a></li> -->
                            </ul>
                            <ul class="mt-3 chatonline">
                                <li><b>Chat option</b></li>
                               <!--  <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/1.jpg" alt="user-img" class="img-circle"> <span>Varun Dhavan <small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/2.jpg" alt="user-img" class="img-circle"> <span>Genelia Deshmukh <small class="text-warning">Away</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/3.jpg" alt="user-img" class="img-circle"> <span>Ritesh Deshmukh <small class="text-danger">Busy</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/4.jpg" alt="user-img" class="img-circle"> <span>Arijit Sinh <small class="text-muted">Offline</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/5.jpg" alt="user-img" class="img-circle"> <span>Govinda Star <small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/6.jpg" alt="user-img" class="img-circle"> <span>John Abraham<small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/7.jpg" alt="user-img" class="img-circle"> <span>Hritik Roshan<small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../assets/images/users/8.jpg" alt="user-img" class="img-circle"> <span>Pwandeep rajan <small class="text-success">online</small></span></a>
                                </li> -->
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<!-- <script>
		$(".mailRow").on("click",function(){
			var m = $(this).val();
			var mail_no = $("#mailRow").eq(0);
			console.log(m);/* 
			console.log(mail_no); */
			/* location.href="/mail/selectOneMail.do/${m.getMail_no()}"; */
		});
		
	</script> -->
</body>
</html>