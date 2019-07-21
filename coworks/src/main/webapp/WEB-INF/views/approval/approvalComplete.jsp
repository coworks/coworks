<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 결재 완료
함</title>
<c:import url="../common/header.jsp" />
<style type="text/css">
.table td, .table th {
	padding: .4rem;
	vertical-align: middle;
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
								<h4 class="card-title mb-3">결재 대기 문서</h4>

								<input type="button" value="일괄 결재하기" class="btn btn-warning mb-3 float-right" />

								<div class="table-responsive">
									<table class="table no-wrap table-bordered" style="text-align: center;">
										<thead class="bg-info text-white">
											<tr>
												<th><input type="checkbox" name="allck" /></th>
												<th>제목</th>
												<th>결재 양식</th>
												<th>작성일시</th>
												<th>작성자</th>
												<th></th>
											</tr>
										</thead>
										<tbody class="border border-info">
											<tr>
												<td><input type="checkbox" name="checkApproval" /></td>
												<td>김둘리 휴가 신청합니다!</td>
												<td>휴가신청서</td>
												<td>2019-06-30</td>
												<td>김둘리</td>
												<td>
													<div align="center">
														<input type="button" value="승인" class="btn  btn-outline-success  mr-2" /> <input type="button" value="반려" class="btn  btn-outline-danger " />
													</div>
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