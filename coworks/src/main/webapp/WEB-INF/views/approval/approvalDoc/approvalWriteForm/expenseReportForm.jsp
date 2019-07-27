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
								<div style="width: 80%; margin-left: auto; margin-right: auto;">
									<h2 class="card-title mb-5">지출 품의서</h2>

									<form action="${pageContext.request.contextPath }/approval/writeApprovalDone" method="post" enctype="multipart/form-data">
										<div class="table-responsive mt-2">
											<c:import url="./common/approvalHeader.jsp" />

											<input type="hidden" name="colNum" value="5" /> <input type="hidden" name="colTitle1" value="품명" /> <input type="hidden" name="colTitle2" value="규격" /> <input type="hidden" name="colTitle3" value="수량" /> <input type="hidden" name="colTitle4" value="단가" /> <input type="hidden" name="colTitle5" value="금액" />

											<table class="table table-bordered no-wrap">
												<colgroup>
													<col width="10%" />
													<col width="18%" />
													<col width="18%" />
													<col width="18%" />
													<col width="18%" />
													<col width="18%" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col" class="border">순번</th>
														<th scope="col" class="border">품명</th>
														<th scope="col" class="border">규격</th>
														<th scope="col" class="border">수량</th>
														<th scope="col" class="border">단가</th>
														<th scope="col" class="border">금액</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="index" begin="1" end="15" step="1">
														<tr>
															<c:set var="row" value="1" />
															<td><input type="number" value="${index }" readonly="readonly" class="form-control" /></td>
															<td><input type="text" name="col${index }/row${row}" class="form-control" /></td>
															<td><input type="text" name="col${index }/row${row+1}" class="form-control" /></td>
															<td><input type="number" name="col${index }/row${row+2}" class="form-control" /></td>
															<td><input type="number" name="col${index }/row${row+3}" class="form-control" /></td>
															<td><input type="number" name="col${index }/row${row+4}" class="form-control" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>

										</div>
										<c:import url="./common/approvalAttachAdd.jsp" />
										<div align="right">
											<input type="submit" value="제출하기" class="btn btn-info" /> <input type="reset" value="초기화" class="btn btn-danger" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:import url="../../../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../../../common/bottomJquery.jsp" />
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>

</body>
</html>