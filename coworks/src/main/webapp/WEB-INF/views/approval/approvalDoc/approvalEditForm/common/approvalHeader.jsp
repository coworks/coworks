<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table table-bordered no-wrap">
	<tbody>
		<tr>
			<th scope="col" class="border">문서번호</th>
			<td><input type="text" class="form-control" value="${doc.adoc_no }" readonly="readonly" name="adoc_no"/></td>
			<th scope="col" class="border">보존년한</th>
			<td><input type="text" class="form-control" value="변경불가" readonly="readonly"></td>
			<th scope="col" class="border">보안등급</th>
			<td>
				<div class="input-group mb-3">
					<input type="number" class="form-control" name="adoc_security" aria-describedby="security_post" required="required" min="1" max="5" value="${doc.adoc_security}">
					<div class="input-group-append">
						<span class="input-group-text" id="security_post">등급</span>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="col" class="border">사번</th>
			<td><input type="number" class="form-control" value="${employee.emp_no }" readonly="readonly" name="adoc_writerno"/></td>
			<th scope="col" class="border">기안자명</th>
			<td><input type="text" class="form-control" value="${employee.emp_name }" readonly="readonly" /></td>
			<th scope="col" class="border">부서</th>
			<td><input type="text" class="form-control" value="${employee.dept_name }" readonly="readonly" /></td>
		</tr>
		<tr>
			<th scope="col" class="border">문서 제목</th>
			<td colspan="5"><input type="text" class="form-control" name="adoc_subject" required="required" value="${doc.adoc_subject }" /></td>
		</tr>
	</tbody>
</table>


<div style="height: 150px; border: 1px solid lightgray;" class="p-1 mb-2">
	<table class="table no-wrap" id="signTable">
		<thead>
			<tr>
				<th colspan="4" scope="col" class="border"><b>결재선</b><input type="button" class="btn btn-info btn-sm mb-1" value="추가하기" style="float: right;" data-target="#responsive-modal" data-toggle="modal" /></th>
			</tr>
			<tr>
				<th></th>
				<th>이름</th>
				<th>부서</th>
				<th>직급</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<input type="hidden" name="signList" value="${signList[0].emp_no }"/>
				<td>1</td>
				<td>${signList[0].emp_name }</td>
				<td>${signList[0].dept_name }</td>
				<td>${signList[0].job_title }</td>
			</tr>
			<tr><input type="hidden" name="signList" value="${signList[1].emp_no }"/>
				<td>2</td>
				<td>${signList[1].emp_name }</td>
				<td>${signList[1].dept_name }</td>
				<td>${signList[1].job_title }</td>
			</tr>
		</tbody>
	</table>
</div>
