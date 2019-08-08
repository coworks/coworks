<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 결재 상신 / 기안함</title>
<c:import url="../common/header.jsp" />
<style type="text/css">
.table td, .table th {
	padding: .75rem;
	vertical-align: middle;
}

.table td {
	cursor: pointer;
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
						<h3 class="text-themecolor mb-0 mt-0">COWORKS</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span> 전자결재</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									상신 / 기안함</span></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="card p-3 pb-5">
							<div class="card-body">
								<h4 class="card-title mb-5">결재 상신 / 기안함</h4>

								<div class="">
									<table class="table no-wrap  table-hover mt-5" style="text-align: center;">
										<thead class="bg-info text-white">
											<tr>
												<th></th>
												<th>제목</th>
												<th>결재 양식</th>
												<th>작성일시</th>
												<th></th>
											</tr>
										</thead>
										<tbody class=" border-info">
											<c:forEach items="${docList}" var="doc" varStatus="vs">
												<tr onclick="location.href='${pageContext.request.contextPath}/approval/approvalDoc/v/${doc.adoc_no}'">
													<td>${vs.index+1 }</td>
													<td>${doc.adoc_subject }</td>
													<td>${doc.aform_title }</td>
													<td><fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd HH:mm" /></td>
													<td onclick="event.cancelBubble=true"><c:if test="${doc.adoc_status == '0'}">
															<button class="btn btn-info btn-xs" onclick="editDoc('${doc.adoc_no}')">
																<i class="mdi mdi-pen"></i>수정
															</button>
															<button class="btn btn-danger btn-xs" onclick="deleteDoc('${doc.adoc_no}')">
																<i class="mdi mdi-close"></i>삭제
															</button>
														</c:if> <c:if test="${doc.adoc_status == '1'}">
															<span class="label label-success">1차 승인</span>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<c:if test="${docList.size() == 0 }">
										<div align="center">
											<img src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png" style="width: 150px; vertical-align: middle; border: 0" />
											<h4 style="font-weight: bold;" class="text-info mt-2">결재 진행 중인 문서가 없습니다.</h4>
										</div>
									</c:if>
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
		function deleteDoc(adoc_no) {
			if (confirm("이 결재서류를 삭제하시겠습니까?\n복구가 불가능합니다!")) {
				location.href = "${pageContext.request.contextPath}/approval/approvalDoc/delete/"
						+ adoc_no;
			}
		}

		function editDoc(adoc_no) {
			location.href = "${pageContext.request.contextPath}/approval/approvalDoc/edit/"
					+ adoc_no;
		}
	</script>
</body>
</html>