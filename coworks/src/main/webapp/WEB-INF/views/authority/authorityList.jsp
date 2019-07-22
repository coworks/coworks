<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>co-works : 인사관리</title>
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

				<div class="col-12">
					<!-- Column -->
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">인사관리</h4>
							<div id="basicgrid" class="jsgrid"
								style="position: relative; height: 500px; width: 100%;">
								<div class="jsgrid-grid-header jsgrid-header-scrollbar">
									<table class="jsgrid-table table table-striped table-hover">
										<tr class="jsgrid-header-row">
											<th class="jsgrid-header-cell jsgrid-header-sortable"
												style="width: 150px;">Name</th>
											<th
												class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
												style="width: 70px;">Age</th>
											<th class="jsgrid-header-cell jsgrid-header-sortable"
												style="width: 200px;">Address</th>
											<th
												class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
												style="width: 100px;">Country</th>
											<th class="jsgrid-header-cell jsgrid-align-center"
												style="width: 100px;">Is Married</th>
											<th
												class="jsgrid-header-cell jsgrid-control-field jsgrid-align-center"
												style="width: 50px;"><button
													class="jsgrid-button jsgrid-mode-button jsgrid-search-mode-button jsgrid-mode-on-button"
													type="button" title=""></button></th>
										</tr>
										<tr class="jsgrid-filter-row">
											<td class="jsgrid-cell" style="width: 150px;"><input
												type="text" class="form-control input-sm"></td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 70px;"><input type="number"
												class="form-control input-sm"></td>
											<td class="jsgrid-cell" style="width: 200px;"><input
												type="text" class="form-control input-sm"></td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><select
												class="form-control input-sm"><option value="0"></option>
													<option value="1">United States</option>
													<option value="2">Canada</option>
													<option value="3">United Kingdom</option>
													<option value="4">France</option>
													<option value="5">Brazil</option>
													<option value="6">China</option>
													<option value="7">Russia</option></select></td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><input type="checkbox"
												readonly=""></td>
											<td
												class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
												style="width: 50px;"><button
													class="jsgrid-button jsgrid-search-button" type="button"
													title="Search"></button>
												<button class="jsgrid-button jsgrid-clear-filter-button"
													type="button" title="Clear filter"></button></td>
										</tr>
										<tr class="jsgrid-insert-row" style="display: none;">
											<td class="jsgrid-cell" style="width: 150px;"><input
												type="text" class="form-control input-sm"></td>
											<td class="jsgrid-cell jsgrid-align-right"
												style="width: 70px;"><input type="number"
												class="form-control input-sm"></td>
											<td class="jsgrid-cell" style="width: 200px;"><input
												type="text" class="form-control input-sm"></td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><select
												class="form-control input-sm"><option value="0"></option>
													<option value="1">United States</option>
													<option value="2">Canada</option>
													<option value="3">United Kingdom</option>
													<option value="4">France</option>
													<option value="5">Brazil</option>
													<option value="6">China</option>
													<option value="7">Russia</option></select></td>
											<td class="jsgrid-cell jsgrid-align-center"
												style="width: 100px;"><input type="checkbox"></td>
											<td
												class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
												style="width: 50px;"><button
													class="jsgrid-button jsgrid-insert-button" type="button"
													title="Insert"></button></td>
										</tr>
									</table>
								</div>
								<div class="jsgrid-grid-body" style="height: 297.2px;">
									<table class="jsgrid-table table table-striped table-hover">
										<tbody>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell" style="width: 150px;">Otto Clay</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">61</td>
												<td class="jsgrid-cell" style="width: 200px;">Ap
													#897-1459 Quam Avenue</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">China</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-alt-row">
												<td class="jsgrid-cell" style="width: 150px;">Connor
													Johnston</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">73</td>
												<td class="jsgrid-cell" style="width: 200px;">Ap
													#370-4647 Dis Av.</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">Russia</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell" style="width: 150px;">Lacey
													Hess</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">29</td>
												<td class="jsgrid-cell" style="width: 200px;">Ap
													#365-8835 Integer St.</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">Russia</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-alt-row">
												<td class="jsgrid-cell" style="width: 150px;">Timothy
													Henson</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">78</td>
												<td class="jsgrid-cell" style="width: 200px;">911-5143
													Luctus Ave</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">United States</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell" style="width: 150px;">Ramona
													Benton</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">43</td>
												<td class="jsgrid-cell" style="width: 200px;">Ap
													#614-689 Vehicula Street</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">Brazil</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-alt-row">
												<td class="jsgrid-cell" style="width: 150px;">Ezra
													Tillman</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">51</td>
												<td class="jsgrid-cell" style="width: 200px;">P.O. Box
													738, 7583 Quisque St.</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">United States</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell" style="width: 150px;">Dante
													Carter</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">59</td>
												<td class="jsgrid-cell" style="width: 200px;">P.O. Box
													976, 6316 Lorem, St.</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">United States</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-alt-row">
												<td class="jsgrid-cell" style="width: 150px;">Christopher
													Mcclure</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">58</td>
												<td class="jsgrid-cell" style="width: 200px;">847-4303
													Dictum Av.</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">United States</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell" style="width: 150px;">Ruby
													Rocha</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">62</td>
												<td class="jsgrid-cell" style="width: 200px;">5212
													Sagittis Ave</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">Canada</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-alt-row">
												<td class="jsgrid-cell" style="width: 150px;">Imelda
													Hardin</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">39</td>
												<td class="jsgrid-cell" style="width: 200px;">719-7009
													Auctor Av.</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">Brazil</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell" style="width: 150px;">Jonah
													Johns</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">28</td>
												<td class="jsgrid-cell" style="width: 200px;">P.O. Box
													939, 9310 A Ave</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">Brazil</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-alt-row">
												<td class="jsgrid-cell" style="width: 150px;">Herman
													Rosa</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">49</td>
												<td class="jsgrid-cell" style="width: 200px;">718-7162
													Molestie Av.</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">Russia</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell" style="width: 150px;">Arthur
													Gay</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">20</td>
												<td class="jsgrid-cell" style="width: 200px;">5497
													Neque Street</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">Russia</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-alt-row">
												<td class="jsgrid-cell" style="width: 150px;">Xena
													Wilkerson</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">63</td>
												<td class="jsgrid-cell" style="width: 200px;">Ap
													#303-6974 Proin Street</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">United States</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
											<tr class="jsgrid-row">
												<td class="jsgrid-cell" style="width: 150px;">Lilah
													Atkins</td>
												<td class="jsgrid-cell jsgrid-align-right"
													style="width: 70px;">33</td>
												<td class="jsgrid-cell" style="width: 200px;">622-8602
													Gravida Ave</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;">Brazil</td>
												<td class="jsgrid-cell jsgrid-align-center"
													style="width: 100px;"><input type="checkbox"
													disabled=""></td>
												<td
													class="jsgrid-cell jsgrid-control-field jsgrid-align-center"
													style="width: 50px;"><button
														class="jsgrid-button jsgrid-edit-button" type="button"
														title="Edit"></button>
													<button class="jsgrid-button jsgrid-delete-button"
														type="button" title="Delete"></button></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="jsgrid-pager-container" style="">
									<div class="jsgrid-pager">
										Pages: <span
											class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a
											href="javascript:void(0);">First</a></span> <span
											class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a
											href="javascript:void(0);">Prev</a></span> <span
											class="jsgrid-pager-page jsgrid-pager-current-page">1</span><span
											class="jsgrid-pager-page"><a
											href="javascript:void(0);">2</a></span><span
											class="jsgrid-pager-page"><a
											href="javascript:void(0);">3</a></span><span
											class="jsgrid-pager-page"><a
											href="javascript:void(0);">4</a></span><span
											class="jsgrid-pager-page"><a
											href="javascript:void(0);">5</a></span><span
											class="jsgrid-pager-nav-button"><a
											href="javascript:void(0);">...</a></span> <span
											class="jsgrid-pager-nav-button"><a
											href="javascript:void(0);">Next</a></span> <span
											class="jsgrid-pager-nav-button"><a
											href="javascript:void(0);">Last</a></span> &nbsp;&nbsp; 1 of 7
									</div>
								</div>
								<div class="jsgrid-load-shader"
									style="display: none; position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; z-index: 1000;"></div>
								<div class="jsgrid-load-panel"
									style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;">Please,
									wait...</div>
							</div>
						</div>
					</div>
				</div>






			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/db.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/templates/assets/plugins/jsgrid/jsgrid.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/templates/resources/js/jsgrid-init.js"></script>
</body>
</html>