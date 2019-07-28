<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 작성 폼</title>

<c:import url="../common/header.jsp" />

<!-- wysihtml5 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/bootstrap-wysihtml5.css" />

<!-- Dropzone css -->
<link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/dropzone-master/dist/dropzone.css" rel="stylesheet" type="text/css" />




</head>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">
			<div class="container-fluid ">
				
				<!-- 시작 -->
				
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">COWORKS 글 작성하기</h3>
                        
                    </div>
                    
                </div>

				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							
								
								<div class="col-xlg-9 col-lg-8 col-md-7 align-self-center">
									<div class="card-body" style="margin-bottom: 7%;">
									<h3 class="card-title text-primary">새 글 등록</h3>
									<div class="form-group">
									<form class="all-form" id="docEnrollFrm" onsubmit="return validate();">
											<select class="form-control custom-select" id="select1" onchange="itemChange(this)"
												name="category1" style="width: 18%;">
												<option value="0">자료실 선택</option>
												<option value="CD">사내규정</option>
												<option value="BD">업무문서</option>
												<option value="ED">교육문서</option>
												<option value="DD">부서</option>
											</select>
											<select id="select2" name="sel2" style='display: none;'>
											</select>
										<h4 name="writer" style="float:right; padding-top:5px;">작성자 : 세션에서 emp_name가져와야겠쥬</h4>
									</div>
									<div class="form-group">
											<input class="form-control" name="title" placeholder="제목을 입력하세요.">
										</div>
										<div class="form-group">
									
											<textarea class="textarea_editor form-control" name="content" rows="15"
												placeholder="내용을 입력하세요."></textarea>
											
											</div>
										<h4>
											<i class="ti-link"></i> 첨부 파일
										</h4>
										 <div id='file-list'>
                                  		  <input type="button" id='button-add-file' value='파일 추가' class="btn  btn-outline-warning" />
                                		</div>
                                        
                                        <div style="float:right;">
										<button type="submit" class="btn btn-success mt-3">
											<i class="far fa-check-circle"></i> 등록
										</button>
										&nbsp;
										<button class="btn btn-danger mt-3" onclick="goback();">
											<i class=" far fa-times-circle"></i> 취소
										</button>
										</div>
									</form>
									</div>
								</div>
							
						</div>
					</div>
				</div>

        
				
				<!-- 끝 -->
				
			</div>
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	
	<script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/wysihtml5-0.3.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/bootstrap-wysihtml5.js"></script>
    <script src="${pageContext.request.contextPath}/resources/templates/assets/plugins/dropzone-master/dist/dropzone.js"></script>
   <script>
   
   
    $(document).ready(function() {
        $('.textarea_editor').wysihtml5();
    });
    
    var count = 0;
    $('#button-add-file').on("click",function(){
       var html = "<div id='item_"+count+"'>";
       html += "<input type='file' name='upFile' multiple/>";
       html += "<input type='button' onclick='deleteBtn(this)' class='btn btn-danger' value='삭제'/></div>";
       count++;
       $("#file-list").append(html);
    });
    
    function deleteBtn(obj) {
       $(obj).parent().remove();
    }

    function itemChange(e) { 
        if((e.value) == "DD") 
        	$("#select2").style.display='';
            /* document.all-form.sel2.style.display == ''; */ 
    } 
    
    
    /* function setCategory2(){
    	form = document.search;
    	if(document.search.category1.value == "DD"){
    		
    		$("#cate2").show(); // display 속성을 block 으로 바꾼다.
    	form.category2.length = 7;
    	form.category2.options[1] = new Option("관리부");
    	form.category2.options[1].value = "D01";
    	form.category2.options[2] = new Option("경영부");
    	form.category2.options[2].value = "D02";
    	form.category2.options[3] = new Option("마케팅부");
    	form.category2.options[3].value = "D03";
    	form.category2.options[4] = new Option("인사부");
    	form.category2.options[4].value = "D04";
    	form.category2.options[5] = new Option("전산부");
    	form.category2.options[5].value = "D05";
    	form.category2.options[6] = new Option("총무부");
    	form.category2.options[6].value = "D06";
    	form.category2.options[7] = new Option("회계부");
    	form.category2.options[7].value = "D07";
    }
    } */
    
    function goback(){
    	console.log("뒤로가기. --> 알람이 뜨면서 작성 취소할건지 물어봐야 함 / Form, UpdateView 둘 다 해야 한다.")
    	window.history.go(-1);
    	
    }
    
     function validate(){
		var boardCode = $("#select1").val();
	    	
	    	if(boardCode == "0"){
	    		alert("등록할 자료실을 선택하세요.");
				return false;
	    	} 
	    	
	    	alert("딩동댕!!!!!!!!! 글을 등록하겠냐고 모달 뜨게 하장1!! (취소=닫기),(등록)");
	    	return true;
	    }
	
    
    $("#docEnrollFrm .btn-success").on("click",function(){
    	var param = {};
    	param.code =  $("#all-form [name=select-opt]").val();
		param.title = $("#all-form [name=title]").val();
		param.writer = $("#all-form [name=writer]").val();
		param.content = $("#all-form [name=content]").val();
		param.file = $("#all-form [name=file]").val();
		
		var jsonStr = JSON.stringify(param);
		console.log(jsonStr);
		
		$.ajax({
            url  : "${pageContext.request.contextPath}/documentboard/doctboard",
            data : jsonStr,
            dataType: "json",
            contentType: 'application/json; charset=utf-8',
            type : "post",
            success : function(data){
                console.log(data);
            },
            error : function(jqxhr, textStatus, errorThrown){
                console.log("ajax 처리 실패 : ",jqxhr,textStatus,errorThrown);
            }
        });
    }); 
    
	</script>
	
</body>
</html>