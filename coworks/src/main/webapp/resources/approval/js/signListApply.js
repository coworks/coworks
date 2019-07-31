$("#treeview").hummingbird();

$(function() {
	var empno = $('input[name=adoc_writerno]').val();
	console.log(empno);
	$('input[value=' + empno + ']').attr('disabled', 'disabled');
});

function applySelect() {
	var signList = $('input[name=signList]:checked');
	console.log(signList);

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

			table.append("<input type='hidden' name='signList' value="
					+ index.value + ">");

			$('#signTable tbody').append(table);

		}
	}
};
