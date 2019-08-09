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
<link href="${pageContext.request.contextPath }/resources/templates/resources/css/hummingbird-treeview.css" rel="stylesheet" type="text/css">
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../../../common/topbar.jsp" />
		<c:import url="../../../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
			<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span>전자결재</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									시말서 작성하기</span></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div style="width: 80%; margin-left: auto; margin-right: auto;">
									<h2 class="card-title mb-5">시말서</h2>
									<form action="${pageContext.request.contextPath }/approval/writeApprovalDone" method="post" enctype="multipart/form-data" onsubmit="return check()">
										<div class="table-responsive mt-2">
											<c:import url="./common/approvalHeader.jsp" />
											<table class="table table-bordered no-wrap">
												<tr>
													<th>위반 내용</th>
												</tr>
												<tr>
													<td><textarea class="form-control" rows="10" name="apology_reason" required="required"></textarea></td>
												</tr>
												</tbody>
											</table>
										</div>
										<c:import url="./common/approvalAttachAdd.jsp" />
										<c:import url="./common/approvalSignModal.jsp" />
										<div align="right">
											<input type="submit" value="제출하기" class="btn btn-info" /> <input type="button" value="취소" class="btn btn-danger" onclick="javascript:history.back()" />
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
	<script src="${pageContext.request.contextPath }/resources/templates/resources/js/hummingbird-treeview.js"></script>
	<script src="${pageContext.request.contextPath }/resources/approval/js/signListApply.js"></script>

</body>
</html>