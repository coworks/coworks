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
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../../../common/topbar.jsp" />
		<c:import url="../../../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
			<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><span>메인페이지</span> <i
								class="fas fa-chevron-right"></i><span>전자결재</span> <i
								class="fas fa-chevron-right"></i><span class="text-info">
									휴가신청서 작성하기</span></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div style="width: 80%; margin-left: auto; margin-right: auto;">
									<h2 class="card-title mb-5">휴가 신청서</h2>
									<form action="${pageContext.request.contextPath }/approval/writeApprovalDone" method="post" enctype="multipart/form-data" onsubmit="return check()">
										<div class="mt-2">

											<c:import url="./common/approvalHeader.jsp" />

											<table class="table table-bordered no-wrap">

												<tr>
													<th scope="col" class="border">휴가 종류</th>
													<td colspan="5">
														<div class="row">
															<div class="col-md-4 col-12">
																<select name="vacation_type" class="form-control custom-select">
																	<option value="연차">연차</option>
																	<option value="월차">월차</option>
																	<option value="반차">반차</option>
																	<option value="병가">병가</option>
																	<option value="기타">기타</option>
																</select>
															</div>
															<div class="col-md-8 col-12">
																<input type="text" name="vacation_Etc" readonly="readonly" class="form-control" placeholder="기타 종류 : " />
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="col" class="border">휴가 기간</th>
													<td colspan="5">
														<div class="input-group mb-3">
															<input type="text" class="form-control vacation-range" name="vacation_range"> <input type="hidden" name="vacation_period" value="1" />
															<div class="input-group-append">
																<span class="input-group-text"> <span class="ti-calendar"></span>
																</span>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<th colspan="6">휴가 사유</th>
												</tr>
												<tr>
													<td colspan="6"><textarea class="form-control" rows="10" name="vacation_reason" required="required"></textarea></td>
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
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath }/resources/templates/resources/js/hummingbird-treeview.js"></script>
	<script src="${pageContext.request.contextPath }/resources/approval/js/signListApply.js"></script>

	<script>
		$(function() {
			$('select[name=vacation_type]').on('change', function() {
				console.log($(this).val());
				if ($(this).val() == '기타') {
					$('input[name=vacation_Etc]').removeAttr('readonly');
				} else {
					$('input[name=vacation_Etc]').val("");
					$('input[name=vacation_Etc]').attr('readonly', 'readonly');
				}
			});
		});

		var period = $('input[name=vacation_period]');

		$('.vacation-range').daterangepicker(
				{
					dateLimit : {
						days : 15
					},
					opens : "center",
					drops : "up",
					buttonClasses : "btn",
					locale : {
						separator : " ~ ",
						daysOfWeek : [ "일", "월", "화", "수", "목", "금", "토" ],
						monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ],
						format : 'YYYY년 MM월 DD일'
					},
					minDate : moment(),
					maxDate : moment().add(2, 'months'),
					autoApply : true
				},
				function(start, end, label) {
					console.log(start.format('YYYY-MM-DD') + ' to '
							+ end.format('YYYY-MM-DD'));
					console.log(Math
							.ceil((end - start) / (1000 * 60 * 60 * 24)));
					period
							.val(Math.ceil((end - start)
									/ (1000 * 60 * 60 * 24)));
				});
	</script>
</body>
</html>