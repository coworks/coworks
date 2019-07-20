<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<div class="col-xlg-2 col-lg-4 col-md-4">
	<div class="card-body inbox-panel">
		<a href="app-compose.do"
			class="btn btn-danger mb-3 p-2 btn-block waves-effect waves-light">메일쓰기</a>
		<ul class="list-group list-group-full">
			<li class="list-group-item active"><a href="app-email.do"><i
					class="mdi mdi-gmail"></i> 메일함 </a><span
				class="badge badge-success ml-auto"> 읽지 않은 메일 수</span></li>
			<li class="list-group-item"><a href="javascript:void(0)"> <i
					class="mdi mdi-star"></i> 즐겨찾기
			</a></li>
			<li class="list-group-item"><a href="javascript:void(0)"> <i
					class="mdi mdi-send"></i> 임시저장
			</a><span class="badge badge-danger ml-auto">3</span></li>
			<li class="list-group-item "><a href="javascript:void(0)"> <i
					class="mdi mdi-file-document-box"></i> 보낸 메일함
			</a></li>
			<li class="list-group-item"><a href="javascript:void(0)"> <i
					class="mdi mdi-delete"></i> 휴지통
			</a></li>
		</ul>
		<h3 class="card-title mt-5">분류</h3>
		<div class="list-group b-0 mail-list">
			<a href="#" class="list-group-item"><span
				class="fa fa-circle text-info mr-2"></span>분류1</a> <a href="#"
				class="list-group-item"><span
				class="fa fa-circle text-warning mr-2"></span>분류2</a> <a href="#"
				class="list-group-item"><span
				class="fa fa-circle text-purple mr-2"></span>분류3</a> <a href="#"
				class="list-group-item"><span
				class="fa fa-circle text-danger mr-2"></span>분류4</a> <a href="#"
				class="list-group-item"><span
				class="fa fa-circle text-success mr-2"></span>분류5</a>
		</div>
	</div>
</div>
