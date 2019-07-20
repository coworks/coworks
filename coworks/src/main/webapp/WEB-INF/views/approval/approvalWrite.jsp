<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/header.jsp" />
<title>CO-WORKS : 결재 서류작성하기</title>
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">결재 서식 선택하기</h4>
								<div class="row">
									<div class="col-md-6 col-lg-4">

										<!-- <form> -->
										<div class="form-group">
											<label for="input-search" class="sr-only"></label> <input type="input" class="form-control" id="input-search" placeholder="검색하기" value="">
										</div>
										<div style="display: none;">
											<input type="checkbox" class="checkbox" id="chk-ignore-case" value="false" checked="checked"> <input type="checkbox" class="checkbox" id="chk-exact-match" value="false"> <input type="checkbox" class="checkbox" id="chk-reveal-results" value="false" checked="checked">
										</div>
										<button type="button" class="btn btn-success" id="btn-search">검색하기</button>
										<button type="button" class="btn btn-default" id="btn-clear-search">초기화</button>
										<!-- </form> -->
									</div>

									<div class="col-md-6 col-lg-4">
										<h2>Tree</h2>
										<div id="treeview-searchable" class="treeview">
											<ul class="list-group">
												<li class="list-group-item node-treeview-searchable" data-nodeid="0" style="color: undefined; background-color: undefined;"><span class="icon expand-icon ti-minus"></span><span class="icon node-icon fa fa-folder"></span>폴더1<span class="badge">2</span></li>
												<li class="list-group-item node-treeview-searchable node-selected" data-nodeid="1" style="color: #FFFFFF; background-color: #03a9f3;"><span class="indent"></span><span class="icon expand-icon ti-plus"></span><span class="icon node-icon fa fa-folder"></span>문서 1</li>
												<li class="list-group-item node-treeview-searchable" data-nodeid="7" style="color: undefined; background-color: undefined;"><span class="indent"></span><span class="icon glyphicon"></span><span class="icon node-icon fa fa-folder"></span>문서 2</li>
												<li class="list-group-item node-treeview-searchable" data-nodeid="9" style="color: undefined; background-color: undefined;"><span class="icon glyphicon"></span><span class="icon node-icon fa fa-folder"></span>폴더2</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="row">
								<div class="col-xlg-2 col-lg-3">
									<div class="card-body">
										<p class="card-text">서식 선택하기</p>
										<form>
											<div class="input-group">
												<input type="text" class="form-control" placeholder="검색하기" aria-label="" aria-describedby="basic-addon1">
												<div class="input-group-append ">
													<button class="btn btn-outline-secondary" type="button">
														<i class="ti-search"></i>
													</button>
												</div>
											</div>
										</form>

										<div class="pt-4">
											<select class="form-control" multiple="" size=10>
												<optgroup label="목록명">
													<option>서류명</option>
													<option>서류명</option>
													<option>서류명</option>
													<option>서류명</option>
												</optgroup>
												<optgroup label="목록명">
													<option>서류명</option>
													<option>서류명</option>
													<option>서류명</option>
													<option>서류명</option>
												</optgroup>

											</select>
										</div>
										<div align="center">
											<button type="submit" class="btn btn-success mt-4">확인</button>
										</div>
									</div>
								</div>
								<div class="col-xlg-10 col-lg-9 border-left">
									<div class="card-body">
										<h4 class="card-title">결재 서류작성하기</h4>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/bootstrap-treeview-master/dist/bootstrap-treeview.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/bootstrap-treeview-master/dist/bootstrap-treeview-init.js"></script>
</body>
</html>