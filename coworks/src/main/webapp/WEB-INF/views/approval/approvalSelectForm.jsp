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
<style type="text/css">
.table td, .table th {
	padding-left: 2em;
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
									<h2 class="m-2 mb-5">서식을 선택하세요</h2>

									<div class="input-group mb-5">
										<input type="text" class="form-control" placeholder="검색할 서류명을 입력하세요" aria-describedby="basic-addon1">
										<div class="input-group-append">
											<button class="btn btn-info" type="button">검색하기</button>
										</div>
									</div>

									<table class="table no-wrap table-hover text-al-ct">
										<thead style="background: whitesmoke;">
											<tr>
												<th style="font-weight: bold;">제목</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<i class="mdi mdi-folder"></i> 공용문서
												</td>
											</tr>
											<tr>
												<td>
													<i class="mdi mdi-folder"></i> 인사관리부
												</td>
											</tr>
											<tr>
												<td>
													<i class="mdi mdi-folder"></i> 운영관리부
												</td>
											</tr>
											<tr>
												<td>
													<i class="mdi mdi-folder"></i> 전산부
												</td>
											</tr>
											<tr>
												<td>
													<i class="mdi mdi-folder"></i> 총무부
												</td>
											</tr>



											<tr>
												<td>
													<i class="mdi mdi-folder"></i> ../
												</td>
											</tr>
											<tr>
												<td>
													<i class="mdi mdi-file-outline"></i> 서식명1
												</td>
											</tr>
											<tr>
												<td>
													<i class="mdi mdi-file-outline"></i> 서식명2
												</td>
											</tr>
											<tr>
												<td>
													<i class="mdi mdi-file-outline"></i> 서식명3
												</td>
											</tr>
											<tr>
												<td>
													<i class="mdi mdi-file-outline"></i> 서식명4
												</td>
											</tr>
											<tr>
												<td>
													<i class="mdi mdi-file-outline"></i> 서식명5
												</td>
											</tr>
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

</body>
</html>