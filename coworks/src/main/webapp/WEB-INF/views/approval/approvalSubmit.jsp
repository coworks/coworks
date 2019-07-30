<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 결재 완료함</title>
<c:import url="../common/header.jsp" />
<style type="text/css">
.table td, .table th {
	padding: .5rem;
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
				<div class="row">
					<div class="col-lg-12">
						<div class="card p-3 pb-5">
							<div class="card-body">
								<h4 class="card-title mb-3">결재 완료 문서</h4>

								<div class="btn-group btn-group-toggle mt-2 mb-3" data-toggle="buttons">
									<label class="btn btn-outline-secondary active"> <input type="radio" name="options" id="option1" autocomplete="off" checked=""> ALL
									</label> <label class="btn btn-outline-secondary"> <input type="radio" name="options" id="option2" autocomplete="off"> 승인
									</label> <label class="btn btn-outline-secondary "> <input type="radio" name="options" id="option3" autocomplete="off"> 반려
									</label>
								</div>
								<div class="table-responsive">
									<table class="table no-wrap table-hover " style="text-align: center;">
										<thead class="bg-info text-white">
											<tr>
												<th></th>
												<th>제목</th>
												<th>결재 양식</th>
												<th>작성일시</th>
												<th></th>
											</tr>
										</thead>
										<tbody class="border-info">
											<c:forEach items="${docList}" var="doc" varStatus="vs">
												<tr onclick="location.href='${pageContext.request.contextPath}/approval/approvalDoc/v/${doc.adoc_no}'">
													<td>${vs.index+1 }</td>
													<td>${doc.adoc_subject }</td>
													<td>${doc.aform_title }</td>
													<td><fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd HH:mm" /></td>
													<td>${doc.adoc_status}<c:if test="${doc.adoc_status == '1'} ">
															<span class="label label-success">승인</span>
														</c:if> <c:if test="${doc.adoc_status eq '2'} ">
															<span class="label label-danger">반려</span>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<c:if test="${docList.size() == 0 }">
										<div align="center">
											<img src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png" style="width: 150px; vertical-align: middle; border: 0" />
											<h4 style="font-weight: bold;">결재가 완료된 문서가 없습니다.</h4>
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
</body>
</html>