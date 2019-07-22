<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 결재 서류작성하기</title>
<c:import url="../common/header.jsp" />
<style>
.list-group-item {
	border: none;
	padding: 0.5em
}

.treeDiv {
	border: 1px lightgray solid;
	height: 400px;
	overflow: scroll;
}

.table td, .table th {
	padding: .3rem;
	vertical-align: middle;
}

table.fixed {
	table-layout: fixed;
}

table.fixed td {
	overflow: hidden;
}
</style>
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
							<div class="row">
								<div class="col-xlg-2 col-lg-3">
									<div class="card-body">
										<h4 class="card-title">결재 서식 선택하기</h4>
										<div class="form-group">
											<label for="input-search" class="sr-only"></label> <input type="text" class="form-control" id="input-search" placeholder="검색하기" value="">
										</div>
										<button type="button" class="btn btn-success" id="btn-search">검색하기</button>
										<button type="button" class="btn btn-default" id="btn-clear-search">초기화</button>

										<hr class="m-3" />
										<div class="slimtest1">
											<div id="treeview-searchable" class="treeview"></div>
										</div>
									</div>
								</div>
								<div class="col-xlg-10 col-lg-9 border-left">
									<div class="card-body">
										<h1 align="center">서식을 선택해주세요</h1>

										<c:import url="./approvalForm/defaultForm.jsp" />
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
	<script type="text/javascript">
		$('#slimtest1').slimScroll({
			height : '400px'
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