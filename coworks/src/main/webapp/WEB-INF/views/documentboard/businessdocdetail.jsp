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
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid-theme.min.css">
<link
	href="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.min.css"
	rel="stylesheet">
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
							<li class="breadcrumb-item"><input type="text"
								id="boardCode" value="${boardCode }" hidden> <c:choose>
									<c:when test="${boardCode eq 'D50' }">
										<input type="text" name="boardCode" value="${boardCode }"
											hidden>
										<span>자료실</span>
										<i class="fas fa-chevron-right"></i>
										<span class="text-info"> 사내규정 자료실</span>
									</c:when>
									<c:when test="${boardCode eq 'D51' }">
										<input type="text" name="boardCode" value="${boardCode }"
											hidden>
										<span>자료실</span>
										<i class="fas fa-chevron-right"></i>
										<span class="text-info"> 업무자료 자료실</span>
									</c:when>
									<c:when test="${boardCode eq 'D52' }">
										<input type="text" name="boardCode" value="${boardCode }"
											hidden>
										<span>자료실</span>
										<i class="fas fa-chevron-right"></i>
										<span class="text-info"> 교육자료 자료실</span>
									</c:when>
									<c:when test="${boardCode eq 'D53' }">
										<input type="text" name="boardCode" value="${boardCode }"
											hidden>
										<span>게시판</span>
										<i class="fas fa-chevron-right"></i>
										<span class="text-info"> 공지사항</span>
									</c:when>
									<c:when test="${boardCode eq 'D54' }">
										<input type="text" name="boardCode" value="${boardCode }"
											hidden>
										<span>게시판</span>
										<i class="fas fa-chevron-right"></i>
										<span class="text-info"> 경조사</span>
									</c:when>
									<c:when test="${boardCode eq 'D55' }">
										<input type="text" name="boardCode" value="${boardCode }"
											hidden>
										<span>게시판</span>
										<i class="fas fa-chevron-right"></i>
										<span class="text-info"> 조직개편 및 인사이동</span>
									</c:when>
									<c:when test="${boardCode eq 'D56' }">
										<input type="text" name="boardCode" value="${boardCode }"
											hidden>
										<span>게시판</span>
										<i class="fas fa-chevron-right"></i>
										<span class="text-info"> News</span>
									</c:when>
									<c:when test="${bo_code eq 'D57' }">
										<input type="text" name="boardCode" value="${boardCode }"
											hidden>
										<span>게시판</span>
										<i class="fas fa-chevron-right"></i>
										<span class="text-info"> 자유게시판</span>
									</c:when>
									<c:otherwise>
										<input type="text" name="boardCode" value="${boardCode }"
											hidden>
										<span>게시판</span>
										<i class="fas fa-chevron-right"></i>
										<span class="text-info"> 부서게시판</span>
									</c:otherwise>
								</c:choose></li>
						</ol>
					</div>
				</div>

				<!-- 시작 -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="row col-xlg-9 col-lg-8 col-md-7 align-self-center">

								<div class="card-body">
									<div class="card b-all shadow-none">
										<div class="card-body">
											<h3 class="card-title mb-0"
												style="color: #009999; font-weight: bold">${board.bo_title }</h3>
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
												<div class="pl-3" style="padding-top: 6px;">
													<h4 class="mb-0" name="bo_writerName">작성자 :
														${board.writerName }</h4>
													<small class="text-muted" name="bo_date">작성 날짜 : <fmt:formatDate
															value="${board.bo_date }" pattern="yyyy년MM월dd일 HH:mm" /></small>
													<input type="text" value="${board.bo_no }" name="bo_no"
														hidden /> <input type="text" value="${board.bo_code }"
														name="bo_code" hidden />
												</div>
											</div>
											<p>
												<b name="bo_content">${board.bo_content }</b>
											</p>
										</div>
										<div>
											<hr class="mt-0">
										</div>
										<div class="card-body">
											<h4>
												<i class="fa fa-paperclip mr-2 mb-2"></i> 첨부파일 <span>[${attachmentList.size()}]</span>
											</h4>
											<div class="row">
												<div class="">
													<%-- <a href="${pageContext.request.contextPath}/${at.getAttach_path()}/${at.getAttach_rename()}" download="${at.getAttach_oriname()}"> --%>
													<%-- <c:forEach items="${attachmentList}" var="a" varStatus="vs">
														<button type="button"
															class="btn btn-outline-primary waves-effect waves-light"
															onclick="fileDownload('${a.attach_oriname}','${a.attach_rename }');">
															<i class="ti-download" style="color: black"></i>&nbsp;&nbsp;
															${vs.count} -${a.attach_oriname }
														</button>&nbsp; </c:forEach> --%>


													<c:forEach items="${attachmentList}" var="at">
														<a
															href="<c:url value='/board/fileDownload?name=${at.attach_oriname }&path=${at.attach_path}/${at.attach_rename }'/>">
															<div
																class="btn btn-outline-primary waves-effect waves-light">
																<i class="ti-download" style="color: black"></i>&nbsp;&nbsp;
																${at.attach_oriname }
															</div>&nbsp;
														</a>
													</c:forEach>





													
												</div>
												<br>

											</div>

										</div>

									</div>
									<div style="text-align: right;">
										<c:if test="${board.bo_code ne null}">
											<button class="btn btn-outline-info waves-effect waves-light"
												onclick="listView();">
												<i class="fas fa-list-ul"></i>목록
											</button>	
											&nbsp;
                                        </c:if>
										<c:if
											test="${ sessionScope.employee.emp_no eq board.getEmp_no() }">
											<button
												class="btn btn-outline-warning waves-effect waves-light"
												onclick="updateView();">
												<i class="ti-pencil"></i>수정
											</button>
                                            	&nbsp;										
												<button
												class="btn btn-outline-danger waves-effect waves-light"
												id="sa-passparameter" alt="alert">
												<i class="fa fa-times"></i>삭제
											</button>

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
		function updateView() {
			console.log("bo_code=${bo_code}");
			console.log("bo_no=${board.bo_no}");
			console.log("emp_no=${board.emp_no}");
			location.href = "${pageContext.request.contextPath}/documentboard/${bo_code}/${board.bo_no}/${board.emp_no}";
		}

		function listView() {
			location.href = "${pageContext.request.contextPath}/documentboard/${board.bo_code}";
		}

		function fileDownload(oName, rName) {
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href = "${pageContext.request.contextPath}/documentboard/fileDownload.do?oName="
					+ oName + "&rName=" + rName;
		}
		

		$("#sa-passparameter").click(function () {
			
            const swalWithBootstrapButtons = Swal.mixin({
                customClass: {
                    confirmButton: 'btn btn-success',
                    cancelButton: 'mr-2 btn btn-danger'
                },
                buttonsStyling: false,
            })

            swalWithBootstrapButtons.fire({
                title: '글을 삭제하시겠습니까?',
                text: '글 제목 : [ ' + "${board.bo_title}" +' ]',
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: '삭제하기',
                cancelButtonText: '취소하기',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    swalWithBootstrapButtons.fire(
                        '삭제완료!',
                        '게시글이 삭제되었습니다.',
                        'success'
                    )
                    location.href = "${pageContext.request.contextPath}/documentboard/delboard.do?bo_code="+$('[name=bo_code]').val()+"&bo_no="+$('[name=bo_no]').val();
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === Swal.DismissReason.cancel
                ) {
                    swalWithBootstrapButtons.fire(
                        '삭제취소',
                        '게시글 삭제가 취소되었습니다.',
                        'error'
                    )
                }
            })
        });
		
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
</body>
</html>