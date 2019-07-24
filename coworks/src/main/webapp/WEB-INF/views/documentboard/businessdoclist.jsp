<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 통합자료실</title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
<style>
	.text-al-ct {
		text-align : center;
	}
	
	.text-al-left {
		text-align : left;
	}
</style>

</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">

				<!-- table -> -->
				<div class="row">
				<div class="col-12">
				<div class="card">
					<div class="card-body">
						<!-- <h4 class="card-title">COWORKS 통합자료실 > 업무문서</h4> -->
						<!-- -->
						<div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">COWORKS 통합자료실 > 업무문서</h3>
                        <br><br>
                   		</div>
						<!-- -->
<!-- 						<h6 class="card-subtitle">업무관련문서</h6> -->
						
						
						<div class="table-responsive">
						<div style="text-align : right;"><a href="businessdocdetail.do" class="btn btn-danger waves-effect waves-light">상세보기</a></div>
						<div style="text-align : right;"><a href="businessdocForm.do" class="btn btn-danger waves-effect waves-light">글쓰기</a></div>
							<table id="demo-foo-pagination"
								class="table toggle-arrow-tiny footable footable-4 footable-paging footable-paging-center breakpoint-sm table-hover text-al-ct"
								data-sorting="true" data-paging="true" style="">
								<thead>
									<tr class="footable-header text-al-ct">
										<th>번호</th>
										<th>제목</th>
										<th>날짜</th>
										<th>첨부파일</th>
									</tr>
								</thead>
								<tbody class="text-al-ct">
								<c:forEach items="${list}" var="b">
									<tr id="${b.bo_no}">
										<td>${b.bo_no }</td>
										<td class="text-al-left">${b.bo_title }<span class="badge badge-danger ml-auto">new</span></td>
										<td>${b.bo_date }</td>
										<td>
											<c:if test="${b.fileCount>0 }">
												<i class="fa fa-paperclip"></i>
											</c:if>
										</td>
									</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr class="footable-paging">
										<td colspan="5"><div class="footable-pagination-wrapper">
												<ul class="pagination justify-content-center">
													<li class="footable-page-nav disabled" data-page="first"><a
														class="footable-page-link" href="#">≪</a></li>
													<li class="footable-page-nav disabled" data-page="prev"><a
														class="footable-page-link" href="#">?</a></li>
													<li class="footable-page-nav disabled"
														data-page="prev-limit"><a class="footable-page-link"
														href="#">...</a></li>
													<li class="footable-page visible active" data-page="1"><a
														class="footable-page-link" href="#">1</a></li>
													<li class="footable-page visible" data-page="2"><a
														class="footable-page-link" href="#">2</a></li>
													<li class="footable-page visible" data-page="3"><a
														class="footable-page-link" href="#">3</a></li>
													<li class="footable-page visible" data-page="4"><a
														class="footable-page-link" href="#">4</a></li>
													<li class="footable-page visible" data-page="5"><a
														class="footable-page-link" href="#">5</a></li>
													<li class="footable-page" data-page="6"><a
														class="footable-page-link" href="#">6</a></li>
													<li class="footable-page-nav" data-page="next-limit"><a
														class="footable-page-link" href="#">...</a></li>
													<li class="footable-page-nav" data-page="next"><a
														class="footable-page-link" href="#">?</a></li>
													<li class="footable-page-nav" data-page="last"><a
														class="footable-page-link" href="#">≫</a></li>
												</ul>
												<div class="divider"></div>
												<span class="label label-primary">1 of 6</span>
											</div></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
				<!-- table <- -->




			</div></div>
			</div>
			
			
			<c:import url="../common/footer.jsp" />
			
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
		<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/db.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.js"></script>
	<script>
		$(function(){
			$("tr[id]").on("click", function(){
				var bo_no = $(this).attr("id");
				console.log("bo_no="+bo_no);
				location.href="${pageContext.request.contextPath}/documentboard/businessdocForm.do?no="+bo_no;
			});
		});
	</script>
</body>
</html>