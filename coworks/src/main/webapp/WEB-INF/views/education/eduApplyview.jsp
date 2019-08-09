<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 교육 신청 현황</title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">

<style>
.table td {
	cursor: pointer;
}
</style>

<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColor/dist/jquery-asColor.js"></script>
<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>

</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<h3 class="text-themecolor mb-0 mt-0">교육 신청 현황</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span> 교육</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									교육 신청 현황</span></li>
						</ol>
					</div>
				</div>

				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class=" align-self-center">
								<div class="float-left">
									<h3 class="card-title mb-7">교육 신청 현황</h3>

								</div>

								<div class="dropdown float-right ">
									<button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">교육 유형</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<input type="button" class="dropdown-item" id="type0" name="type0" value='전체' onclick="location.href='${pageContext.request.contextPath}/education/eduApplyview.do'" /> <input type="button"
											class="dropdown-item" id="type1" name="type1" value='마케팅' onclick="fnonclick('마케팅')"
										/> <input type="button" class="dropdown-item" id="type2" name="type2" value='컴퓨터' onclick="fnonclick('컴퓨터')" /> <input type="button" class="dropdown-item" id="type3" name="type3"
											value='회계' onclick="fnonclick('회계')"
										/> <input type="button" class="dropdown-item" id="type4" name="type4" value='외국어' onclick="fnonclick('외국어')" /> <input type="button" class="dropdown-item" id="type5" name="type5"
											value='기타' onclick="fnonclick('기타')"
										/>
									</div>
								</div>

								<script>
									function fnonclick(type) {
										location.href = "${pageContext.request.contextPath}/education/searchTypeEducation.do?edu_type="
												+ type;
									}
								</script>
							</div>
							<br /> <br /> <br />
							<div id="basicgrid" class="jsgrid" style="position: relative; height: 500px; width: 100%; margin-top: 5px;">
								<div class="jsgrid-grid-header jsgrid-header-scrollbar">
									<table class="jsgrid-table table table-striped table-hover ">
										<tr class="jsgrid-header-row">
											<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable" style="width: 30px;"></th>
											<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable" style="width: 30px;">교육유형</th>
											<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable" style="width: 70px;">교육명</th>
											<th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 50px;">강사</th>
											<th class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center" style="width: 40px;">교육일시</th>
											<th class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center" style="width: 40px;"></th>
										</tr>
									</table>
								</div>
								<div class="jsgrid-grid-header jsgrid-header-scrollbar">
									<table class="jsgrid-table table table-striped table-hover">
										<tbody>
										<c:if test="${list.size() == 0 }">
											<div align="center">
				
												<img src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png" style="width: 150px; vertical-align: middle; border: 0" /> <br />
												<h4 style="font-weight: bold;">신청한 교육이 없습니다.</h4>
											</div>
										</c:if>
											<c:forEach items="${list}" var="list" varStatus="idx">



												<input type="hidden" id="eduDate" name="eduDate" value="${list.edu_eduDate}" />
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd HH:mm" />
												<fmt:formatDate var="edudate" value="${list.edu_eduDate}" pattern="yyyy-MM-dd HH:mm" />

												<fmt:parseDate var="a" value="${list.edu_eduDate}" pattern="yyyy-MM-dd HH:mm" />
												<c:set var="today2" value="${now.getTime()}"/>
												<c:set var="start2" value="${a.getTime()+60*60*24*1000}" />
												<c:set var="end2" value="${a.getTime()+60*60*24*1000*8}" />

												 

												<tr class="jsgrid-row" onclick="location.href='${pageContext.request.contextPath}/education/eduDetail.do?edu_no=${list.edu_no}'">
													<td class="jsgrid-cell jsgrid-align-center" style="width: 30px;">${idx.count}</td>
													<td class="jsgrid-cell jsgrid-align-center" style="width: 30px;">${list.edu_type}</td>
													<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;" id="title">${list.edu_title}</td>
													<td class="jsgrid-cell jsgrid-align-center" style="width: 50px;">${list.edu_instructor}</td>
													<td class="jsgrid-cell jsgrid-align-center" style="width: 40px;">${edudate}</td>

													<td class="jsgrid-cell jsgrid-align-center" style="width: 40px;" onclick="event.cancelBubble=true">
														<c:if test="${list.edurep_no==0}">
															<c:choose>
																<c:when test="${today lt edudate}">
																	<button id="cancel" name="cancel" class="btn btn-danger" onclick="fnCancel('${list.edu_no}');">취소</button>
																</c:when>
																<c:when test="${today2- start2>0 && today2-end2<=0}">
																	<button id="report" name="report" class="btn btn-info" onclick="fnWriteReport('${list.edu_no}');">보고서 작성</button>
																</c:when> 
															</c:choose>

														</c:if>

														<c:if test="${list.edurep_no!=0  }">
															<c:choose>
																<c:when test="${today2- start2>0 && today2-end2<=0}">
																	<button id="reportEdit" name="report" class="btn btn-success" onclick="fnReportEdit('${list.edurep_no}');">보고서 수정</button>
																</c:when>
																<c:otherwise>
																	<button id="reportView" class="btn btn-secondary" onclick="fnReportView('${list.edurep_no}');">보고서 보기</button>
																</c:otherwise>
															</c:choose>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<c:out value="${pageBar}" escapeXml="false" />
							</div>
						</div>
						
					</div>
					<div style="height: 100px;"></div>

				</div>
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />


	<script>
	
		function fnWriteReport(edu_no) {
			location.href = "${pageContext.request.contextPath}/education/insertEduReport.do?edu_no="
					+ edu_no;

		}

		function fnReportView(edurep_no) {
			location.href = "${pageContext.request.contextPath}/education/eduReport/v/"
					+ edurep_no;
		}

		function fnReportEdit(edurep_no) {
			location.href = "${pageContext.request.contextPath}/education/eduReport/edit/"
					+ edurep_no;
		}

		function fnCancel(edu_no) {

			$
					.ajax({
						url : "${pageContext.request.contextPath}/education/deleteEduApply.do",
						data : {
							edu_no : edu_no
						},
						type : "post",
						dataType : "json",
						async : false,
						success : function(data) {
							if (data > 0) {
								alert("취소 완료!!");

							} else
								alert("취소 실패!!");

							location.href = "${pageContext.request.contextPath}/education/eduApplyview.do";

						},
						error : function(data) {
							alert("취소 실패");
						}
					});

		};
	</script>
</body>
</html>