<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 교육결과보고서 작성하기</title>
<c:import url="../common/header.jsp" />
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
							<li class="breadcrumb-item"><span>메인페이지</span> <i class="fas fa-chevron-right"></i><span> 교육 </span> <i
								class="fas fa-chevron-right"></i><span class="text-info"> 교육 결과 보고서 작성하기</span></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body pb-5">
								<div style="width: 80%; margin-left: auto; margin-right: auto;">
									<h2 class="card-title mb-5">교육 결과 보고서 작성하기</h2>
									<form action="${pageContext.request.contextPath }/education/writeEduReport" method="post" enctype="multipart/form-data">
										<input type="hidden" name="edu_no" value="${edu_no }" />
										<div class="form-group mt-5 row">
											<label for="edurep_title" class="col-2 col-form-label">제목</label>
											<div class="col-10">
												<input class="form-control" type="text" id="edurep_title" name="edurep_title">
											</div>
										</div>
										<div class="form-group mt-5 row">
											<label for="edurep_title" class="col-2 col-form-label">교육내용</label>
											<div class="col-10">
												<textarea class="form-control" rows="12" name="edu_content" required="required"></textarea>
											</div>
										</div>
										<div class="form-group mt-5 row">
											<label for="edurep_title" class="col-2 col-form-label">교육소감</label>
											<div class="col-10">
												<textarea class="form-control" rows="3" name="edu_thoughts" required="required"></textarea>
											</div>
										</div>

										<div align="right" class="mb-5 mt-3">
											<input type="submit" value="제출하기" class="btn btn-info" /> <input type="reset" value="초기화" class="btn btn-danger" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
</body>
</html>