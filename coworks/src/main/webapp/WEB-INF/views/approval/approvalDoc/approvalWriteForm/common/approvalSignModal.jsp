<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="responsive-modal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">결재선 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
			</div>
			<div class="modal-body">
				<div id="treeview_container" class="hummingbird-treeview p-3" style="overflow: auto; height: 300px;">
					<c:set var="index" value="0" />
					<ul id="treeview" class="hummingbird-base">
						<c:forEach var="dept" items="${deptList }" varStatus="vs">
							<li><i class="fa fa-plus"></i> <label>${dept.DEPT_NAME }</label>
								<ul>
									<c:forEach var="deptEmp" begin="1" end="${dept.COUNT }" step="1">
										<li><label> <input class="hummingbirdNoParent" name="signList" value="${empList[index].emp_no}" type="checkbox" data-name="${empList[index].emp_name }" data-job="${empList[index].job_title }" data-dept="${empList[index].dept_name }"> ${empList[index].emp_name } ( ${empList[index].job_title } )
										</label></li>
										<c:set var="index" value="${index+1 }"></c:set>
									</c:forEach>
								</ul></li>
						</c:forEach>
					</ul>

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-success waves-effect waves-light" onclick="applySelect()">저장하기</button>
			</div>
		</div>
	</div>
</div>
