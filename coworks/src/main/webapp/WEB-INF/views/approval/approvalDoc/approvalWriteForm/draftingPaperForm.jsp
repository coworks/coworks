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
<link href="${pageContext.request.contextPath }/resources/templates/assets/plugins/summernote/dist/summernote-bs4.css" rel="stylesheet" />
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../../../common/topbar.jsp" />
		<c:import url="../../../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
			<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<h3 class="text-themecolor mb-0 mt-0">COWORKS</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									결재서류 작성하기</span></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div style="width: 80%; margin-left: auto; margin-right: auto;">
									<h2 class="card-title mb-5">기안서</h2>
									<form action="${pageContext.request.contextPath }/approval/writeApprovalDone" method="post" enctype="multipart/form-data" onsubmit="return check()">
										<div class="table-responsive mt-2">
											<c:import url="./common/approvalHeader.jsp" />
											<table class="table table-bordered no-wrap">
												<tr>
													<th>상세 내용</th>
												</tr>
												<tr>
													<td style="text-align: left;"><textarea class="summernote" name="detail_content" required="required"></textarea></td>
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
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/summernote/dist/summernote-bs4.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/approval/js/signListApply.js"></script>

	<script>
		$(function() {
			$('.summernote').summernote({
				height : 350, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : false
			});
		});
	</script>

</body>
</html>