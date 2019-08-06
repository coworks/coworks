<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 연락처</title>
<c:import url="../common/header.jsp" />
<style>
ul {
	list-style: none;
}

.over {
	color: #FF9900;
	font-weight: bold;
	font-size: 20px;
}
</style>
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">

				<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<h3 class="text-themecolor mb-0 mt-0">COWORKS</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									연락처</span></li>
						</ol>
					</div>
				</div>

				<!-- 시작 -->

				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-body">
							<!-- Nav tabs -->
							<div class="vtabs col-lg-12">
								<ul class="nav nav-tabs tabs-vertical" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home4" role="tab"
										aria-selected="true"><span class="hidden-sm-up"><i
												class="ti-home"></i></span> <span class="hidden-xs-down">전체조회</span>
									</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#profile4" role="tab" aria-selected="false"><span
											class="hidden-sm-up"><i class="ti-user"></i></span> <span
											class="hidden-xs-down">부서별 조회</span></a></li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">

									<!-- 전체 조회 -->
									<div class="tab-pane active" id="home4" role="tabpanel">
										<div class="p-3">

											<div id="myTable_wrapper"
												class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
												<div class="row">
													<div class="col-sm-12 col-md-6">
														<div class="dataTables_length" id="myTable_length">

														</div>
													</div>
													<div class="col-sm-12 col-md-6">
														<div class="row" style="float: right">
															<select class="form-control custom-select"
																style="width: 25%" id="searchCondition"
																name="searchCondition">
																<option value="">----</option>
																<option value="empname">이름</option>
																<option value="jobtitle">직급</option>
															</select>
															<div class="input-group"
																style="width: 60%; margin-left: 20px;">
																<input type="search" id="keyword" class="form-control"
																	style="width: 70%">
																<button class="btn btn-info" type="button"
																	onclick="search();">검색</button>
															</div>
														</div>
													</div>
												</div>
												<br>
												<div class="row">
													<div class="col-sm-12">
														<table id="myTable"
															class="table table-bordered table-striped dataTable no-footer"
															role="grid" aria-describedby="myTable_info">
															<thead>
																<tr role="row">
																	<th style="width: 197px; font-weight: bold;">이름</th>
																	<th style="width: 144px; font-weight: bold;">부서</th>
																	<th style="width: 144px; font-weight: bold;">직급</th>
																	<th style="width: 144px; font-weight: bold;">연락처</th>
																	<th style="width: 215px; font-weight: bold;">이메일</th>

																</tr>
															</thead>
															<tbody>
																<c:forEach items="${list}" var="e">
																	<tr role="row">
																		<td>${e.emp_name}</td>
																		<td>${e.dept_name}</td>
																		<td>${e.job_title}</td>
																		<td>${e.emp_phone}</td>
																		<td>${e.emp_email}</td>
																	</tr>
																</c:forEach>

															</tbody>
														</table>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-12 col-md-5"></div>
													<div class="col-sm-12 col-md-7">


														<c:out value="${pageBar}" escapeXml="false" />


													</div>
												</div>
											</div>










										</div>
									</div>
									<!-- 전제 조회 끝 -->
									<!-- 부서별 조회 -->
									<div class="tab-pane p-3" id="profile4" role="tabpanel">
										<!--  -->
										<div class="row">
											<div class="card-body inbox-panel col-2">
												<ul class="list-group list-group-full">

													<!-- active -->
													<c:forEach items="${departmentList}" var="d">
														<li class="list-group-item has-arrow depts"
															id="${d.dept_code }" name="${d.dept_name }"
															style="font-size: 20px;"><i
															class="fas fa-caret-right"></i>&nbsp; <span
															class="text-info" id="append" style="font-weight: bold">${d.dept_name }부서
																<input name="dept_code" value="${d.dept_code }" hidden>
														</span>
															<div></div></li>
														<div></div>
													</c:forEach>
												</ul>
											</div>
											<!--  -->
											<div class="col-sm-10 pt-4">
												<table id="myTable"
													class="table table-bordered table-striped dataTable no-footer"
													role="grid" aria-describedby="myTable_info">
													<thead>
														<tr role="row">
															<th style="width: 197px; font-weight: bold;">이름</th>
															<th style="width: 144px; font-weight: bold;">부서</th>
															<th style="width: 144px; font-weight: bold;">직급</th>
															<th style="width: 144px; font-weight: bold;">연락처</th>
															<th style="width: 215px; font-weight: bold;">이메일</th>

														</tr>
													</thead>
													<tbody>
														<c:forEach items="${list}" var="e">
															<tr role="row">
																<td>${e.emp_name}</td>
																<td>${e.dept_name}</td>
																<td>${e.job_title}</td>
																<td>${e.emp_phone}</td>
																<td>${e.emp_email}</td>
															</tr>
														</c:forEach>

													</tbody>
												</table>
											</div>

											
										<!-- 부서별 조회 끝 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>



























				<!-- 끝 -->

			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />

	<script>
	/* 	$(".depts")
				.on(
						"click",
						function() {
							console.log($(this).attr('id'));
							var dept_code = $(this).attr('id');
							var dept_name = $(this).attr('name');
							console.log(dept_name);
							$
									.ajax({
										url : "${pageContext.request.contextPath}/dm/ajxDept.do",
										data : {
											dept_code : dept_code
										},
										success : function(data) {
											if ($("#" + dept_code).next()
													.children().length > 0) {
												$("#" + dept_code).next()
														.empty();
											} else {
												$("#" + dept_code).next()
														.empty();
												console.log("1");
												for (var i = 0; i < data.length; i++) {

													/* content.append("<li>"+data[i].emp_no+"</li>"); */
													var tbody = $(
															"#" + dept_code)
															.next();/* $("#append"); */
													var content = $("<ul>");
													var emp_name = data[i].emp_name;
													var emp_no = data[i].emp_no;
													var emp = data[i];
													content
															.append("<li class='insertTo' name='insertTo' id='"+data[i].emp_no+"' value="+data[i].emp_name+">"
																	+ data[i].emp_name
																	+ " : "
																	+ data[i].job_title
																	+ "</li>");
													tbody.append(content);
												}
												console.log(" 완료");
											}
										}
									});
						}); */

		$(document).on("mouseover", function() {
			$('.insertTo').addClass('out')
			$('.insertTo').hover(function() {
				$('ul').has('li').css('cursor', 'pointer');
				$(this).addClass('over');
			}, function() {
				$(this).removeClass('over');
			});
		});
	</script>
</body>
</html>