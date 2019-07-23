<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="col-12" style="text-align: center;">
	<h1 class="mb-5">문서제목</h1>
	<div class="row">
		<div class="col-4">
			<table class="no-wrap table-bordered table fixed">
			<col width="80px">
				<tr>
					<th scope="col" class="border">문서번호</th>
					<td></td>
				</tr>
				<tr>
					<th scope="col" class="border">보존년한</th>
					<td></td>
				</tr>
				<tr>
					<th scope="col" class="border">보안등급</th>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="col-4"></div>
		<div class="col-4">
			<table class="no-wrap table-bordered table fixed">
				<col width="20px"/>
				<col width="60px"/>
				<col width="60px"/>
				<col width="60px"/>
				<tr>
					<th rowspan="3" width="15px">결<br />재
					</th>
					<th scope="col" class="border" width="60px">담당</th>
					<th scope="col" class="border" width="60px">담당</th>
					<th scope="col" class="border" width="60px"></th>

				</tr>
				<tr>
					<td>
						<img alt="담당자sign" src="${pageContext.request.contextPath}/resources/images/empSign/stamp.png" width="50px" height="50px">
					</td>
					<td>
						<img alt="담당자sign" src="${pageContext.request.contextPath}/resources/images/empSign/stamp.png" width="50px" height="50px">
					</td>
					<td>
						<%-- 						<img alt="담당자sign" src="${pageContext.request.contextPath}/resources/images/empSign/stamp.png" width="50px" height="50px">
 --%>
					</td>
				</tr>
				<tr>
					<td>2019-07-23</td>
					<td>2019-07-23</td>
					<td></td>

				</tr>
			</table>
		</div>

		<div class="col-12">
			<table class="no-wrap table-bordered table">
				<tr>
					<th scope="col" class="border" width="100px">소속</th>
					<td></td>
				</tr>
				<tr>
					<th scope="col" class="border">성명</th>
					<td></td>
				</tr>
				<tr>
					<th scope="col" class="border">직책</th>
					<td></td>
				</tr>
			</table>
			<table class="no-wrap table-bordered table">
				<tr>
					<td height="500px"></td>
				</tr>
			</table>
		</div>
		<div class="col-9"></div>
		<div class="col-3" style="text-align: left">
			<span>일자 : </span><br /> <span> 서명 :</span> <span>(인)</span>
		</div>
	</div>
</div>