<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<input type="hidden" value="${formNo }" name="aform_no" />
<table class="table table-bordered no-wrap">
	<tbody>
		<tr>
			<th scope="col" class="border">문서번호</th>
			<td><input type="text" class="form-control" value="자동입력" readonly="readonly" /></td>
			<th scope="col" class="border">보존년한</th>
			<td>
				<div class="input-group mb-3">
					<input type="number" class="form-control" name="expiration" aria-describedby="expiration_post" required="required" min="1" max="10">
					<div class="input-group-append">
						<span class="input-group-text" id="expiration_post">년</span>
					</div>
				</div>
			</td>
			<th scope="col" class="border">보안등급</th>
			<td>
				<div class="input-group mb-3">
					<input type="number" class="form-control" name="adoc_security" aria-describedby="security_post" required="required" min="1" max="5">
					<div class="input-group-append">
						<span class="input-group-text" id="security_post">등급</span>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="col" class="border">사번</th>
			<td><input type="number" class="form-control" value="${employee.emp_no }" name="adoc_writerno" readonly="readonly" /></td>
			<th scope="col" class="border">기안자명</th>
			<td><input type="text" class="form-control" value="${employee.emp_name }" readonly="readonly" /></td>
			<th scope="col" class="border">부서</th>
			<td><input type="text" class="form-control" value="${employee.dept_name }" readonly="readonly" /></td>
		</tr>
		<tr>
			<th scope="col" class="border">문서 제목</th>
			<td colspan="5"><input type="text" class="form-control" name="adoc_subject" required="required" /></td>
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

		</tbody>
	</table>
</div>
