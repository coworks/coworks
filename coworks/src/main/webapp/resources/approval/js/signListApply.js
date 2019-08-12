$("#treeview").hummingbird();

$(function() {
	var empno = $('input[name=adoc_writerno]').val();
	console.log(empno);
	$('.modal input[value=' + empno + ']').attr('disabled', 'disabled');

});

function applySelect() {
	var signList = $('input[name=signList]:checked');

	if (signList.length != 2) {
		alert("결재자는 2명을 선택해야합니다.");
	} else {
		$('.modal').modal("hide");
		$('#signTable tbody').children().remove();

		for (var i = 1, len = signList.length; i <= len; i++) {
			var index = signList[len - i];

			console.log(index.dataset);

			var table = $('<tr>');
			table.append('<td>' + i + '</td>');
			table.append('<td>' + index.dataset.name + '</td>');
			table.append('<td>' + index.dataset.dept + '</td>');
			table.append('<td>' + index.dataset.job + '</td>');

			$('#signTable tbody').append(table);

		}
	}
};

function check() {
	if ($('input[name=signList]:checked').length != 2
			&& $('input[type=hidden][name=signList]').length != 2) {
		alert("결재자를 선택해주세요");
		return false;
	}
}

function tableCheck() {
	var result = true;

	if ($('[name=expiration]').val() == ""||$('[name=expiration]').val()>10||$('[name=expiration]').val()<1) {
		alert("1~10 사이의 보존년한을 입력하세요");
		result = false;
		return;
	}
	if ($('[name=adoc_security]').val() == "") {
		alert("1~5 사이의 보안등급을 입력하세요");
		result = false;
		return;
	}
	if ($('[name=adoc_subject]').val() == "") {
		alert("제목을 입력하세요");
		result = false;
		return;
	}

	if ($('input[name=signList]:checked').length != 2
			&& $('input[type=hidden][name=signList]').length != 2) {
		alert("결재자를 선택해주세요");
		result = false;
		return;
	}

	$('#row1 td').each(function(i, e) {
		if ($(this).val() == "") {
			alert("내용을 입력하세요");
			result = false;
			return false;
		}

	});

	return result;

}
