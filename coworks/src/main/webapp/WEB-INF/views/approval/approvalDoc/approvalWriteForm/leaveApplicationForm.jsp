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
								<h4 class="card-title">휴가 신청서</h4>

								<form action="">
									<div class="table-responsive mt-2">
									
										<c:import url="./common/approvalHeader.jsp" />

										<table class="table table-bordered no-wrap">

											<tr>
												<th scope="col" class="border">휴가 종류</th>
												<td colspan="5">
													<div class="radio radio-info">
														<input type="radio" name="vacation_type" id="vacation_type1" value="연차" checked> <label for="vacation_type1"> 연차 </label> <input type="radio" name="vacation_type"
															id="vacation_type2" value="월차"
														> <label for="vacation_type2"> 월차 </label> <input type="radio" name="vacation_type" id="vacation_type3" value="반차"> <label for="vacation_type3"> 반차 </label> <input type="radio"
															name="vacation_type" id="vacation_type4" value="병가"
														> <label for="vacation_type4"> 병가 </label> <input type="radio" name="vacation_type" id="vacation_type5" value="기타"> <label for="vacation_type5"> 기타 </label>

													</div>
													<input type="text" id="gitar" readonly="readonly" class="form-control" />
												</td>
											</tr>
											<tr>
												<th scope="col" class="border">휴가 기간</th>
												<td colspan="5">
													<div class="input-daterange input-group" id="date-range">
														<input type="text" class="form-control" name="start" />
														<div class="input-group-append">
															<span class="input-group-text bg-info b-0 text-white">TO</span>
														</div>
														<input type="text" class="form-control" name="end" />
													</div>
												</td>
											</tr>
											<tr>
												<th colspan="6">휴가 사유</th>
											</tr>
											<tr>
												<td colspan="6">
													<textarea class="form-control" rows="10"></textarea>
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