<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 급여 대장 입력하기</title>
<c:import url="../common/header.jsp" />
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<h2 class="card-title">급여 대장 입력하기</h2>
						<!-- 파일 입력 부분 -->
		  				<form id="myForm">
		  				<div class="input-group mb-3">
        		            <div class="custom-file">
        		            	<input type="file" class="custom-file-input" name="payRoll" id="payRoll" >
            			        <label class="custom-file-label form-control" for="payRoll" aria-describedby="inputGroupFileAddon02">파일</label>
                   			</div>
                   			<div class="input-group-append">
								<input type="button" id="upload"class="input-group-text" value="upload"/>
                   			</div>
                   		</div>
                   		</form>
                   		<!-- 파일 입력 부분 -->
                   		
                   		<!-- data 출력 table -->
                   		<h3 name="info" id="info"></h3>
                   		<small>(단위/원)</small>
                   		<div id="basicgrid" class="jsgrid"
							style="position: relative; height: 500px; width: 100%; tmargin-top: 200px;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
								<table class="jsgrid-table table table-striped table-hover">
									<tr class="jsgrid-header-row">
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
											style="width: 30px;">사번</th>
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
											style="width: 50px;">이름</th>
										<th
											class="jsgrid-header-cell  jsgrid-align-center jsgrid-header-sortable"
											style="width: 50px;">직급</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 50px;">기본급</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 50px;">급여계</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 50px;">공제계</th>
										<th
											class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
											style="width: 50px;">차감수령액</th>
										<!-- <th class="jsgrid-header-cell jsgrid-align-center"
												style="width: 100px;">관리</th> -->
									</tr>
								<!-- </table>
							</div> -->
						<!-- <table class="jsgrid-table table table-striped table-hover"> -->
							<tbody class="jsgrid-table table table-striped table-hover" id="append">

							</tbody>
						</table>		
					</div>
					</div>		
					<input class="btn  btn-outline-info col-12" value="저장하기"
						type="button" id="submit"/>    
                   		<!-- data 출력 table -->
					</div>
				</div>
			</div>
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script>
	$("#submit").css("display","none");
	
	
	$("#upload").on("click",function(){
		var a=$('#myForm')[0];
		var formData=new FormData(a);
		$.ajax({
			url:"${pageContext.request.contextPath}/pay/inputPayRoll.do",
			data:formData,
			enctype:"multipart/form-data",
			type:"post",
			processData:false,
			async:false,
			contentType:false,
			success:function(data){
				$("#info").append(data[0].B +" / "+data[0].D +" / "+data[0].F )
				for(var i = 2 ; i < data.length; i++){
					var tbody = $("#append");
					var content = $("<tr>");
					content.append("<td class='jsgrid-cell jsgrid-align-center'>"+data[i].A+"</td>");
					content.append("<td class='jsgrid-cell jsgrid-align-center'>"+data[i].B+"</td>");
					content.append("<td class='jsgrid-cell jsgrid-align-center'>"+data[i].C+"</td>");
					content.append("<td class='jsgrid-cell jsgrid-align-center'>"+data[i].D+"</td>");
					content.append("<td class='jsgrid-cell jsgrid-align-center'>"+data[i].L+"</td>");
					content.append("<td class='jsgrid-cell jsgrid-align-center'>"+data[i].S+"</td>");
					content.append("<td class='jsgrid-cell jsgrid-align-center'>"+data[i].T+"</td>");
					tbody.append(content);
					
				}
				$("#submit").css("display","block");
				$("#payRoll").readOnly = true;
				alert("excel 파일 불러오기 완료");
			},error:function(){
				alert("excel 파일을 불러오는 중 문제가 발생하였습니다.");
			}
		});
	});
	
	$("#submit").on("click",function(){
		var a=$('#myForm')[0];
		var formData=new FormData(a);
		$.ajax({
			url:"${pageContext.request.contextPath}/pay/savePayRoll.do",
			data:formData,
			enctype:"multipart/form-data",
			type:"post",
			processData:false,
			async:false,
			contentType:false,
			success:function(data){
				alert("excel 파일 저장 완료");
				location.href="${pageContext.request.contextPath}/pay/employeeList.do";
			},error:function(){
				alert("excel 파일을 불러오는 중 문제가 발생하였습니다.");
			}
		});
	});
	
	
	</script>
</body>
</html>


			
		