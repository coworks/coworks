<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery hummingbird-treeview Demo</title>
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<c:import url="../common/header.jsp" />
<link href="${pageContext.request.contextPath }/resources/templates/resources/css/hummingbird-treeview.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color: #fafafa;
}

.container {
	margin: 150px auto;
	min-height: 100vh;
}

.stylish-input-group .input-group-addon {
	background: white !important;
}

.stylish-input-group .form-control { //
	border-right: 0;
	box-shadow: 0 0 0;
	border-color: #ccc;
}

.stylish-input-group button {
	border: 0;
	background: transparent;
}

.h-scroll {
	background-color: #fcfdfd;
	height: 260px;
	overflow-y: scroll;
}
</style>
</head>

<body>

	<div class="container">
		<h2>jQuery hummingbird-treeview Demo</h2>
		<div id="treeview_container" class="hummingbird-treeview well h-scroll-large">
			<!-- <div id="treeview_container" class="hummingbird-treeview"> -->
			<ul id="treeview" class="hummingbird-base">

				<li><i class="fa fa-minus"></i> <label> <input id="node-0" data-id="custom-0" type="checkbox"> node-0
				</label>
					<ul style="display: block;">
						<li><i class="fa fa-plus"></i> <label> <input id="node-0-1" data-id="custom-1" type="checkbox"> node-0-1
						</label>
							<ul>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-1-1" data-id="custom-1-1" type="checkbox"> 폴더 1
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-1-1" data-id="custom-1-1-1" type="checkbox"> node-0-1-1-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-1-2" data-id="custom-1-1-2" type="checkbox"> node-0-1-1-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-1-3" data-id="custom-1-1-3" type="checkbox"> node-0-1-1-3
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="double1" data-id="custom-1-1-3" type="checkbox"> node-0-1-1-3
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="double2" data-id="custom-1-1-3" type="checkbox"> node-0-1-1-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-1-2" data-id="custom-1-2" type="checkbox"> node-0-1-2
								</label>
									<ul>
										<li style="color: rgb(200, 200, 200);"><label> <input class="hummingbirdNoParent" id="node-0-1-2-1" data-id="custom-1-2-1" type="checkbox" disabled=""> node-0-1-2-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-2-2" data-id="custom-1-2-2" type="checkbox"> node-0-1-2-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-2-3" data-id="custom-1-2-3" type="checkbox"> node-0-1-2-3
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="double3" data-id="custom-1-1-3" type="checkbox"> node-0-1-1-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-1-3" data-id="custom-1-3" type="checkbox"> node-0-1-3
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-3-1" data-id="custom-1-3-1" type="checkbox"> node-0-1-3-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-3-2" data-id="custom-1-3-2" type="checkbox"> node-0-1-3-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-3-3" data-id="custom-1-3-3" type="checkbox"> node-0-1-3-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-1-4" data-id="custom-1-4" type="checkbox"> node-0-1-4
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-4-1" data-id="custom-1-4-1" type="checkbox"> node-0-1-4-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-4-2" data-id="custom-1-4-2" type="checkbox"> node-0-1-4-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-1-4-3" data-id="custom-1-4-3" type="checkbox"> node-0-1-4-3
										</label></li>
									</ul></li>
							</ul></li>
						<li><i class="fa fa-plus"></i> <label> <input id="node-0-2" data-id="custom-2" type="checkbox"> node-0-2
						</label>
							<ul>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-2-1" data-id="custom-2-1" type="checkbox"> node-0-2-1
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-1-1" data-id="custom-2-1-1" type="checkbox"> node-0-2-1-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-1-2" data-id="custom-2-1-2" type="checkbox"> node-0-2-1-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-1-3" data-id="custom-2-1-3" type="checkbox"> node-0-2-1-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-2-2" data-id="custom-2-2" type="checkbox"> node-0-2-2
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-2-1" data-id="custom-2-2-1" type="checkbox"> node-0-2-2-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-2-2" data-id="custom-2-2-2" type="checkbox"> node-0-2-2-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-2-3" data-id="custom-2-2-3" type="checkbox"> node-0-2-2-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-2-3" data-id="custom-2-3" type="checkbox"> node-0-2-3
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-3-1" data-id="custom-2-3-1" type="checkbox"> node-0-2-3-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-3-2" data-id="custom-2-3-2" type="checkbox"> node-0-2-3-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-3-3" data-id="custom-2-3-3" type="checkbox"> node-0-2-3-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-2-4" data-id="custom-2-4" type="checkbox"> node-0-2-4
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-4-1" data-id="custom-2-4-1" type="checkbox"> node-0-2-4-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-4-2" data-id="custom-2-4-2" type="checkbox"> node-0-2-4-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-2-4-3" data-id="custom-2-4-3" type="checkbox"> node-0-2-4-3
										</label></li>
									</ul></li>
							</ul></li>
						<li><i class="fa fa-plus"></i> <label> <input id="node-0-3" data-id="custom-3" type="checkbox"> node-0-3
						</label>
							<ul>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-3-1" data-id="custom-3-1" type="checkbox"> node-0-3-1
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-1-1" data-id="custom-3-1-1" type="checkbox"> node-0-3-1-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-1-2" data-id="custom-3-1-2" type="checkbox"> node-0-3-1-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-1-3" data-id="custom-3-1-3" type="checkbox"> node-0-3-1-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-3-2" data-id="custom-3-2" type="checkbox"> node-0-3-2
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-2-1" data-id="custom-3-2-1" type="checkbox"> node-0-3-2-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-2-2" data-id="custom-3-2-2" type="checkbox"> node-0-3-2-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-2-3" data-id="custom-3-2-3" type="checkbox"> node-0-3-2-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-3-3" data-id="custom-3-3" type="checkbox"> node-0-3-3
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-3-1" data-id="custom-3-3-1" type="checkbox"> node-0-3-3-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-3-2" data-id="custom-3-3-2" type="checkbox"> node-0-3-3-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-3-3" data-id="custom-3-3-3" type="checkbox"> node-0-3-3-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-3-4" data-id="custom-3-4" type="checkbox"> node-0-3-4
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-4-1" data-id="custom-3-4-1" type="checkbox"> node-0-3-4-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-4-2" data-id="custom-3-4-2" type="checkbox"> node-0-3-4-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-3-4-3" data-id="custom-3-4-3" type="checkbox"> node-0-3-4-3
										</label></li>
									</ul></li>
							</ul></li>
						<li><i class="fa fa-plus"></i> <label> <input id="node-0-4" data-id="custom-4" type="checkbox"> node-0-4
						</label>
							<ul>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-4-1" data-id="custom-4-1" type="checkbox"> node-0-4-1
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-1-1" data-id="custom-4-1-1" type="checkbox"> node-0-4-1-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-1-2" data-id="custom-4-1-2" type="checkbox"> node-0-4-1-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-1-3" data-id="custom-4-1-3" type="checkbox"> node-0-4-1-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-4-2" data-id="custom-4-2" type="checkbox"> node-0-4-2
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-2-1" data-id="custom-4-2-1" type="checkbox"> node-0-4-2-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-2-2" data-id="custom-4-2-2" type="checkbox"> node-0-4-2-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-2-3" data-id="custom-4-2-3" type="checkbox"> node-0-4-2-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-4-3" data-id="custom-4-3" type="checkbox"> node-0-4-3
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-3-1" data-id="custom-4-3-1" type="checkbox"> node-0-4-3-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-3-2" data-id="custom-4-3-2" type="checkbox"> node-0-4-3-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-3-3" data-id="custom-4-3-3" type="checkbox"> node-0-4-3-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-4-4" data-id="custom-4-4" type="checkbox"> node-0-4-4
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-4-1" data-id="custom-4-4-1" type="checkbox"> node-0-4-4-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-4-2" data-id="custom-4-4-2" type="checkbox"> node-0-4-4-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-4-4-3" data-id="custom-4-4-3" type="checkbox"> node-0-4-4-3
										</label></li>
									</ul></li>
							</ul></li>
						<li><i class="fa fa-plus"></i> <label> <input id="node-0-5" data-id="custom-5" type="checkbox"> node-0-5
						</label>
							<ul>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-5-1" data-id="custom-5-1" type="checkbox"> node-0-5-1
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-1-1" data-id="custom-5-1-1" type="checkbox"> node-0-5-1-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-1-2" data-id="custom-5-1-2" type="checkbox"> node-0-5-1-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-1-3" data-id="custom-5-1-3" type="checkbox"> node-0-5-1-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-5-2" data-id="custom-5-2" type="checkbox"> node-0-5-2
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-2-1" data-id="custom-5-2-1" type="checkbox"> node-0-5-2-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-2-2" data-id="custom-5-2-2" type="checkbox"> node-0-5-2-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-2-3" data-id="custom-5-2-3" type="checkbox"> node-0-5-2-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-5-3" data-id="custom-5-3" type="checkbox"> node-0-5-3
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-3-1" data-id="custom-5-3-1" type="checkbox"> node-0-5-3-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-3-2" data-id="custom-5-3-2" type="checkbox"> node-0-5-3-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-3-3" data-id="custom-5-3-3" type="checkbox"> node-0-5-3-3
										</label></li>
									</ul></li>
								<li><i class="fa fa-plus"></i> <label> <input id="node-0-5-4" data-id="custom-5-4" type="checkbox"> node-0-5-4
								</label>
									<ul>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-4-1" data-id="custom-5-4-1" type="checkbox"> node-0-5-4-1
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-4-2" data-id="custom-5-4-2" type="checkbox"> node-0-5-4-2
										</label></li>
										<li><label> <input class="hummingbirdNoParent" id="node-0-5-4-3" data-id="custom-5-4-3" type="checkbox"> node-0-5-4-3
										</label></li>
									</ul></li>
							</ul></li>
					</ul></li>
				<li><i class="fa fa-plus"></i> <label> <input id="node-1" data-id="custom-1" type="checkbox"> node-1
				</label>
					<ul>
						<li><label> <input class="hummingbirdNoParent" id="node-1-1" data-id="custom-1-1" type="checkbox"> node-1-1
						</label></li>
						<li><label> <input class="hummingbirdNoParent" id="node-1-2" data-id="custom-1-2" type="checkbox"> node-1-2
						</label></li>
						<li><label> <input class="hummingbirdNoParent" id="node-1-3" data-id="custom-1-3" type="checkbox"> node-1-3
						</label></li>
						<li><label> <input class="hummingbirdNoParent" id="node-1-4" data-id="custom-1-4" type="checkbox"> node-1-4
						</label></li>
						<li><label> <input class="hummingbirdNoParent" id="node-1-5" data-id="custom-1-5" type="checkbox"> node-1-5
						</label></li>
					</ul></li>
			</ul>
		</div>
		<button class="btn btn-primary" id="checkAll">Check All</button>
		<button class="btn btn-primary" id="uncheckAll">Uncheck All</button>
		<button class="btn btn-danger" id="checkNode">Check Node 0-2-2</button>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/resources/js/hummingbird-treeview.js"></script>
	<script>
		$("#treeview").hummingbird();
		$("#checkAll").click(function() {
			$("#treeview").hummingbird("checkAll");
		});
		$("#uncheckAll").click(function() {
			$("#treeview").hummingbird("uncheckAll");
		});
		$("#collapseAll").click(function() {
			$("#treeview").hummingbird("collapseAll");
		});
		$("#checkNode").click(function() {
			$("#treeview").hummingbird("checkNode", {
				attr : "id",
				name : "node-0-2-2",
				expandParents : false
			});
		});
	</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
		_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
		_gaq.push([ '_trackPageview' ]);

		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl'
					: 'http://www')
					+ '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
</html>
