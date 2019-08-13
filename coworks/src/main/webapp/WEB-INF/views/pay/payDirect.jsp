<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>co-works : 급여 명세서 입력</title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
	
<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/moment/moment.js"></script> 
    <!-- Color Picker Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asColor/dist/jquery-asColor.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <!-- Date range Plugin JavaScript -->
    <style>
     #page{
     	padding-left:40%;
     	margin-top:0;
     	
     }
	#payBtn{
   	 	width: 20%;
    	margin-left: 39%;
    	margin-right: auto;
    	margin-bottom: 5%;
	}
     #subtitle{
     	padding-bottom:5%;
     }
     table tr th{
     	width:5%;
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
								class="fas fa-chevron-right"></i><span class="text-info"> 급여관리</span></li>
						</ol>
					</div>
				</div>
			<div class="col-12">
				<!-- Column -->
				<div class="card">
					<div class="card-body">
						<h2 class="card-title" id="subtitle">급여 명세서 입력</h2>
						<form action="${pageContext.request.contextPath }/pay/payDirectSetInfo.do" id="payInfo" method="post">
						<div style="height:100px;" class="col-12">
							<div class="col-12"  style="height:50%;"  >
								사번 : <input type="number" required id="emp_no" name="emp_no" class="col-3"/> &nbsp;&nbsp;&nbsp;&nbsp;
								이름 &nbsp;&nbsp;&nbsp;: <input type="text"  id="pay_emp_name" name="pay_emp_name" class="col-3"readOnly/> &nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<div class="col-12"style="height:50%;"  >
								직책 : <input type="text" id="pay_emp_job"name="pay_emp_job" class="col-3"readOnly/> &nbsp;&nbsp;&nbsp;
								지급일 : <input type="date" required id="pay_date"name="pay_date" class="col-3"/> &nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div id="basicgrid" class="jsgrid"
							style="position: relative; height: 710px; width: 100%;">
							
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
							<table class="jsgrid-table table  table-hover ">
									<thead class="bg-info text-black">
									<tr class="jsgrid-header-row">
										<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable col-3">지급 항목</th>
										<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable col-5">지급액</th>
										<th class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable col-3">공제항목</th>
										<th class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable col-5">공제액</th>
									
									</tr>
									</thead>
									<tbody>
											<tr class="jsgrid-row" >
												<td class="jsgrid-cell jsgrid-align-center" >기본급</td>
												<td class="jsgrid-cell jsgrid-align-center" >
												<input type="number" value="0" name="pay_basepay" id="pay_basepay" class="col-10 vl plus">
												</td>
												<td class="jsgrid-cell jsgrid-align-center" >소득세</td>
												<td class="jsgrid-cell jsgrid-align-center" >
												<input type="number" value="0" name="pay_income" id="pay_income" class="col-10 vl minus">
												</td>
											</tr>
											
											<tr class="jsgrid-row" >
												<td class="jsgrid-cell jsgrid-align-center">직책 수당</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number"  value="0" name="pay_jobtitle" id="pay_jobtitle" class="col-10 vl plus"></td>
												<td class="jsgrid-cell jsgrid-align-center">주민세</td>
												<td class="jsgrid-cell jsgrid-align-center">
												<input type="number"  value="0"name="pay_resident" id="pay_resident" class="col-10 vl minus"></td>
											</tr>
											
											<tr class="jsgrid-row" >
												<td class="jsgrid-cell jsgrid-align-center">연장 수당</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_overtime" name="pay_overtime" class="col-10 vl plus"></td>
												<td class="jsgrid-cell jsgrid-align-center">고용보험</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_empins" name="pay_empins" class="col-10 vl minus"></td>
											</tr>
											
											<tr class="jsgrid-row" >
												<td class="jsgrid-cell jsgrid-align-center">휴일 수당</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_hollyday" name="pay_hollyday" class="col-10 vl plus"></td>
												<td class="jsgrid-cell jsgrid-align-center">국민연금</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_nation" name="pay_nation" class="col-10 vl minus"></td>
											</tr>
											
											<tr class="jsgrid-row">
												<td class="jsgrid-cell jsgrid-align-center">상여금</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_bonus" name="pay_bonus" class="col-10 vl plus"></td>
												<td class="jsgrid-cell jsgrid-align-center">건강보험</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_healins" name="pay_healins" class="col-10 vl minus"></td>
											</tr>
											<tr class="jsgrid-row" >
												<td class="jsgrid-cell jsgrid-align-center">교통비</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_transport" name="pay_transport" class="col-10 vl plus"></td>
												<td class="jsgrid-cell jsgrid-align-center"></td>
												<td class="jsgrid-cell jsgrid-align-center"></td>
											</tr>
											<tr class="jsgrid-row" >
												<td class="jsgrid-cell jsgrid-align-center">복지후생</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_welfare" name="pay_welfare" class="col-10 vl plus"></td>
												<td class="jsgrid-cell jsgrid-align-center"></td>
												<td class="jsgrid-cell jsgrid-align-center"></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell jsgrid-align-center">식대</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_meal" name="pay_meal" class="col-10 vl plus"></td>
												<td class="jsgrid-cell jsgrid-align-center"></td>
												<td class="jsgrid-cell jsgrid-align-center"></td>
											</tr>
											<tr class="jsgrid-row" >
												<td class="jsgrid-cell jsgrid-align-center">기타</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_others" name="pay_others" class="col-10 vl plus"></td>
												<td class="jsgrid-cell jsgrid-align-center"></td>
												<td class="jsgrid-cell jsgrid-align-center"></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell jsgrid-align-center"></td>
												<td class="jsgrid-cell jsgrid-align-center"></td>
												<td class="jsgrid-cell jsgrid-align-center">공제 합계</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_mtotal" name="pay_mtotal"class="col-10 vl " readOnly></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell jsgrid-align-center">급여 합계</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_ptotal" name="pay_ptotal" class="col-10 vl "readOnly></td>
												<td class="jsgrid-cell jsgrid-align-center">차감 수령액</td>
												<td class="jsgrid-cell jsgrid-align-center">
													<input type="number" value="0" id="pay_total"name="pay_total"class="col-10 vl " readOnly></td>
											</tr>
											<tr>
											<td colspan="4" class="bg-white">
												<div id="payBtn" class="btn waves-effect waves-light btn-secondary">저장</div>
											</td>
											</tr>
									</tbody>
								</table>
							</div>
							<div id="page">
							<c:out value="${pageBar}" escapeXml="false" />
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<c:import url="../common/footer.jsp" />
	</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script>
	function detailPay(pay_no){
		console.log("asdasd");
		window.open("${pageContext.request.contextPath}/pay/detailPay.do/"+pay_no,"급여 명세서",
				"width=700px,height=600px,left=100px,top=100px, location=no");
	}
	
	$("#payBtn").on("click",function(){
		console.log("12");
		console.log($("#pay_date").val());
		if($("#emp_no").val() ==""){
			alert("사번을 입력하세요")
			return;
		}
		if($("#pay_date").val() == ""){
			alert("지급일을 입력하세요");
			return;
		}
		
		var payInfo= $('#payInfo')[0];
		
		var form =new FormData(payInfo);
		for(var pair of form.entries()) {
			   console.log(pair[0]+ ', '+ pair[1]); 
			}
		
		$('#payInfo').submit();
	});
	$("[name=emp_no]").on("blur",function(){
		var emp_no = $(this).val();
		console.log(emp_no);
		$.ajax({
			url:"${pageContext.request.contextPath}/pay/payDriectGetInfo.do",
			data:{emp_no:emp_no},
			success:function(data){
				if(data.emp_no == null)
					alert("해당 사원이 존재하지 않습니다.");
				else{
					$("#pay_emp_name").val(data.emp_name);
					$("#pay_emp_job").val(data.job_title);
				}
			},
			error:function(){
				alert("값을 입력해주세요");
			}
		});
	});
	var total=0;
	var ptotal=0;
	var mtotal=0;
	$(".plus").on("change",function(){
		ptotal = 0;
		ptotal = parseInt(mtotal);
		ptotal += parseInt($("#pay_basepay").val());
		ptotal += parseInt($("#pay_jobtitle").val());
		ptotal += parseInt($("#pay_overtime").val());
		ptotal += parseInt($("#pay_hollyday").val());
		ptotal += parseInt($("#pay_bonus").val());
		ptotal += parseInt($("#pay_transport").val());
		ptotal += parseInt($("#pay_welfare").val());
		ptotal += parseInt($("#pay_meal").val());
		ptotal += parseInt($("#pay_others").val());
		$("#pay_ptotal").val(ptotal);
			
	});
	$(".minus").on("change",function(){
		mtotal=0;
		mtotal = parseInt(mtotal);
		mtotal += parseInt($("#pay_income").val());
		mtotal += parseInt($("#pay_resident").val());
		mtotal += parseInt($("#pay_empins").val());
		mtotal += parseInt($("#pay_nation").val());
		mtotal += parseInt($("#pay_healins").val());
		$("#pay_mtotal").val(mtotal);
	});
	
	$(".vl").on("change",function(){
		total = ptotal - mtotal;
		$("#pay_total").val(total);
	});
	
	  /* 
		$("#detailPay").on("click",function(){
			alert("asd");
			var pay_no = $("#empListPay").parent().parent().attr("id");
			console.log(typeof(pay_no))
	  		$.ajax({
	  			url:"${pageContext.request.contextPath}/pay/detailPay.do",
	  			data:{pay_no:pay_no},
	  			success:function(){
	  				alert("성공")
	  			}
	  		});
		});
	   */

	/* 	function search(){
			location.href="${pageContext.request.contextPath}/employee/employeeSearch.do?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		} */
		
	</script>
	<%-- 	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/db.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/resources/js/jsgrid-init.js"></script> --%>
</body>
</html>