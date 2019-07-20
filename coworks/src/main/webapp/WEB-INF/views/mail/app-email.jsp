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
                        <h3 class="text-themecolor mb-0 mt-0">메일함</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">메인페이지</a></li>
                            <li class="breadcrumb-item active">메일함</li>
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
                                <div class="col-xlg-2 col-lg-4 col-md-4">
                                    <div class="card-body inbox-panel"><a href="app-compose.do" class="btn btn-danger mb-3 p-2 btn-block waves-effect waves-light">메일쓰기</a>
                                        <ul class="list-group list-group-full">
                                            <li class="list-group-item active"> <a href="javascript:void(0)"><i class="mdi mdi-gmail"></i> 메일함 </a><span class="badge badge-success ml-auto"> 읽지 않은 메일 수</span></li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0)"> <i class="mdi mdi-star"></i> 즐겨찾기 </a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0)"> <i class="mdi mdi-send"></i> 임시저장 </a><span class="badge badge-danger ml-auto">3</span></li>
                                            <li class="list-group-item ">
                                                <a href="javascript:void(0)"> <i class="mdi mdi-file-document-box"></i> 보낸 메일함 </a>
                                            </li>
                                            <li class="list-group-item">
                                                <a href="javascript:void(0)"> <i class="mdi mdi-delete"></i> 휴지통 </a>
                                            </li>
                                        </ul>
                                        <h3 class="card-title mt-5">분류</h3>
                                        <div class="list-group b-0 mail-list"> 
                                        	<a href="#" class="list-group-item"><span class="fa fa-circle text-info mr-2"></span>분류1</a> 
                                        	<a href="#" class="list-group-item"><span class="fa fa-circle text-warning mr-2"></span>분류2</a> 
                                        	<a href="#" class="list-group-item"><span class="fa fa-circle text-purple mr-2"></span>분류3</a> 
                                       	 	<a href="#" class="list-group-item"><span class="fa fa-circle text-danger mr-2"></span>분류4</a> 
                                       	 	<a href="#" class="list-group-item"><span class="fa fa-circle text-success mr-2"></span>분류5</a> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xlg-10 col-lg-8 col-md-8">
                                    <div class="card-body">
                                        <div class="btn-group mb-2 mr-2" role="group" aria-label="Button group with nested dropdown">
                                            <button type="button" class="btn btn-secondary font-18 text-dark"><i class="mdi mdi-inbox-arrow-down"></i></button>
                                            <button type="button" class="btn btn-secondary font-18 text-dark"><i class="mdi mdi-alert-octagon"></i></button>
                                            <button type="button" class="btn btn-secondary font-18 text-dark"><i class="mdi mdi-delete"></i></button>
                                        </div>
                                        <div class="btn-group mb-2 mr-2" role="group" aria-label="Button group with nested dropdown">
                                            <div class="btn-group" role="group">
                                                <button id="btnGroupDrop1" type="button" class="btn btn-secondary text-dark dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-folder font-18 "></i> </button>
                                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> <a class="dropdown-item" href="#">Dropdown link</a> <a class="dropdown-item" href="#">Dropdown link</a> </div>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <button id="btnGroupDrop1" type="button" class="btn text-dark btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-label font-18"></i> </button>
                                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> <a class="dropdown-item" href="#">Dropdown link</a> <a class="dropdown-item" href="#">Dropdown link</a> </div>
                                            </div>
                                        </div>
                                        <button type="button " class="btn btn-secondary mr-2 mb-2 text-dark"><i class="mdi mdi-reload font-18"></i></button>
                                        <div class="btn-group mb-2" role="group">
                                            <button id="btnGroupDrop1" type="button" class="btn mb-2 text-dark btn-secondary p-2 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> More </button>
                                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"> <a class="dropdown-item" href="#">Mark as all read</a> <a class="dropdown-item" href="#">Dropdown link</a> </div>
                                        </div>
                                    </div>
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
                                                        <tr class="unread">
                                                            <td style="width:40px">
                                                                <div class="checkbox">
                                                                    <input type="checkbox" id="checkbox0" value="check">
                                                                    <label for="checkbox0"></label>
                                                                </div>
                                                            </td>
                                                            <td style="width:40px" class="hidden-xs-down"><i class="fa fa-star-o"></i></td>
                                                            <td class="hidden-xs-down">작성자</td>
                                                            <td class="max-texts"> <a href="app-email-detail.html"/><span class="label label-info mr-2">Work</span> 여기가 타이틀 제목 입니다.</td>
                                                            <td class="hidden-xs-down"><i class="fa fa-paperclip"></i></td>
                                                            <td class="text-right"> 보낸 시간 </td>
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
                <div class="right-sidebar">
                    <div class="slimscrollright">
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
</body>
</html>