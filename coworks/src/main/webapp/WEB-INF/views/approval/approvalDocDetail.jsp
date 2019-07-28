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
<style type="text/css">
.table td, .table th {
	padding: .75rem;
	vertical-align: middle;
}

.table th {
	background: whitesmoke;
	text-align: center;
}

div p {
	white-space: normal;
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
					<div class="col-12">
						<div class="card p-3 pb-5">
							<div class="card-body col-8 align-self-center">
								<button id="print" class=" btn btn-outline-info" type="button">
									<span><i class="fa fa-print"></i> Print</span>
								</button>
								<div class="printArea">
									<h2 class="card-title mb-5 mt-3" align="center">
										<b>${form.aform_title }</b>
									</h2>
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
										<div class="col-3"></div>
										<div class="col-5">
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
													<th scope="col" class="border">${signList[0].job_title }</th>
													<th scope="col" class="border">${signList[1].job_title }</th>

												</tr>
												<tr align="center">
													<td><img alt="담당자sign" src="${pageContext.request.contextPath}/resources/approval/empSign/${writer.emp_signature}" width="50em" ></td>
													<td><c:if test="${signList[0].as_status == 1}">
															<img alt="담당자sign" src="${pageContext.request.contextPath}/resources/approval/empSign/${signList[0].emp_signature}" width="50em" >
														</c:if></td>
													<td><c:if test="${signList[1].as_status == 1}">
															<img alt="담당자sign" src="${pageContext.request.contextPath}/resources/approval/empSign/${signList[1].emp_signature}" width="50em">
														</c:if></td>
												</tr>
												<tr align="center">
													<td><fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yy/MM/dd" /></td>
													<td><c:if test="${signList[0].as_status == 1}">
															<fmt:formatDate value="${signList[0].as_date}" pattern="yy/MM/dd" />
														</c:if></td>
													<td><c:if test="${signList[1].as_status == 1}">
															<fmt:formatDate value="${signList[1].as_date}" pattern="yy/MM/dd" />
														</c:if></td>
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
													<td><fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd HH:mm" /></td>
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
										<div class="col-9 "></div>
										<div class="col-3 mt-2" style="text-align: left">
											<span>일자 : &nbsp;&nbsp;<fmt:formatDate value="${doc.adoc_uploadDate }" pattern="yyyy-MM-dd" /></span><br /> <span> 서명 : &nbsp;&nbsp;${writer.emp_name}&nbsp;&nbsp;(인)</span>
										</div>
									</div>
								</div>
								<c:if test="${!empty attachList  }">
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
		$(function() {
			$("#print").click(function() {
				var mode = 'iframe';
				var close = mode == "popup";
				var options = {
					mode : mode,
					popClose : close
				};
				$(".printArea").printArea(options);
			});
			
			
		
		var docType="${form.aform_title}";
		var content = ${doc.adoc_content};
		console.log(docType);
		console.log(content);
		
		
		if(docType=="휴가신청서"){
			var docContentList=$('<ol>');
			docContentList.append("<li>휴가 종류 : "+content.vacation_type+"</li><br />");
			docContentList.append("<li>휴가 기간 : "+content.vacation_range+" ("+content.vacation_period+" 일간)</li><br />");
			docContentList.append("<li>휴가 사유 : "+content.vacation_reason+"</li><br />"); 
	
			var subCon=$('<p>').text("위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.").css("text-align","center")
			
			$('#docContent').append(docContentList);
			$('#docContent').append('<br>').append(subCon);
			
		} else if(docType=="시말서"){
			var docContent=$('<p>');
			docContent.append("<b>위반내용</b><br>&nbsp;"+content.apology_reason);
			var subCon=$('<p>');
			subCon.append("위 본인은 직원으로서 제 사규를 준수하고 맡은바 책임과 의무를 다하여 성실히 복무하여야 함에도 불구하고 위와 같이 회사의 관련 규정을 위반하였는바 이에 시말서를 제출하고 그에 따른 처벌을 감수하며 차후 본건을 계기로 과오의 재발이 없을 것임을 서약합니다. ").css("text-align","center")

			$('#docContent').append(docContent);
			$('#docContent').append('<br>').append(subCon);
		}

		
		});
	</script>
</body>
</html>