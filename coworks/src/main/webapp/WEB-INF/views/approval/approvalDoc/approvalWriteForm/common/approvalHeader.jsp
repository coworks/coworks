<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<input type="hidden" value="${formNo }" name="aform_no"/>
<table class="table table-bordered no-wrap">
	<tbody>
		<tr>
			<th scope="col" class="border">문서번호</th>
			<td>
				<input type="text" class="form-control" value="자동입력" readonly="readonly" />
			</td>
			<th scope="col" class="border">보존년한</th>
			<td>
				<div class="input-group mb-3">
					<input type="number" class="form-control" name="expiration" aria-describedby="expiration_post">
					<div class="input-group-append">
						<span class="input-group-text" id="expiration_post">년</span>
					</div>
				</div>
			</td>
			<th scope="col" class="border">보안등급</th>
			<td>
				<div class="input-group mb-3">
					<input type="number" class="form-control" name="adoc_security" aria-describedby="security_post">
					<div class="input-group-append">
						<span class="input-group-text" id="security_post">등급</span>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="col" class="border">사번</th>
			<td>
				<input type="number" class="form-control" value="10236421" name="adoc_writerno" />
			</td>
			<th scope="col" class="border">기안자명</th>
			<td>
				<input type="text" class="form-control" name="writerName" />
			</td>
			<th scope="col" class="border">부서</th>
			<td>
				<input type="text" class="form-control" value="영업부" name="writerDept" />
			</td>
		</tr>
		<tr>
			<th scope="col" class="border">문서 제목</th>
			<td colspan="5">
				<input type="text" class="form-control" name="adoc_subject" />
			</td>
		</tr>
	</tbody>
</table>
<div style="height: 200px">
	<table class="table table-bordered no-wrap">
		<thead>
			<tr>
				<th colspan="3"><b>결재선</b></th>
				<th><input type="button" class="btn btn-info" value="추가하기" style="float: right;" /></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th></th>
				<th>이름</th>
				<th>부서</th>
				<th>직급</th>
			</tr>
			<tr>
				<td>1</td>
				<td>김둘리</td>
				<td>총무부</td>
				<td>ㅇㅇ</td>
			</tr>

		</tbody>
	</table>
</div>