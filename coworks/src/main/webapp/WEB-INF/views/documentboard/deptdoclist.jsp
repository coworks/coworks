<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 부서별자료실</title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
<style>
	.detail-box{
	    border-bottom: solid #E6E6E6 1px !important;
	}
	.detail-list{
		border: solid #E6E6E6 1px !important;
		padding : 85px 0;
		text-align : center;
		margin-top : 20px;
	}
	.text-al-ct {
		text-align : center;
	}
	
	.text-al-left {
		text-align : left;
	}
</style>
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">

				<!-- 시작 -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                         	<div class="card-body">
                         
                          <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">COWORKS 부서별 자료실</h3>
                      
                    </div>
                    <div class="col-md-6 col-4 align-self-center">
                        <button class="right-side-toggle waves-effect waves-light btn-info btn-circle btn-sm float-right ml-2"><i class="ti-settings text-white"></i></button>
                        
                    </div>
                </div>
                        </div>
                            <div class="row">
                            
                            
                            
                               <div class="col-xlg-2 col-lg-4 col-md-4">
                                    <div class="card-body inbox-panel"><a href="app-compose.html" class="btn btn-danger mb-3 p-2 btn-block waves-effect waves-light">자료실 추가하기</a>
                                        <ul class="list-group list-group-full">
                                            <li class="list-group-item">
                                            		부서별 자료실
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0)"> <i class="mdi mdi-file-document-box"></i> 개발본부 &nbsp;&nbsp; </a><i class="fa fa-star text-warning"></i><span class="badge badge-danger ml-auto">new</span>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0)"> <i class="mdi mdi-file-document-box"></i> 운영기획실 &nbsp;&nbsp; </a><span class="badge badge-danger ml-auto">new</span></li>
                                            <li class="list-group-item ">
                                                <a href="javascript:void(0)"> <i class="mdi mdi-file-document-box"></i> 영업총괄부 &nbsp;&nbsp; </a><span class="badge badge-danger ml-auto">new</span>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0)"> <i class="mdi mdi-file-document-box"></i> 마케팅본부 &nbsp;&nbsp; </a><span class="badge badge-danger ml-auto">new</span>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0)"> <i class="mdi mdi-file-document-box"></i> 사업기획실 &nbsp;&nbsp; </a><span class="badge badge-danger ml-auto">new</span>
                                            </li>
                                        </ul>
                                       
                                    </div>
                                </div>
                              
                                <div class="col-xlg-10 col-lg-8 col-md-8">
                                    <div class="card-body">
                                        <div class="btn-group mb-2 mr-2" role="group" aria-label="Button group with nested dropdown">
                                           <!--  <button type="button" class="btn btn-secondary font-18 text-dark"><i class="mdi mdi-inbox-arrow-down"></i></button>
                                            <button type="button" class="btn btn-secondary font-18 text-dark"><i class="mdi mdi-alert-octagon"></i></button>
                                            <button type="button" class="btn btn-secondary font-18 text-dark"><i class="mdi mdi-delete"></i></button> -->
                                        </div>
                                        <div class="btn-group mb-2 mr-2" role="group" aria-label="Button group with nested dropdown">
                                            <div class="btn-group" role="group">
                                               <!--  <button id="btnGroupDrop1" type="button" class="btn btn-secondary text-dark dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-folder font-18 "></i> </button>
                                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> <a class="dropdown-item" href="#">Dropdown link</a> <a class="dropdown-item" href="#">Dropdown link</a> </div> -->
                                            </div>
                                            <div class="btn-group" role="group">
                                                <!-- <button id="btnGroupDrop1" type="button" class="btn text-dark btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-label font-18"></i> </button>
                                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> <a class="dropdown-item" href="#">Dropdown link</a> <a class="dropdown-item" href="#">Dropdown link</a> </div> -->
                                            </div>
                                        </div>
                                       <!--  <button type="button " class="btn btn-secondary mr-2 mb-2 text-dark"><i class="mdi mdi-reload font-18"></i></button> -->
                                        <div class="btn-group mb-2" role="group">
                                            <!-- <button id="btnGroupDrop1" type="button" class="btn mb-2 text-dark btn-secondary p-2 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> More </button>
                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> <a class="dropdown-item" href="#">Mark as all read</a> <a class="dropdown-item" href="#">Dropdown link</a> </div> -->
                                        </div>
                                    </div>
									<div class="card-body pt-0">
									<div style="text-align : right;"><a href="deptdocdetail.do" class="btn btn-danger waves-effect waves-light">(부서별)상세보기</a></div>
									<div style="text-align : right;"><a href="deptdocForm.do" class="btn btn-danger waves-effect waves-light">글쓰기</a></div>
									
										<!-- 부서 선택 전 (데이터 없는 부분) 뷰 -> -->
										<div class="detail-box">
											<div class="detail-list">
												<!-- 내역이 없을 때 -->
												<div>
													<img
														src="${pageContext.request.contextPath}/resources/images/boardImg/nothing.png"
														style="width: 50px; vertical-align: middle; border: 0" />
												</div>
												<h5 style="margin: 10px 0;">내역이 없습니다.</h5>

											</div>
										</div><!-- 부서 선택 전 (데이터 없는 부분) 뷰 <- -->


										<div class="card b-all shadow-none">
											<div class="inbox-center b-all table-responsive">
												<!-- 데이터가 있을 때 -->
												<table class="table table-hover no-wrap table-hover text-al-ct">
													<tbody>
														<tr class="unread">

															<td style="width: 40px" class="hidden-xs-down"><i
																class="fa fa-star-o"></i></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">12:30 PM</td>
														</tr>
														<tr class="unread">

															<td class="hidden-xs-down"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 13</td>
														</tr>
														<tr class="unread">

															<td class="hidden-xs-down"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 12</td>
														</tr>
														<tr>
															<td class="hidden-xs-down"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 12</td>
														</tr>
														<tr>

															<td class="hidden-xs-down"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 12</td>
														</tr>
														<tr>

															<td class="hidden-xs-down"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 11</td>
														</tr>
														<tr>

															<td class="hidden-xs-down"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts "><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 11</td>
														</tr>
														<tr>

															<td class="hidden-xs-down"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 11</td>
														</tr>
														<tr>

															<td class="hidden-xs-down"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 10</td>
														</tr>
														<tr>

															<td class="hidden-xs-dow"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 10</td>
														</tr>
														<tr>

															<td class="hidden-xs-down"></td>
															<td class="hidden-xs-down">부서명</td>
															<td class="max-texts text-al-left"><a
																href="app-email-detail.html">Lorem ipsum
																	perspiciatis unde omnis iste natus error sit voluptatem</a></td>
															<td class="hidden-xs-down"><i
																class="fa fa-paperclip"></i></td>
															<td class="text-right">May 10</td>
														</tr>

													</tbody>
												</table>
											</div>
										</div>
									</div>
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
                <div class="right-sidebar" style="overflow: visible;">
                    <div class="slimScrollDiv" style="position: relative; overflow: visible hidden; width: auto; height: 100%;"><div class="slimscrollright" style="overflow: hidden; width: auto; height: 100%;">
                        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
                        <div class="r-panel-body">
                            <ul id="themecolors" class="mt-3">
                                <li><b>With Light sidebar</b></li>
                                <li><a href="javascript:void(0)" data-theme="default" class="default-theme">1</a></li>
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
                                <li><a href="javascript:void(0)" data-theme="megna-dark" class="megna-dark-theme ">12</a></li>
                            </ul>
                            <ul class="mt-3 chatonline">
                                <li><b>Chat option</b></li>
                                <li>
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
                                </li>
                            </ul>
                        </div>
                    </div><div class="slimScrollBar" style="background: rgb(220, 220, 220); width: 5px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                </div>
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            
				
				
				
				<!-- 끝 -->
				
			</div>			
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
		<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/db.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.js"></script>
	
</body>
</html>