<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 작성 폼</title>

<c:import url="../common/header.jsp" />

<!-- wysihtml5 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/bootstrap-wysihtml5.css" />

<!-- Dropzone css -->
<link
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/dropzone-master/dist/dropzone.css"
	rel="stylesheet" type="text/css" />




</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />

		<div class="page-wrapper">
			<div class="container-fluid ">

				<!-- 시작 -->



				<div class="row">
					<div class="col-lg-12">
						<div class="card">



							<div class="col-xlg-9 col-lg-8 col-md-7 align-self-center">
								<div class="card-body" style="margin-bottom: 7%;">
									<h2 class="card-title text-info">새 글 등록</h2>
									<br>
									<form class="all-form" id="docEnrollFrm"
										action="${pageContext.request.contextPath}/documentboard/insert"
										method="post" enctype="multipart/form-data">
										<div class="form-group">


											<c:choose>
												<c:when test="${boardCode eq 'D50' }">
													<input type="text" name="bo_code" value="${boardCode }"
														hidden>
													<span>자료실</span>
													<i class="fas fa-chevron-right"></i>
													<span class="text-info"> 사내규정 자료실</span>
												</c:when>
												<c:when test="${boardCode eq 'D51' }">
													<input type="text" name="bo_code" value="${boardCode }"
														hidden>
													<span>자료실</span>
													<i class="fas fa-chevron-right"></i>
													<span class="text-info"> 업무자료 자료실</span>
												</c:when>
												<c:when test="${boardCode eq 'D52' }">
													<input type="text" name="bo_code" value="${boardCode }"
														hidden>
													<span>자료실</span>
													<i class="fas fa-chevron-right"></i>
													<span class="text-info"> 교육자료 자료실</span>
												</c:when>
												<c:when test="${boardCode eq 'D53' }">
													<input type="text" name="bo_code" value="${boardCode }"
														hidden>
													<span>게시판</span>
													<i class="fas fa-chevron-right"></i>
													<span class="text-info"> 공지사항</span>
												</c:when>
												<c:when test="${boardCode eq 'D54' }">
													<input type="text" name="bo_code" value="${boardCode }"
														hidden>
													<span>게시판</span>
													<i class="fas fa-chevron-right"></i>
													<span class="text-info"> 경조사</span>
												</c:when>
												<c:when test="${boardCode eq 'D55' }">
													<input type="text" name="bo_code" value="${boardCode }"
														hidden>
													<span>게시판</span>
													<i class="fas fa-chevron-right"></i>
													<span class="text-info"> 조직개편 및 인사이동</span>
												</c:when>
												<c:when test="${boardCode eq 'D56' }">
													<input type="text" name="bo_code" value="${boardCode }"
														hidden>
													<span>게시판</span>
													<i class="fas fa-chevron-right"></i>
													<span class="text-info"> News</span>
												</c:when>
												<c:when test="${boardCode eq 'D57' }">
													<input type="text" name="bo_code" value="${boardCode }"
														hidden>
													<span>게시판</span>
													<i class="fas fa-chevron-right"></i>
													<span class="text-info"> 자유게시판</span>
												</c:when>
												<c:otherwise>
													<input type="text" name="bo_code" value="${boardCode }"
														hidden>
													<span>게시판</span>
													<i class="fas fa-chevron-right"></i>
													<span class="text-info"> 부서게시판</span>
												</c:otherwise>
											</c:choose>






											<input type="text" name="emp_no"
												value="${sessionScope.employee.emp_no }" hidden /> <input
												type="text" name="writerName"
												value="${sessionScope.employee.emp_name }" hidden />
											<h4 name="writerName" style="float: right; padding-top: 5px;">작성자
												: ${sessionScope.employee.emp_name}</h4>
										</div>
										<div class="form-group">
											<input class="form-control writtentitle" name="bo_title"
												placeholder="제목을 입력하세요.">
										</div>
										<div class="form-group">

											<textarea class="textarea_editor form-control writtencontent"
												name="bo_content" rows="15" placeholder="내용을 입력하세요."></textarea>

										</div>
										<c:import
											url="../approval/approvalDoc/approvalWriteForm/common/approvalAttachAdd.jsp" />


										<div style="float: right;">

											<!-- <button class="btn btn-light waves-effect mt-3" onclick="goback();">
											<i class=" far fa-times-circle"></i> 취소
										</button> -->
											&nbsp;
											<button class="btn btn-success waves-effect mt-3"
												type="submit" onclick="return validate();">
												<i class="far fa-check-circle"></i> 등록
											</button>

										</div>
									</form>
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

	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/wysihtml5-0.3.0.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/bootstrap-wysihtml5.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/dropzone-master/dist/dropzone.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/styleswitcher/jQuery.style.switcher.js"
		aria-hidden="true"></script>

	<script>
		$(document).ready(function() {
			$('.textarea_editor').wysihtml5();
		});

		function deleteBtn(obj) {
			$(obj).parent().remove();
		}

		/* 	function goback() {
				
				 console.log("뒤로가기. --> 알람이 뜨면서 작성 취소할건지 물어봐야 함 / Form, UpdateView 둘 다 해야 한다.")
				window.history.forward(-1);
			} */

		function validate() {
			var boardContent = $(".writtencontent").val();
			var boardTitle = $(".writtentitle").val();

			
			 if (boardTitle == "") {
					Swal.fire({
		                title: "제목을 입력하세요!!",
		                timer: 1300,
		                showConfirmButton: false
		            });
					return false;
			} else if (boardContent == "") {
				Swal.fire({
	                title: "내용을 입력하세요!!",
	                timer: 1300,
	                showConfirmButton: false
	            });
				return false;
			}
			return true;
		}
	</script>

</body>
</html>