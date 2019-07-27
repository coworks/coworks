<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id='file-list' class="mt-3 mb-3">
	<i class="fas fa-paperclip"></i> 첨부파일 <input type="button" id='button-add-file' value='파일 추가' class="btn btn-outline-secondary btn-sm" />
</div>
<script>
	var count = 0;
	$('#button-add-file')
			.on(
					"click",
					function() {
						var html = "<div id='item_"+count+"' class='m-2'>";
						html += "<input type='file' name='upFiles' multiple/>";
						html += "<input type='button' onclick='deleteBtn(this)' class='btn  btn-outline-danger btn-xs' value='X'/></div>";
						count++;
						$("#file-list").append(html);
					});

	function deleteBtn(obj) {
		$(obj).parent().remove();
	}
</script>