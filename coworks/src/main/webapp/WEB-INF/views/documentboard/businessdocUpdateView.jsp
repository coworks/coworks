<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 수정 폼</title>

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
                        <h3 class="text-themecolor mb-0 mt-0">COWORKS 글 수정하기</h3>
                        
                    </div>
                    
                </div>

				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							
								
								<div class="col-xlg-9 col-lg-8 col-md-7 align-self-center"><!-- onsubmit="return validate();" -->
								<form class="form-all" action="${pageContext.request.contextPath}/documentboard/edit" enctype="multipart/form-data" method="post">
									<div class="card-body" style="margin-bottom: 7%;">
									<h3 class="card-title text-primary">글 수정하기</h3>
									<div class="form-group">
									<div class="form-group">
											<input class="form-control" value="글 위치 : ${board.getBg_title() }" readonly required>
										</div>
									<!-- <select class="form-control custom-select" style="width: 15%">
										<option value="0"></option>
										<option value="CD">사내규정</option>
										<option value="ED">교육문서</option>
										<option value="BD">업무문서</option>
										<option value="DD">부서별</option>
									</select> -->
									<h4 style="float:right; padding-top:5px;">작성자 : ${sessionScope.employee.emp_name}</h4>
									</div>
									<div class="form-group">
											<input class="form-control" name="bo_title" value="${board.getBo_title() }" readonly required>
										</div>
										<div class="form-group">
											<input type="text" name="bo_no" value="${board.getBo_no()}" hidden/>
											<input type="text" name="emp_no" value="${board.emp_no}" hidden/>
											<textarea class="textarea_editor form-control" name="bo_content" rows="15">
											${board.bo_content }
											</textarea>
											
											</div>
										<h4>
											<i class="ti-link"></i> 첨부 파일
										</h4>
										 <div id='file-list'>
                                  		  <input type="button" id='button-add-file' value='파일 추가' class="btn  btn-outline-warning" />
                                		</div>
                                        
                                        <div style="float:right;">
										<button class="btn btn-success mt-3" type="submit">
										
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
    
    function goback(){
    	console.log("뒤로가기. --> 알람이 뜨면서 작성 취소할건지 물어봐야 함 / Form, UpdateView 둘 다 해야 한다.")
    	window.history.go(-1);
    	
    }
    
    function validate(){
		var content = $("[name=bo_content]").val();
		console.log("validate");
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
				
		console.log('check');
		return true;
	}
    

    
	</script>
	
</body>
</html>