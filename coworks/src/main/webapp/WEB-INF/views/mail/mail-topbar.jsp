<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<div class="card-body">
	<div class="btn-group mb-2 mr-2" role="group"
		aria-label="Button group with nested dropdown">
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/mail/storeMail.do'" class="btn btn-secondary font-18 text-dark">
			<i class="mdi mdi-inbox-arrow-down"></i>
		</button>
		<button type="button" class="btn btn-secondary font-18 text-dark">
			<i class="mdi mdi-alert-octagon"></i>
		</button>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/mail/deleteMail.do'" class="btn btn-secondary font-18 text-dark">
			<i class="mdi mdi-delete"></i>
		</button>
	</div>
	<div class="btn-group mb-2 mr-2" role="group"
		aria-label="Button group with nested dropdown">
		<div class="btn-group" role="group">
			<button id="btnGroupDrop1" type="button"
				class="btn btn-secondary text-dark dropdown-toggle"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="mdi mdi-folder font-18 "></i>
			</button>
			<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
				<a class="dropdown-item" href="/mail/updateFolder.do/1">폴더 1로 이동</a> <a
					class="dropdown-item" href="/mail/updateFolder.do/2">폴더 2로 이동</a>
			</div>
		</div>
		<div class="btn-group" role="group">
			<button id="btnGroupDrop1" type="button"
				class="btn text-dark btn-secondary dropdown-toggle"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="mdi mdi-label font-18"></i>
			</button>
			<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
				<a class="dropdown-item" href="#">Dropdown link</a> <a
					class="dropdown-item" href="#">Dropdown link</a>
			</div>
		</div>
	</div>
	<button type="button" onclick="location.reload();" class="btn btn-secondary mr-2 mb-2 text-dark">
		<i class="mdi mdi-reload font-18"></i>
	</button>
	<div class="btn-group mb-2" role="group">
		<button id="btnGroupDrop1" type="button"
			class="btn text-dark btn-secondary p-2 dropdown-toggle"
			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			More</button>
		<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
			<a class="dropdown-item" href="#">Mark as all read</a> <a
				class="dropdown-item" href="#">Dropdown link</a>
		</div>
	</div>
</div>