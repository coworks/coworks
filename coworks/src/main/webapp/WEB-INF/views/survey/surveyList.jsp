<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 설문조사 관리하기</title>
<c:import url="../common/header.jsp" />
<style>
.detail-box {
	border-bottom: solid #E6E6E6 1px !important;
}

.detail-list {
	border: solid #E6E6E6 1px !important;
	padding: 85px 0;
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />

		<div id="detailView" class="modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<form method="post" action="authorityUpdate.do" name="deptUpdate">
					<div class="modal-content m-2">
						<div class="modal-header" style="text-align:center">
							<h2 class="modal-title" id="myModalLabel">설문조사 투표현황</h2>
							<!-- <button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button> -->
						</div>
						<div class="col-md-12 mt-3">
							<div class="form-group has-success">
							<h1 style="text-align:center">Q.
								<label id="surveytitle" class="control-label mt-2"></label></h1>
							</div>
						</div>
						<div id="surveyadd" class="p-3">
							<!-- 	<h5 class="mt-2">
							YES!!<span class="float-right">10%</span>
						</h5>
						<div class="progress ">
							<div
								class="progress-bar bg-megna wow animated progress-animated"
								style="width: 85%; height: 6px;" role="progressbar">
								<span class="sr-only"></span>
							</div>
						</div> -->
						</div>
						<div style="margin-left: 430px; margin-top: 30px;">
							<button type="button" onclick="go();"
								class="btn btn-danger waves-effect text-left mb-3"
								data-dismiss="modal">닫기</button>
						</div>

					</div>
				</form>
			</div>
		</div>



		<div class="modal" id="insertSurvey" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-l">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="myLargeModalLabel">설문조사 등록하기</h2>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
					</div>
					<div class="form-body">
						<form method="post" action="surveyInsert.do" name="surveyInsert">
							<div class="card-body">
								<div class="row pt-3">
									<div class="col-md-12">
										<div class="form-group">
											<label class="control-label">제목 </label> <input type="text"
												id="survey_quest" name="survey_quest" class="form-control"
												placeholder="">
											<!-- <small class="form-control-feedback"> This is inline help </small> -->
										</div>
									</div>
								</div>
								<!--/span-->

								<div class="col-md-13">
									<div class="form-group">
										<label class="control-label">시작일시 </label> <input type="date"
											id="survey_start" name="survey_start" class="form-control">
										<!-- <small class="form-control-feedback"> This is inline help </small> -->
									</div>
								</div>

								<div class="col-md-13">
									<div class="form-group">
										<label class="control-label">종료일시 </label> <input type="date"
											id="survey_end" name="survey_end" class="form-control">
										<!-- <small class="form-control-feedback"> This is inline help </small> -->
									</div>
								</div>

								<div id="surveyadditem" class="col-md-13">
									<div class="form-group">
										<label class="control-label">항목 </label> <input type="text"
											id="survey_content" name="survey_content"
											class="form-control"> <input
											style="margin-top: 10px;" type="text" id=survey_content
											name="survey_content" class="form-control"> <input
											style="margin-top: 10px;" type="text" id="survey_content"
											name="survey_content" class="form-control"> <input
											style="margin-top: 10px;" type="text" id="survey_content"
											name="survey_content" class="form-control">
										<!-- <small class="form-control-feedback"> This is inline help </small> -->
									</div>
								</div>

								<div style="margin-left: 280px; margin-top: 40px;">
									<button class="btn btn-info" type="submit" onclick="return check();">등록하기</button>
									<button type="button"
										class="btn btn-danger waves-effect text-left"
										data-dismiss="modal">취소하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>


		<div class="page-wrapper">
			<div class="container-fluid">

				<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									설문조사</span></li>
						</ol>
					</div>
				</div>
				<!-- 시작 -->
				<div class="col-lg-12 col-md-12">
					<div class="card">
						<div class="card-body">
							<h6 class="card-subtitle">
								<i class="icon-heart"></i> 설문에 응답해주세요!
								</code>
							</h6>
							<div style="float: right; display: inline-border;">
								<button type="button" data-toggle="modal"
									data-target="#insertSurvey" class="btn btn-info">설문조사
									등록</button>
							</div>
							<br>
							<!-- Nav tabs -->
							<div class="vtabs col-12">
								<ul class="nav nav-tabs tabs-vertical" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home9" role="tab"
										aria-selected="true"> <span>설문조사</span>
									</a>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<div class="tab-pane active" id="home9" role="tabpanel">
										<div class="p-3">
											<c:set var="now" value="<%=new java.util.Date()%>" />
											<!-- 반복문으로 할 일 내역 나올 곳 -->
											<div class="row">
												<c:forEach items="${list}" var="survey">
													<div class="col-lg-4 col-md-6 col-xs-12">

														<div class="ribbon-wrapper card"
															style="border: 1px solid lightgray;">

															<div class="card" style="border-style: groove">

																<h4 style="margin-top: -30px;">설문조사</h4>
																<br>
																<p class="card-text"
																	style="font-size: 20px; font-weight: bold">
																	<i class="fas fa-quote-left text-info"></i>${survey.survey_quest}
																	<i class="fas fa-quote-right text-info"></i>
																	<br><br>
																<p class="card-text">
																	투표<span style="color : red"> ${survey.cnt}</span>명 참여

																	<button style="float: right;" data-toggle="modal"
																		data-target="#detailView"
																		class="btn btn-outline-info col-4" id="sa-success"
																		onclick="return detailView('${survey.survey_no}','${survey.cnt}');">상세보기</button>
																	<!-- <h5 class="mt-4">
																YES!!<span class="float-right">10%</span>
															</h5>
															<div class="progress ">
																<div
																	class="progress-bar bg-success wow animated progress-animated"
																	style="width: 85%; height: 6px;" role="progressbar">
																	<span class="sr-only">60% Complete</span>
																</div>
															</div>
															<h5 class="mt-4">
																No :(<span class="float-right">20%</span>
															</h5>
															<div class="progress ">
																<div
																	class="progress-bar bg-danger wow animated progress-animated"
																	style="width: 15%; height: 6px;" role="progressbar">
																	<span class="sr-only">60% Complete</span>
																</div>
															</div> -->
															</div>
															<p class="card-text" style="margin-top : -20px;">
																<c:if test="${now <survey.survey_end}">
																	<small class="text-info"><fmt:formatDate
																			value="${survey.survey_start }"
																			pattern="yyyy년MM월dd일 " /> ~ <fmt:formatDate
																			value="${survey.survey_end }" pattern="yyyy년MM월dd일 " /></small>
																</c:if>
																<c:if test="${now >survey.survey_end}">
																	<small class="text-danger"  style="text-decoration:line-through"><fmt:formatDate
																			value="${survey.survey_start }"
																			pattern="yyyy년MM월dd일 " /> ~ <fmt:formatDate
																			value="${survey.survey_end }" pattern="yyyy년MM월dd일 "/></small>
																	<small class="text-danger"> 기한만료 </small>
																</c:if>
															</p>
														</div>
													</div>
												</c:forEach>
											</div>
											<!-- row -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:out value="${pageBar}" escapeXml="false" />
				</div>


				<!-- 끝 -->

			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />

	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/bootstrap/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"
		aria-hidden="true"></script>
	<script>
		function detailView(surno,cnt) {
			
			$.ajax({
						url : "${pageContext.request.contextPath}/survey/selectOneSurveyApp.do?surno="+ surno,
						dataType : "json",
						success : function(data) {
							$("#surveytitle").text(data[0].survey_quest);
							var temp = 0;
							for(var i=0;i<data.length;i++){
								
							if(data[i].cnt==0)
								temp = 0;
							else
								temp = Math.round((100/cnt)*data[i].cnt);
								
							$('#surveyadd').append("<h5 class='mt-4'>"+data[i].survey_content+"  투표율["+temp+"%]<span class='float-right'>"+data[i].cnt+"명 투표</span></h5>");
							$('#surveyadd').append("<div class='progress'><div class='progress-bar bg-megna wow animated progress-animated' style='width:"+(100/cnt)*data[i].cnt+"%;height:6px;' role='progressbar'><span class='sr-only'></span></div>");
							}
						},
						error : function() {
							alert("error!!!!");
						}
					});

		}
		
		
		function check(){
			
			var survey_quest = $("#survey_quest").val();
			var survey_start = $("#survey_start").val();
			var survey_end = $("#survey_end").val();
			
			if(survey_quest == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  제목을 입력해주세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}else if(survey_start == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  시작일시를 선택해주세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}else if(survey_end == ""){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  종료일시를 선택해주세요!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}else if(survey_start>survey_end){
				Swal.fire({
	                title: "ʕ•ᴥ•ʔ  적절하지 않은 종료일시입니다!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}
			
			return true;
		}
		
		function go(){
			location.href="${pageContext.request.contextPath}/survey/surveyList.do";
		}
		
		
		
	</script>


</body>
</html>











