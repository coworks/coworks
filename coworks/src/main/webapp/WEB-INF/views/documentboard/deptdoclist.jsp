<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 부서 자료실</title>
<c:import url="../common/header.jsp" />
<style type="text/css">
.table td, .table th {
	padding-left: 2em;
}

.over {
	color: #009999;
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
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">

								<div style="width: 80%; margin-left: auto; margin-right: auto;">
									<h2 class="m-2 mb-5">부서를 선택하세요</h2>

									<table class="table no-wrap table-hover text-al-ct">
										<thead style="background: whitesmoke;">
											<tr>
												<th style="font-weight: bold;">부서</th>
											</tr>
										</thead>
										<tbody>
											
											<c:forEach items="${departmentList}" var="de">
												<tr>
													<td class="title" onclick="selectFolder('${de.dept_code}');"
														value="${de.dept_code}"><i class="mdi mdi-label"></i>
														${de.dept_name }</td>
												</tr>
												
											</c:forEach>

											

										</tbody>
									</table>
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
	<script>
		function selectFolder(deptcode) {
			location.href = "${pageContext.request.contextPath}/documentboard/"+deptcode;
		}
		/* function selectForm(formPage, formNo) {
			location.href = "${pageContext.request.contextPath}/approval/write/"
					+ formPage + "/" + formNo;
		} */

		$(function() {
			$('.title').addClass('out')
			$('.title').hover(function() {
				$('tr').has('td').css('cursor', 'pointer');
				$(this).addClass('over');
			}, function() {
				$(this).removeClass('over');
			});
		});
	</script>



</body>
</html>