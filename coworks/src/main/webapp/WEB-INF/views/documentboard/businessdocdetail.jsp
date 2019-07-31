<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 상세 보기</title>
<c:import url="../common/header.jsp" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid">
				
				<!-- 시작 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="row col-xlg-9 col-lg-8 col-md-7 align-self-center">
								
								<div class="card-body">
                                        <div class="card b-all shadow-none">
                                            <div class="card-body">
                                                <h3 class="card-title mb-0" style="color : #009999; font-weight:bold">${board.bo_title }</h3>
                                            </div>
                                            <div>
                                                <hr class="mt-0">
                                            </div>
                                            <div class="card-body">
                                                <div class="d-flex mb-5">
                                                    <div>
													<img
														src="${pageContext.request.contextPath}/resources/images/boardImg/noun_user.png"
														style="width: 60px; vertical-align: middle;" />
													</div>
                                                    <div class="pl-3" style="padding-top : 6px;">
                                                        <h4 class="mb-0">작성자 : ${board.emp_no }</h4>
                                                        <small class="text-muted">작성 날짜 : <fmt:formatDate value="${board.bo_date }" pattern="yyyy년MM월dd일 HH:mm"/></small>
                                                    </div>
                                                </div>
                                                <p><b>${board.bo_content }</b></p>
                                            </div>
                                            <div>
                                                <hr class="mt-0">
                                            </div>
                                            <div class="card-body">
                                                <h4><i class="fa fa-paperclip mr-2 mb-2"></i> 첨부파일 <span>[${attachmentList.size()}]</span></h4>
                                                <div class="row">
                                                    <c:forEach items="${attachmentList}" var="at">
                                                     <div class="col-md-2">
                                                        <a href="${pageContext.request.contextPath}/${at.getAttach_path()}/${at.getAttach_rename()}" download="${at.getAttach_oriname()}">
                                                        <div class="">${at.getAttach_oriname() }
                                                        </div>
                                                         </a>
                                                   	 </div><br>
                                                    </c:forEach>
                                                </div>
                                               
                                            </div>
                                            
                                        </div>
                                        <div style="text-align : right;">
                                        <c:if test="${board.bo_code ne null}">
                                        <a class="btn btn-info waves-effect waves-light" onclick="listView();" style="color:white;"><i class="fas fa-list-ul"></i>목록</a> &nbsp;
                                        </c:if>
                                        <c:if test="${ sessionScope.employee.emp_no eq board.getEmp_no() }">
                                            	<a class="btn btn-warning waves-effect waves-light" onclick="updateView();" style="color:white;"><i class="ti-pencil"></i>수정</a> &nbsp;
                                            	<a href="#" class="btn btn-danger waves-effect waves-light" onclick="deleteboard();"><i class="fa fa-times"></i>삭제</a>
                                        </c:if>
                                        </div> 
                                    </div>								
							</div>
						</div>
					</div>
				
				</div>
				
				
				
				
				<!-- 끝 -->
				
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script>
		function updateView(){
			console.log("bo_code=${bo_code}");
			console.log("bo_no=${board.bo_no}");
			console.log("emp_no=${board.emp_no}");
			location.href="${pageContext.request.contextPath}/documentboard/${bo_code}/${board.bo_no}/${board.emp_no}";			
		}
		
		function deleteboard(){
			console.log("bo_code=${bo_code}");
			console.log("bo_no=${board.bo_no}");
			console.log("emp_no=${board.bo_content}");
			location.href="${pageContext.request.contextPath}/documentboard/${bo_code}/${board.bo_no}/${board.bo_content}";		
		}
		
		function listView(){
			location.href="${pageContext.request.contextPath}/documentboard/${board.bo_code}";
		}
	</script>
</body>
</html>