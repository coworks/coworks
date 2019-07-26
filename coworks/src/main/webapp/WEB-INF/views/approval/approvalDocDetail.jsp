<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : ${doc.adoc_subject }</title>
<c:import url="../common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/approval/css/approvalDoc.css" />
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body col-8 align-self-center">
								<button id="print" class=" btn btn-outline-info" type="button">
									<span><i class="fa fa-print"></i> Print</span>
								</button>
								<div class="printArea">
									<h2 class="card-title mb-5 mt-3" align="center">${form.aform_title }</h2>
									<div class="row">
										<div class="col-4">
											<table class="no-wrap table-bordered table ">
												<colgroup>
													<col width="10%" />
													<col width="30%" />
												</colgroup>
												<col width="100px">
												<tr>
													<th scope="col" class="border">문서번호</th>
													<td>${doc.adoc_no }</td>
												</tr>
												<tr>
													<th scope="col" class="border">보존만료일</th>
													<td>${doc.adoc_expiration }</td>
												</tr>
												<tr>
													<th scope="col" class="border">보안등급</th>
													<td>${doc.adoc_security }등급</td>
												</tr>
											</table>
										</div>
										<div class="col-4"></div>
										<div class="col-4">
											<table class="no-wrap table-bordered table ">
												<colgroup>
													<col width="10%" />
													<col width="30%" />
													<col width="30%" />
													<col width="30%" />
												</colgroup>
												<tr>
													<th rowspan="3">결<br />재
													</th>
													<th scope="col" class="border">담당</th>
													<th scope="col" class="border"></th>
													<th scope="col" class="border"></th>

												</tr>
												<tr align="center">
													<td>
														<img alt="담당자sign" src="${pageContext.request.contextPath}/resources/images/empSign/stamp.png" width="50px" height="50px">
													</td>
													<td>
														<img alt="담당자sign" src="${pageContext.request.contextPath}/resources/images/empSign/stamp.png" width="50px" height="50px">
													</td>
													<td></td>
												</tr>
												<tr align="center">
													<td>
														<fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd" />
													</td>
													<td>2019-07-23</td>
													<td></td>

												</tr>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<table class="no-wrap table-bordered table">
												<colgroup>
													<col width="10%" />
													<col width="40%" />
													<col width="10%" />
													<col width="40%" />
												</colgroup>
												<tr>
													<th scope="col" class="border" width="100px">소속</th>
													<td>${writer.dept_name }</td>
													<th scope="col" class="border" width="100px">직책</th>
													<td>${writer.job_title }</td>
												</tr>
												<tr>
													<th scope="col" class="border">성명</th>
													<td>${writer.emp_name}</td>
													<th scope="col" class="border">작성일</th>
													<td>
														<fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd HH:mm" />
													</td>
												</tr>
												<tr>
													<th scope="col" class="border">제목</th>
													<td colspan="3">${doc.adoc_subject }</td>
												</tr>
											</table>
											<c:set var="docURL" value="./approvalDoc/approvalForm/${form.aform_docPage }.jsp" />

											<c:import url="${docURL }" />

										</div>
									</div>
									<div class="row">
										<div class="col-9"></div>
										<div class="col-3 mt-2" style="text-align: left">
											<span>일자 : &nbsp;&nbsp;<fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd" /></span><br /> <span> 서명 : &nbsp;&nbsp;${writer.emp_name}&nbsp;&nbsp;(인)</span>
										</div>
									</div>
								</div>
								<c:if test="${attachList != null }">
									<div id="file-list">
										<i class="fas fa-paperclip"></i> 첨부파일 <br />
										<ul>
											<c:forEach items="${attachList}" var="attach" varStatus="vs">
												<li><a href="<c:url value='/approval/approvalAttachDown?name=${attach.apAtt_oriname }&path=${attach.apAtt_path}/${attach.apAtt_rename }'/>">${attach.apAtt_oriname }</a></li>
											</c:forEach>
										</ul>
									</div>
								</c:if>
							</div>

						</div>
					</div>
				</div>
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script src="${pageContext.request.contextPath}/resources/templates/resources/js/jquery.PrintArea.js" type="text/JavaScript"></script>
	<script>
		$(document).ready(function() {
			$("#print").click(function() {
				var mode = 'iframe';
				var close = mode == "popup";
				var options = {
					mode : mode,
					popClose : close
				};
				$("div.printArea").printArea(options);
			});
		});
	</script>
</body>
</html>