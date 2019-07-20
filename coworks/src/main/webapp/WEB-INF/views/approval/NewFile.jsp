<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : test</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	window.jQuery
			|| document
					.write(decodeURIComponent('%3Cscript src="js/jquery.min.js"%3E%3C/script%3E'))
</script>
<link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/19.1.4/css/dx.common.css" />
<link rel="stylesheet" type="text/css" href="https://cdn3.devexpress.com/jslib/19.1.4/css/dx.light.css" />
<script src="https://cdn3.devexpress.com/jslib/19.1.4/js/dx.all.js"></script>

<style>
#treeview {
	height: 400px;
}
</style>
</head>
<body class="dx-viewport">
		<div id="treeview"></div>
	<script>
		var products = [ {
			id : "1_1",
			text : "Super Mart of the West",
			items : [ {
				id : "1_1_1",
				text : "Video Players",
				items : [ {
					id : "1_1_1_1",
					text : "HD Video Player",
					price : 220
				}, {
					id : "1_1_1_2",
					text : "SuperHD Video Player",
					price : 270
				} ]
			}, {
				id : "1_1_2",
				text : "Televisions",
				items : [ {
					id : "1_1_2_1",
					text : "SuperLCD 42",
					price : 1200
				}, {
					id : "1_1_2_2",
					text : "SuperLED 42",
					price : 1450
				}, {
					id : "1_1_2_3",
					text : "SuperLED 50",
					price : 1600
				}, {
					id : "1_1_2_4",
					text : "SuperLCD 55",
					price : 1350
				}, {
					id : "1_1_2_5",
					text : "SuperLCD 70",
					price : 4000
				} ]
			}, {
				id : "1_1_3",
				text : "Monitors",
				items : [ {
					id : "1_1_3_1",
					text : "19\"",
					items : [ {
						id : "1_1_3_1_1",
						text : "DesktopLCD 19",
						price : 160
					} ]
				}, {
					id : "1_1_3_2",
					text : "21\"",
					items : [ {
						id : "1_1_3_2_1",
						text : "DesktopLCD 21",
						price : 170
					}, {
						id : "1_1_3_2_2",
						text : "DesktopLED 21",
						price : 175
					} ]
				} ]
			}, {
				id : "1_1_4",
				text : "Projectors",
				items : [ {
					id : "1_1_4_1",
					text : "Projector Plus",
					price : 550
				}, {
					id : "1_1_4_2",
					text : "Projector PlusHD",
					price : 750
				} ]
			} ]

		}, {
			id : "1_2",
			text : "Braeburn",
			items : [ {
				id : "1_2_1",
				text : "Video Players",
				items : [ {
					id : "1_2_1_1",
					text : "HD Video Player",
					price : 240
				}, {
					id : "1_2_1_2",
					text : "SuperHD Video Player",
					price : 300
				} ]
			}, {
				id : "1_2_2",
				text : "Televisions",
				items : [ {
					id : "1_2_2_1",
					text : "SuperPlasma 50",
					price : 1800
				}, {
					id : "1_2_2_2",
					text : "SuperPlasma 65",
					price : 3500
				} ]
			}, {
				id : "1_2_3",
				text : "Monitors",
				items : [ {
					id : "1_2_3_1",
					text : "19\"",
					items : [ {
						id : "1_2_3_1_1",
						text : "DesktopLCD 19",
						price : 170
					} ]
				}, {
					id : "1_2_3_2",
					text : "21\"",
					items : [ {
						id : "1_2_3_2_1",
						text : "DesktopLCD 21",
						price : 180
					}, {
						id : "1_2_3_2_2",
						text : "DesktopLED 21",
						price : 190
					} ]
				} ]
			} ]

		}, {
			id : "1_3",
			text : "E-Mart",
			items : [ {
				id : "1_3_1",
				text : "Video Players",
				items : [ {
					id : "1_3_1_1",
					text : "HD Video Player",
					price : 220
				}, {
					id : "1_3_1_2",
					text : "SuperHD Video Player",
					price : 275
				} ]
			}, {
				id : "1_3_3",
				text : "Monitors",
				items : [ {
					id : "1_3_3_1",
					text : "19\"",
					items : [ {
						id : "1_3_3_1_1",
						text : "DesktopLCD 19",
						price : 165
					} ]
				}, {
					id : "1_3_3_2",
					text : "21\"",
					items : [ {
						id : "1_3_3_2_1",
						text : "DesktopLCD 21",
						price : 175
					} ]
				} ]
			} ]
		}, {
			id : "1_4",
			text : "Walters",
			items : [ {
				id : "1_4_1",
				text : "Video Players",
				items : [ {
					id : "1_4_1_1",
					text : "HD Video Player",
					price : 210
				}, {
					id : "1_4_1_2",
					text : "SuperHD Video Player",
					price : 250
				} ]
			}, {
				id : "1_4_2",
				text : "Televisions",
				items : [ {
					id : "1_4_2_1",
					text : "SuperLCD 42",
					price : 1100
				}, {
					id : "1_4_2_2",
					text : "SuperLED 42",
					price : 1400
				}, {
					id : "1_4_2_3",
					text : "SuperLED 50",
					price : 1500
				}, {
					id : "1_4_2_4",
					text : "SuperLCD 55",
					price : 1300
				}, {
					id : "1_4_2_5",
					text : "SuperLCD 70",
					price : 4000
				}, {
					id : "1_4_2_6",
					text : "SuperPlasma 50",
					price : 1700
				} ]
			}, {
				id : "1_4_3",
				text : "Monitors",
				items : [ {
					id : "1_4_3_1",
					text : "19\"",
					items : [ {
						id : "1_4_3_1_1",
						text : "DesktopLCD 19",
						price : 160
					} ]
				}, {
					id : "1_4_3_2",
					text : "21\"",
					items : [ {
						id : "1_4_3_2_1",
						text : "DesktopLCD 21",
						price : 170
					}, {
						id : "1_4_3_2_2",
						text : "DesktopLED 21",
						price : 180
					} ]
				} ]
			}, {
				id : "1_4_4",
				text : "Projectors",
				items : [ {
					id : "1_4_4_1",
					text : "Projector Plus",
					price : 550
				}, {
					id : "1_4_4_2",
					text : "Projector PlusHD",
					price : 750
				} ]
			} ]

		} ];
		
		$(function() {
			var treeView = $("#treeview").dxTreeView({
				items : products,
				width : 500,
				searchEnabled : true
			}).dxTreeView("instance");

			treeView.option("searchMode", "contains");

			/* $("#searchMode").dxSelectBox({
				items : [ "contains", "startswith" ],
				value : "contains",
				onValueChanged : function(data) {
					treeView.option("searchMode", data.value);
				}
			}); */
		});
	</script>
</body>
</html>