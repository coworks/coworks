<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 결재 미결함</title>
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
								<h4 class="card-title mb-3">결재 대기 문서</h4>

								<form action="${pageContext.request.contextPath }/approval/approveList" method="post">
									<input type="submit" value="일괄 결재하기" class="btn btn-warning mb-3 float-right" />
									<table class="table no-wrap table-hover mt-5" style="text-align: center;">
										<thead class="bg-info text-white">
											<tr>
												<th><input type="checkbox" id="allck" /></th>
												<th>제목</th>
												<th>결재 양식</th>
												<th>작성일시</th>
												<th>작성자</th>
												<th></th>
											</tr>
										</thead>
										<tbody class="border-info">
											<c:if test="${docList.size() != 0 }">
												<c:forEach var="doc" items="${docList }" varStatus="vs">
													<tr onclick="location.href='${pageContext.request.contextPath}/approval/approvalDoc/v/${doc.adoc_no}'">
														<td onclick="event.cancelBubble=true">
															<input type="checkbox" value="${doc.adoc_no }" name="docNo" />
														</td>
														<td>${doc.adoc_subject }</td>
														<td>${doc.aform_title }</td>
														<td>
															<fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd HH:mm" />
														</td>
														<td>${doc.writerName }</td>
														<td onclick="event.cancelBubble=true">
															<div align="center">
																<input type="button" value="승인" class="btn  btn-outline-success  mr-2" onclick="approve(${doc.adoc_no})" /> <input type="button" value="반려" class="btn  btn-outline-danger "
																	onclick="reject(${doc.adoc_no})"
																/>
															</div>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
									<c:if test="${docList.size() == 0 }">
										<div align="center">
											<img src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png" style="width: 150px; vertical-align: middle; border: 0" />
											<h4 style="font-weight: bold;">결재 대기 중인 문서가 없습니다.</h4>
										</div>
									</c:if>
								</form>
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
	
	$(function(){
		$('#allck').on('click',function(){
			var check=$(this).prop("checked");
			$('input[name=docNo]').each(function(){
				$(this).prop('checked',check);
			});
		});
		$('input[name=docNo]').on('click',function(){
		if($('#allck').prop("checked")){
			console.log($(this));
			$('#allck').prop('checked',false);
		
		}});
	});
	
	
	function approve(docNo) {
		if(confirm("해당 결재를 승인하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/approval/approve/"+docNo;
		};
	};
	
	function reject(docNo) {
		if(confirm("해당 결재를 반려하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/approval/reject/"+docNo;
		};
	};
	
	</script>
</body>
</html>