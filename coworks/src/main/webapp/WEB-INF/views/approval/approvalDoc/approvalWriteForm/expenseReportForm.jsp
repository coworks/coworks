<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 결재 서류작성하기</title>
<c:import url="../../../common/header.jsp" />
<link href="${pageContext.request.contextPath }/resources/templates/assets/plugins/bootstrap-tagsinput/dist/bootstrap-tagsinput.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/templates/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/templates/assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/approval/css/approvalDoc.css" rel="stylesheet">
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../../../common/topbar.jsp" />
		<c:import url="../../../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">지출 품의서</h4>

								<form action="">
									<div class="table-responsive mt-2">

										<c:import url="./common/approvalHeader.jsp" />

										<table class="table table-bordered no-wrap">
											<tbody>
												<tr>
													<th scope="col" class="border">순번</th>
													<th scope="col" class="border">품명</th>
													<th scope="col" class="border">규격</th>
													<th scope="col" class="border">수량</th>
													<th scope="col" class="border">단가</th>
													<th scope="col" class="border">금액</th>
												</tr>
												<c:set var="index" value="0" />
												<tr>
													<c:set var="index" value="${index+1 }" />
													<td>
														<input type="number" value="${index }" readonly="readonly" class="form-control" />
													</td>
													<td>
														<input type="text" name="" class="form-control" />
													</td>
													<td>
														<input type="text" name="" class="form-control" />
													</td>
													<td>
														<input type="number" name="" class="form-control" />
													</td>
													<td>
														<input type="number" name="" class="form-control" />
													</td>
													<td>
														<input type="number" name="" class="form-control" />
													</td>
												</tr>
												<tr>
													<c:set var="index" value="${index+1 }" />
													<td>
														<input type="number" value="${index }" readonly="readonly" class="form-control" />
													</td>
													<td>
														<input type="text" name="" class="form-control" />
													</td>
													<td>
														<input type="text" name="" class="form-control" />
													</td>
													<td>
														<input type="number" name="" class="form-control" />
													</td>
													<td>
														<input type="number" name="" class="form-control" />
													</td>
													<td>
														<input type="number" name="" class="form-control" />
													</td>
												</tr>
												<tr>
													<c:set var="index" value="${index+1 }" />
													<td>
														<input type="number" value="${index }" readonly="readonly" class="form-control" />
													</td>
													<td>
														<input type="text" name="" class="form-control" />
													</td>
													<td>
														<input type="text" name="" class="form-control" />
													</td>
													<td>
														<input type="number" name="" class="form-control" />
													</td>
													<td>
														<input type="number" name="" class="form-control" />
													</td>
													<td>
														<input type="number" name="" class="form-control" />
													</td>
												</tr>

											</tbody>
										</table>

									</div>
									<div align="right">
										<input type="submit" value="제출하기" class="btn btn-info" /> <input type="reset" value="초기화" class="btn btn-danger" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:import url="../../../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../../../common/bottomJquery.jsp" />
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/bootstrap-treeview-master/dist/bootstrap-treeview.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/moment/moment.js"></script>
	<script>
		$('#slimtest1').slimScroll({
			height : '400px'
		});
		jQuery('#date-range').datepicker({
			toggleActive : true
		});
		$(function() {

			var Data = [ {
				text : '폴더명 1',
				tags : [ '2' ],
				nodes : [ {
					text : '서류명 1-1',
					icon : 'none'
				}, {
					text : '서류명 1-2',
					icon : 'none'
				} ]
			}, {
				text : '폴더명 2',
				tags : [ '7' ],
				nodes : [ {
					text : '서류명 2-1',
					icon : 'none'
				}, {
					text : '서류명 2-2',
					icon : 'none'
				} ]
			}, {
				text : '서류명 3',
				icon : 'glyphicon glyphicon-earphone',
				href : '#demo',
				tags : [ '11' ],
				nodes : [ {
					text : '서류명 2-1',
					icon : 'none'
				}, {
					text : '서류명 2-2',
					icon : 'none'
				} ]
			}, {
				text : 'Parent 4',
				icon : 'glyphicon glyphicon-cloud-download',
				href : '/demo.html',
				tags : [ '19' ],
				nodes : [ {
					text : '서류명 2-1',
					icon : 'none'
				}, {
					text : '서류명 2-2',
					icon : 'none'
				} ]
			}, {
				text : 'Parent 5',
				icon : 'glyphicon glyphicon-certificate',
				tags : [ 'available', '0' ],
				nodes : [ {
					text : '서류명 2-1',
					icon : 'none'
				}, {
					text : '서류명 2-2',
					icon : 'none'
				} ]
			} ];

			var $searchableTree = $('#treeview-searchable').treeview({
				selectedBackColor : "#03a9f3",
				onhoverColor : "rgba(0, 0, 0, 0.05)",
				expandIcon : 'ti-plus',
				collapseIcon : 'ti-minus',
				nodeIcon : 'fa fa-folder',
				data : Data,
				enableLinks : true,
				showTags : true
			});

			$('#treeview-searchable').treeview('collapseAll', {
				silent : true
			});

			var search = function(e) {
				var pattern = $('#input-search').val();
				var options = {
					ignoreCase : true,
					exactMatch : false,
					revealResults : true
				};
				var results = $searchableTree.treeview('search', [ pattern,
						options ]);

			}

			$('#btn-search').on('click', search);
			$('#input-search').on('keyup', search);

			$('#btn-clear-search').on('click', function(e) {
				$searchableTree.treeview('clearSearch');
				$('#input-search').val('');

			});

			$('#btn-clear-search').on('click', function(e) {
				$('#treeview-searchable').treeview('collapseAll', {
					silent : true
				});
			});

		});
	</script>
</body>
</html>