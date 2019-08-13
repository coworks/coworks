<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 결재 승인 / 반려함</title>
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
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span> 전자결재</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									승인 / 반려함</span></li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="card p-3 pb-5">
							<div class="card-body">
								<h4 class="card-title mb-3">결재 승인 / 반려함</h4>

								<ul class="nav nav-tabs customtab" role="tablist">
									<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#all" role="tab"><span class="hidden-sm-up"></span> <span class="hidden-xs-down">All</span></a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#approve" role="tab"><span class="hidden-sm-up"></span> <span class="hidden-xs-down">승인</span></a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#reject" role="tab"><span class="hidden-sm-up"></span> <span class="hidden-xs-down">반려</span></a></li>
								</ul>
								<div class="tab-content mt-3">
									<div class="tab-pane active" id="all" role="tabpanel">
										<table class="table no-wrap table-hover " style="text-align: center;">
											<colgroup>
												<col width="30%" />
												<col width="25%" />
												<col width="25%" />
												<col width="20%" />
											</colgroup>
											<thead class="bg-info text-white">
												<tr>
													<th>제목</th>
													<th>결재 양식</th>
													<th>작성일시</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="border-info">
												<c:forEach items="${docList}" var="doc" varStatus="vs">
													<tr onclick="location.href='${pageContext.request.contextPath}/approval/approvalDoc/v/${doc.adoc_no}'">

														<td>${doc.adoc_subject }</td>
														<td>${doc.aform_title }</td>
														<td>
															<fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd HH:mm" />
														</td>
														<td>
															<c:if test="${doc.adoc_status == '1'}">
																<span class="label label-success">1차 승인</span>
															</c:if>
															<c:if test="${doc.adoc_status == '2'}">
																<span class="label label-info">승인</span>
															</c:if>
															<c:if test="${doc.adoc_status eq '-1'}">
																<span class="label label-danger">반려</span>
															</c:if>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<c:if test="${docList.size() == 0 }">
											<div align="center">
												<img src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png" style="width: 150px; vertical-align: middle; border: 0" />
												<h4 style="font-weight: bold;" class="text-info mt-2">결재가 완료된 문서가 없습니다.</h4>
											</div>
										</c:if>
									</div>
									<div class="tab-pane" id="approve" role="tabpanel">
										<table class="table no-wrap table-hover " style="text-align: center;">
											<colgroup>
												<col width="30%" />
												<col width="25%" />
												<col width="25%" />
												<col width="20%" />
											</colgroup>
											<thead class="bg-info text-white">
												<tr>

													<th>제목</th>
													<th>결재 양식</th>
													<th>작성일시</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="border-info">
											<c:set var="approveIndex" value="0" />
												<c:forEach items="${docList}" var="doc" varStatus="vs">
													
													<c:if test="${doc.adoc_status == '2'}">
														<c:set var="approveIndex" value="${approveIndex +1}" />
														<tr onclick="location.href='${pageContext.request.contextPath}/approval/approvalDoc/v/${doc.adoc_no}'">

															<td>${doc.adoc_subject }</td>
															<td>${doc.aform_title }</td>
															<td>
																<fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd HH:mm" />
															</td>
															<td>
																<span class="label label-success">승인</span>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										<c:if test="${approveIndex==0}">
											<div align="center">
												<img src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png" style="width: 150px; vertical-align: middle; border: 0" />
												<h4 style="font-weight: bold;" class="text-info mt-2">결재가 승인된 문서가 없습니다.</h4>
											</div>
										</c:if>
									</div>
									<div class="tab-pane" id="reject" role="tabpanel">
										<table class="table no-wrap table-hover " style="text-align: center;">
											<colgroup>
												<col width="30%" />
												<col width="25%" />
												<col width="25%" />
												<col width="20%" />
											</colgroup>
											<thead class="bg-info text-white">
												<tr>

													<th>제목</th>
													<th>결재 양식</th>
													<th>작성일시</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="border-info">
												<c:set var="rejectIndex" value="0" />
												<c:forEach items="${docList}" var="doc" varStatus="vs">
												
													<c:if test="${doc.adoc_status eq '-1'}">
														<c:set var="rejectIndex" value="${rejectIndex + 1}" />

														<tr onclick="location.href='${pageContext.request.contextPath}/approval/approvalDoc/v/${doc.adoc_no}'">

															<td>${doc.adoc_subject }</td>
															<td>${doc.aform_title }</td>
															<td>
																<fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd HH:mm" />
															</td>
															<td>
																<span class="label label-danger">반려</span>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										<c:if test="${rejectIndex==0}">
											<div align="center">
												<img src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png" style="width: 150px; vertical-align: middle; border: 0" />
												<h4 style="font-weight: bold;" class="text-info mt-2">결재가 반려된 문서가 없습니다.</h4>
											</div>
										</c:if>
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
</body>
</html>