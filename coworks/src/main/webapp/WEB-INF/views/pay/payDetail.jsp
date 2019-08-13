<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 급여 명세서</title>
<c:import url="../common/header.jsp" />
<style>
#btn {
	margin-left: 35%;
	margin-right: auto;
	margin-bottom: 5%;
}

table {
	text-align: center;
}

table tbody tr {
	width: 53%;
}

#print {
	float: right;
	width: 10%;
	height: 30px;
	margin-bottom: 1%;
}
</style>
<link href="${pageContext.request.contextPath }/resources/approval/css/print.css" rel="stylesheet" media="print">

</head>

<body>

	<div class="container-fluid">
		<div class="col-12">
			<!-- Column -->
			<div class="">
				<!-- card -->
				<div class="card-body">

					<button type="button" id="print" class="btn waves-effect waves-light btn-light">
						<i class="mdi mdi-printer"></i>
					</button>
					<div class="printArea">
						<div class="navbar-header">
							<a class="navbar-brand-a"> <!-- Logo icon --> <b> <img src="${pageContext.request.contextPath}/resources/images/coworks_logo.PNG" alt="homepage" 
									style="width: 33px; height: 34px"
								/> <!-- Light Logo icon -->
							</b> <!--End Logo icon --> <!-- Logo text --> <span> <!-- dark Logo text --> <img src="${pageContext.request.contextPath}/resources/images/coworks_logoT.PNG" alt="homepage" 
									style="width: 148px; height: 25px"
								/> <!-- Light Logo text -->
							</span>
							</a>
						</div>
						<small>성명 : ${pay.pay_emp_name } &nbsp;&nbsp; 직급 : ${pay.pay_emp_job }&nbsp;&nbsp; 지급일 : ${pay.pay_date }</small>

						<div id="basicgrid" class="jsgrid" style="position: relative; width: 100%;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
								<table class="jsgrid-table table  table-hover ">
									<thead class="bg-info text-white">
										<tr class="jsgrid-header-row">
											<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable" style="width: 80px;">지급 항목</th>
											<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable" style="width: 70px;">지급액</th>
											<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable" style="width: 100px;">공제항목</th>
											<th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 100px;">공제액</th>

										</tr>
									</thead>
									<tbody>
										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">기본급</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_basepay}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">소득세</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${pay.pay_income}</td>
										</tr>

										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">직책 수당</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_jobtitle}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">주민세</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${pay.pay_resident}</td>
										</tr>

										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">연장 수당</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_overtime}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">고용보험</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${pay.pay_empins}</td>
										</tr>

										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">휴일 수당</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_hollyday}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">국민연금</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${pay.pay_nation}</td>
										</tr>

										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">상여금</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_bonus}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">건강보험</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${pay.pay_healins}</td>
										</tr>
										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">교통비</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_transport}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;"></td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"></td>
										</tr>
										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">복지후생</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_welfare}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;"></td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"></td>
										</tr>
										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">식대</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_meal}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;"></td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"></td>
										</tr>
										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">기타</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_others}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;"></td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;"></td>
										</tr>
										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;"></td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;"></td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">공제 합계</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${pay.pay_mtotal }</td>
										</tr>
										<tr class="jsgrid-row" name="emp_no">
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">급여 계</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">${pay.pay_ptotal}</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 70px;">차감 수령액</td>
											<td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${pay.pay_total }</td>
										</tr>
										<tr>
											<td colspan="4">
												<p style="text-align: left;">(c)COWORKS. 귀하의 노고에 감사드립니다.</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<button type="button" id="btn" class="btn waves-effect waves-light btn-block btn-light col-4" onclick="window.close();">확인</button>
				</div>
			</div>
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
		});
	</script>
</body>

</html>



