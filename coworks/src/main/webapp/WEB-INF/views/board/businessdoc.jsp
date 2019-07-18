<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 통합자료실</title>
<c:import url="../common/header.jsp" />
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">

				<!-- table -> -->
				<div class="row">
				<div class="col-12">
				<div class="card">
					<div class="card-body">
						<!-- <h4 class="card-title">COWORKS 통합자료실 > 업무문서</h4> -->
						<!-- -->
						<div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">COWORKS 통합자료실</h3>
                        
                   		</div>
						<!-- -->
<!-- 						<h6 class="card-subtitle">업무관련문서</h6> -->
						<div class="table-responsive">
							<br>
							<br>
							<table id="demo-foo-pagination"
								class="table toggle-arrow-tiny footable footable-4 footable-paging footable-paging-center breakpoint-sm"
								data-sorting="true" data-paging="true" style="">
								<thead>
									<tr class="footable-header">
										<th>번호</th>
										<th>제목</th>
										<th>날짜</th>
										<th>첨부파일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>index</td>
										<td>일일업무계획서</td>
										<td>2019-07-18</td>
										<td><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
									</tr>
									<tr>
										<td>index</td>
										<td>주간업무계획서</td>
										<td>2019-07-18</td>
										<td><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
									</tr>
									<tr>
										<td>index</td>
										<td>월간업무계획서</td>
										<td>2019-07-18</td>
										<td><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
									</tr>
									<tr>
										<td>index</td>
										<td>주간회의록</td>
										<td>2019-07-18</td>
										<td><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
									</tr>
									<tr>
										<td>index</td>
										<td>업무협조공문</td>
										<td>2019-07-18</td>
										<td><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
									</tr>
									<tr>
										<td>index</td>
										<td>개인별실적(목표)보고서</td>
										<td>2019-07-18</td>
										<td><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
									</tr>
									<tr>
										<td>index</td>
										<td>주간업무계획분석보고서</td>
										<td>2019-07-18</td>
										<td><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
									</tr>
									<tr>
										<td>index</td>
										<td>평가표</td>
										<td>2019-07-18</td>
										<td><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
									</tr>
								</tbody>
								<tfoot>
									<tr class="footable-paging">
										<td colspan="5"><div class="footable-pagination-wrapper">
												<ul class="pagination justify-content-center">
													<li class="footable-page-nav disabled" data-page="first"><a
														class="footable-page-link" href="#">≪</a></li>
													<li class="footable-page-nav disabled" data-page="prev"><a
														class="footable-page-link" href="#">?</a></li>
													<li class="footable-page-nav disabled"
														data-page="prev-limit"><a class="footable-page-link"
														href="#">...</a></li>
													<li class="footable-page visible active" data-page="1"><a
														class="footable-page-link" href="#">1</a></li>
													<li class="footable-page visible" data-page="2"><a
														class="footable-page-link" href="#">2</a></li>
													<li class="footable-page visible" data-page="3"><a
														class="footable-page-link" href="#">3</a></li>
													<li class="footable-page visible" data-page="4"><a
														class="footable-page-link" href="#">4</a></li>
													<li class="footable-page visible" data-page="5"><a
														class="footable-page-link" href="#">5</a></li>
													<li class="footable-page" data-page="6"><a
														class="footable-page-link" href="#">6</a></li>
													<li class="footable-page-nav" data-page="next-limit"><a
														class="footable-page-link" href="#">...</a></li>
													<li class="footable-page-nav" data-page="next"><a
														class="footable-page-link" href="#">?</a></li>
													<li class="footable-page-nav" data-page="last"><a
														class="footable-page-link" href="#">≫</a></li>
												</ul>
												<div class="divider"></div>
												<span class="label label-primary">1 of 6</span>
											</div></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
				<!-- table <- -->
				<!-- New Table -> -->
				
				
				
 				<div class="card">
					<div class="card-body">
						<h4 class="card-title">COWORKS 통합자료실 > 업무문서</h4>
						<h6 class="card-subtitle">업무관련문서</h6>
						<div id="staticgrid" class="jsgrid"
							style="position: relative; height: 500px; width: 100%;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar"> <br><br>
								<table class="jsgrid-table table table-striped table-hover">
									<tr class="jsgrid-header-row">
										<th class="jsgrid-header-cell jsgrid-header-sortable"
											style="width: 100px;">번호</th>
										<th
											class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
											style="width: 250px;">제목</th>
										<th class="jsgrid-header-cell jsgrid-header-sortable"
											style="width: 200px;">날짜</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 100px;">첨부파일</th>
									</tr>
									<tr class="jsgrid-filter-row" style="display: none;">
										<td class="jsgrid-cell" style="width: 150px;"><input
											type="text" class="form-control input-sm"></td>
										<td class="jsgrid-cell jsgrid-align-right"
											style="width: 70px;"><input type="number"
											class="form-control input-sm"></td>
										<td class="jsgrid-cell" style="width: 200px;"><input
											type="text" class="form-control input-sm"></td>
										<td class="jsgrid-cell jsgrid-align-center"
											style="width: 100px;"></td>
									</tr>
									<tr class="jsgrid-insert-row" style="display: none;">
										<td class="jsgrid-cell" style="width: 150px;"><input
											type="text" class="form-control input-sm"></td>
										<td class="jsgrid-cell jsgrid-align-right"
											style="width: 70px;"><input type="number"
											class="form-control input-sm"></td>
										<td class="jsgrid-cell" style="width: 200px;"><input
											type="text" class="form-control input-sm"></td>
										<td class="jsgrid-cell jsgrid-align-center"
											style="width: 100px;"></td>
									</tr>
								</table>
							</div>
							<div class="jsgrid-grid-body" style="height: 370px;">
								<table class="jsgrid-table table table-striped table-hover">
									<tbody>
										<tr class="jsgrid-row">
											<td class="jsgrid-cell" style="width: 100px;">index</td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 250px;">일일업무계획서</td>
											<td class="jsgrid-cell" style="width: 200px;">2019-07-18</td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
										</tr>
										<tr class="jsgrid-alt-row">
											<td class="jsgrid-cell" style="width: 100px;">index</td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 250px;">주간업무계획서</td>
											<td class="jsgrid-cell" style="width: 200px;">2019-07-18</td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
										</tr>
										<tr class="jsgrid-row">
											<td class="jsgrid-cell" style="width: 100px;">index</td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 250px;">월간업무계획서</td>
											<td class="jsgrid-cell" style="width: 200px;">2019-07-18</td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
										</tr>
										<tr class="jsgrid-alt-row">
											<td class="jsgrid-cell" style="width: 100px;">index</td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 250px;">주간회의록</td>
											<td class="jsgrid-cell" style="width: 200px;">2019-07-18</td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
										</tr>
										<tr class="jsgrid-row">
											<td class="jsgrid-cell" style="width: 100px;">index</td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 250px;">업무협조공문</td>
											<td class="jsgrid-cell" style="width: 200px;">2019-07-18</td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
										</tr>
										<tr class="jsgrid-alt-row">
											<td class="jsgrid-cell" style="width: 100px;">index</td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 250px;">개인별실적(목표)보고서</td>
											<td class="jsgrid-cell" style="width: 200px;">2019-07-18</td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
										</tr>
										<tr class="jsgrid-row">
											<td class="jsgrid-cell" style="width: 100px;">index</td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 250px;">주간업무게획분석보고서</td>
											<td class="jsgrid-cell" style="width: 200px;">2019-07-18</td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
										</tr>
										<tr class="jsgrid-alt-row">
											<td class="jsgrid-cell" style="width: 100px;">index</td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 250px;">평가표</td>
											<td class="jsgrid-cell" style="width: 200px;">2019-07-18</td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><div data-icon="&#xe019"
												class="linea-icon linea-basic">
												<div></td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="jsgrid-pager-container">
								<div class="jsgrid-pager">
									Pages: <span
										class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a
										href="javascript:void(0);">First</a></span> <span
										class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a
										href="javascript:void(0);">Prev</a></span> <span
										class="jsgrid-pager-page jsgrid-pager-current-page">1</span><span
										class="jsgrid-pager-page"><a href="javascript:void(0);">2</a></span><span
										class="jsgrid-pager-page"><a href="javascript:void(0);">3</a></span><span
										class="jsgrid-pager-page"><a href="javascript:void(0);">4</a></span><span
										class="jsgrid-pager-page"><a href="javascript:void(0);">5</a></span>
									<span class="jsgrid-pager-nav-button"><a
										href="javascript:void(0);">Next</a></span> <span
										class="jsgrid-pager-nav-button"><a
										href="javascript:void(0);">Last</a></span> &nbsp;&nbsp; 1 of 5
								</div>
							</div>
						
						</div>
					</div>
				</div>
			<!--	New Table <- -->



			</div></div>
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