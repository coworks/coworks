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
							<li class="breadcrumb-item" ><input type="text" id="bo_code" value="${bo_code }" hidden>
								<c:choose>
												<c:when test="${bo_code eq 'D50' }">
													<input type="text" name="bo_code" value="${bo_code }" hidden>
													<span>자료실</span> <i class="fas fa-chevron-right"></i><span class="text-info"> 사내규정 자료실</span>
												</c:when>
												<c:when test="${bo_code eq 'D51' }">
													<input type="text" name="bo_code" value="${bo_code }" hidden>
													<span>자료실</span> <i class="fas fa-chevron-right"></i><span class="text-info"> 업무문서</span>
												</c:when>
												<c:when test="${bo_code eq 'D52' }">
													<input type="text" name="bo_code" value="${bo_code }" hidden>
													<span>자료실</span> <i class="fas fa-chevron-right"></i><span class="text-info"> 교육문서</span>
												</c:when>
												<c:when test="${bo_code eq 'D53' }">
													<input type="text" name="bo_code" value="${bo_code }" hidden>
													<span>게시판</span> <i class="fas fa-chevron-right"></i><span class="text-info"> 공지사항</span>
												</c:when>
												<c:when test="${bo_code eq 'D54' }">
													<input type="text" name="bo_code" value="${bo_code }" hidden>
													<span>게시판</span> <i class="fas fa-chevron-right"></i><span class="text-info"> 경조사</span>
												</c:when>
												<c:when test="${bo_code eq 'D55' }">
													<input type="text" name="bo_code" value="${bo_code }" hidden>
													<span>게시판</span> <i class="fas fa-chevron-right"></i><span class="text-info"> 조직개편 및 인사이동</span>
												</c:when>
												<c:when test="${bo_code eq 'D56' }">
													<input type="text" name="bo_code" value="${bo_code }" hidden>
													<span>게시판</span> <i class="fas fa-chevron-right"></i><span class="text-info"> News</span>
												</c:when>
												<c:when test="${bo_code eq 'D57' }">
													<input type="text" name="bo_code" value="${bo_code }" hidden>
													<span>게시판</span> <i class="fas fa-chevron-right"></i><span class="text-info"> 자유게시판</span>
												</c:when>
												<c:otherwise>
													<input type="text" name="bo_code" value="${bo_code }" hidden>
													<span>게시판</span> <i class="fas fa-chevron-right"></i><span class="text-info"> 부서게시판</span>
												</c:otherwise>
											</c:choose>
							</li>
						</ol>
					</div>
				</div>

				<!-- table -> -->
				<div class="row">
				<div class="col-12">
				<div class="card">
					<div class="card-body col-11 align-self-center">

						
						
						<div class="table-responsive ">
						<div style="text-align : right;">
						
							<a class="btn btn-success waves-effect waves-light" onclick="goboardForm();" style="color:white;">글쓰기<input type="text" id="bo_code" value="${bo_code }" hidden></a>
						
						</div>
												
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
										<th style="width: 14%; font-weight: bold;">번호</th>
										<th style="width: 41%; font-weight: bold;">제목</th>
										<th style="width: 12%; font-weight: bold;">글쓴이</th>
										<th style="width: 13%; font-weight: bold;">날짜</th>
										<th style="width: 10%; font-weight: bold;">첨부파일</th>
									</tr>
								</thead>
								<tbody class="text-al-ct">
								<c:forEach items="${list}" var="b">
									<tr id="${b.bo_no}">
									
										<td class="title">${b.rnum }</td>
										
										<td class="text-al-left title">
										
										   <c:if test="${b.bo_title.length() gt 27}">
                                                   ${b.bo_title.substring(0,27) } ...
                                           </c:if>
                                           <c:if test="${b.bo_title.length()le 27}">
                                                   ${b.bo_title}
                                           </c:if> 
										
											<div hidden>
												<c:set var="now" value="<%=new java.util.Date()%>" />
												<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd" /></c:set> 
												<c:set var="after3days" value="<%=new Date(new Date().getTime() + 60*60*24*1000*3) %>" />
												<fmt:formatDate value="${after3days }" type="DATE" pattern="yyyy/MM/dd"/>
												<fmt:formatDate var="now" value="${b.bo_date }" pattern="yyyy/MM/dd"/>
											</div>
										<c:choose>
											<c:when test="${now <= after3days && now >= today}">
												&nbsp;&nbsp;<span class="badge badge-danger ml-auto">new&nbsp;</span>
											</c:when>
										</c:choose>
										
										
										</td>
										<td class="title">${b.writerName}[${b.dept_name }]</td>
										<td class="title">
										<fmt:formatDate value="${b.bo_date }" pattern="yyyy/MM/dd"/> <%--yyyy/MM/dd HH:mm --%>
										</td>
										<td>
											<c:if test="${b.fileCount>0 }">
												<i class="fa fa-paperclip"></i>
											</c:if>
											<c:if test="${b.fileCount eq 0 }">
												<i class="mdi mdi-close"></i>
											</c:if>
										</td>
									</tr>
									</c:forEach>
								</tbody>
								
							</table>
							<div style="float:right; position: relative; left: -40%;">
							<c:out value="${pageBar}" escapeXml="false"/> </div>
							</c:if><!-- (내역이 있을 때 ←)-->
							</div>
						</div>
					</div>
				</div>
				<!-- table <- -->


			</div></div>
			</div>
			
			
			<c:import url="../common/footer.jsp" />
			
		
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
		
		function goboardForm(){
			var value = $('#bo_code').val();
			
			location.href="${pageContext.request.contextPath}/documentboard/boardForm/"+value;
		}
	
	</script>
</body>
</html>