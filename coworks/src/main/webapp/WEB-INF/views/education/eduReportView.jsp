<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : ${eduRep.edurep_title}</title>
<c:import url="../common/header.jsp" />
<style type="text/css">
.table td, .table th {
	padding: .75rem;
	vertical-align: middle;
}

.table th {
	background: whitesmoke;
	text-align: center;
}

div p {
	white-space: normal;
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
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i class="fas fa-chevron-right"></i><span> 교육 </span> <i
								class="fas fa-chevron-right"></i><span class="text-info"> 교육 결과 보고서</span></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card p-3 pb-5">
							<div class="card-body col-8 align-self-center">

								<h2 class="card-title mb-5 mt-3" align="center">
									<b>교육 결과 보고서</b>
								</h2>
								<div class="row">
									<table class="no-wrap table-bordered table ">
										<colgroup>
											<col width="10%">
											<col width="30%">
											<col width="10%">
											<col width="30%">
										</colgroup>
										<tr>
											<th scope="col" class="border">소 속</th>
											<td id="dept_name"></td>
											<th scope="col" class="border">직 급</th>
											<td id="job_title"></td>
										</tr>
										<tr>
											<th scope="col" class="border">성 명</th>
											<td id="writerName"></td>
											<th scope="col" class="border">작성일</th>
											<td>
												<fmt:formatDate value="${eduRep.edurep_date }" pattern="yyyy-MM-dd HH:mm" />
											</td>
										</tr>
									</table>

									<table class="no-wrap table-bordered table ">
									<colgroup>
											<col width="10%">
											<col width="30%">
											<col width="10%">
											<col width="30%">
										</colgroup>
										<tr>
											<th scope="col" class="border">교육명</th>
											<td id="edu_title"></td>
											<th scope="col" class="border">강사명</th>
											<td id="edu_instructor"></td>
										</tr>
										<tr>
											<th scope="col" class="border">교육 일자</th>
											<td colspan="3" id="edu_date"></td>
										</tr>
										<tr>
											<th scope="col" class="border">교육 내용</th>
											<td colspan="3">
												<div style="height: 500px">
													<p id="edu_content"></p>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="col" class="border">교육 소감</th>
											<td colspan="3">
												<div style="height: 200px">
													<p id="edu_thoughts"></p>
												</div>
											</td>
										</tr>
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
	<script type="text/javascript">
		$(function() {
			var content = ${eduRep.edurep_content};
			for ( var key in content) {
				$('#' + key).html(content[key].replace(/\r\n/gi, "<br>"));
			}

		});
	</script>

</body>
</html>