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
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div style="width: 80%; margin-left: auto; margin-right: auto;">
									<h2 class="card-title mb-5">교육 결과 보고서</h2>
									<form action="${pageContext.request.contextPath }/education/writeEduReport" method="post" enctype="multipart/form-data">
										<input type="hidden" name="edu_no" value="${edu_no }" /> <input type="text" class="form-control" name="edurep_title" />
										<div class="mt-2">
											<table class="table table-bordered no-wrap">
												<tr>
													<th scope="col" class="border">수료여부</th>
													<td colspan="5"></td>
												</tr>
												<tr>
													<th scope="col" class="border">교육내용</th>
													<td colspan="5"><textarea class="form-control" rows="5" name="edu_content" required="required"></textarea></td>
												</tr>
												<tr>
													<th scope="col" class="border">교육소감</th>
													<td colspan="5"><textarea class="form-control" rows="3" name="edu_thoughts" required="required"></textarea></td>
												</tr>
												</tbody>
											</table>

										</div>
										<div align="right">
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