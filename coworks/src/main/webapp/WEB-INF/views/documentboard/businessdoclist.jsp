<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import ="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 자료실/게시판</title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
<style>
	.detail-box{
	    border-bottom: solid #E6E6E6 1px !important;
	}
	.detail-list{
		border: solid #E6E6E6 1px !important;
		padding : 85px 0;
		text-align : center;
		margin-top : 20px;
	}
	.text-al-ct {
		text-align : center;
	}
	
	.text-al-left {
		text-align : left;
		text-indent : 7%;
	}

	.over {
		color : #009999;
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
						<h3 class="text-themecolor mb-0 mt-0">COWORKS</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)">자료실 / 게시판</a></li>
							<!-- <li class="breadcrumb-item active">업무자료</li> -->
						</ol>
					</div>
				</div>

				<!-- table -> -->
				<div class="row">
				<div class="col-12">
				<div class="card">
					<div class="card-body col-10 align-self-center">

						
						
						<div class="table-responsive ">
						<div style="text-align : right;"><a href="businessdocForm.do" class="btn btn-success waves-effect waves-light">글쓰기</a></div>
												
						<!-- (내역이 없을 때 →) -->
						<c:if test="${list.size() eq 0 }">
							<div class="detail-box">
							<div class="detail-list">
						
							<div>
								<img
									src="${pageContext.request.contextPath}/resources/images/boardImg/none_exclamation.png"
									style="width: 70px; vertical-align: middle; border: 0" />
							</div>
								<h4 class="text-themecolor" style="margin: 10px 0;">조회할 게시글이 없습니다.</h4>

							</div>
							</div>
							</c:if>
						<!-- (내역이 없을 때 ←)-->
						<!-- (내역이 있을 때 →) -->
						<c:if test="${list.size() ne 0 }">
							<table id="demo-foo-pagination"
								class="table toggle-arrow-tiny footable footable-4 footable-paging footable-paging-center breakpoint-sm table-hover text-al-ct"
								data-sorting="true" data-paging="true">
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
										<td class="title">${b.bo_no }</td>
										<td class="text-al-left title">${b.bo_title } 
											<div hidden>
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd" /></c:set> 
												<c:set var="after3days" value="<%=new Date(new Date().getTime() + 60*60*24*1000*3) %>" />
												<fmt:formatDate value="${after3days }" type="DATE" pattern="yyyy/MM/dd"/>
												<fmt:formatDate var="now" value="${b.bo_date }" pattern="yyyy/MM/dd"/>
											</div>
										<c:choose>
											<c:when test="${now <= after3days && now >= today}">
												<span class="badge badge-danger ml-auto">new</span>
											</c:when>
										</c:choose>
										
										
										</td>
										<td class="title">
										<fmt:formatDate value="${b.bo_date }" pattern="yyyy/MM/dd"/> <%--yyyy/MM/dd HH:mm --%>
										</td>
										<td>
											<c:if test="${b.fileCount>0 }">
												<i class="fa fa-paperclip"></i>
											</c:if>
										</td>
									</tr>
									</c:forEach>
								</tbody>
								
							</table>
							<c:out value="${pageBar}" escapeXml="false"/>
							</c:if><!-- (내역이 있을 때 ←)-->
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
				console.log("bo_code=${bo_code}");
				location.href="${pageContext.request.contextPath}/documentboard/${bo_code}/"+bo_no;
			});
		});
		
		$(function(){
			$('.title').addClass('out')
			$('.title').hover(function(){
				$('tr').has('td').css('cursor', 'pointer');
				$(this).addClass('over');
			}, function(){
				$(this).removeClass('over');
			});
		});
	</script>
</body>
</html>