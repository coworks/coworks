<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 교육 자료 수정</title>
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
			<div class="container-fluid">
				
				<!-- 시작 -->
				
				
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-6 col-8 align-self-center">
                        <h3 class="text-themecolor mb-0 mt-0">COWORKS 교육 자료</h3>
                        
                    </div>
                    
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="row">
								<div class="col-xlg-2 col-lg-2 col-md-1">
									<!-- 좌측 공간 -->
								</div>
								<div class="col-xlg-10 col-lg-8 col-md-7">
									<div class="card-body">
										<h3 class="card-title text-primary">교육 자료 글 수정</h3>
										<div class="form-group">
											<input class="form-control" placeholder="제목 : ">
										</div>
										<div class="form-group">
											<input class="form-control" placeholder="작성자 : OOO <- 걍 올린 사람 이름">
										</div>
										<div class="form-group">
									
											
											</ul>
											<textarea class="textarea_editor form-control" rows="15"
												placeholder="내용 입력"></textarea>
											
											</div>
										<h4>
											<i class="ti-link"></i> 첨부 파일
										</h4>
										 <form action="#" class="dropzone" id="myDropzone" method="POST" enctype="multipart/form-data">
                                            <div class="fallback">
                                                <input name="file" type="file" multiple />
                                            </div>
                                        </form>
										<button type="submit" class="btn btn-success mt-3">
											<i class="fa fa-envelope-o"></i> 등록
										</button>
										<button class="btn btn-inverse mt-3">
											<i class="fa fa-times"></i> 취소
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
                <!-- End Page Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->

                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
        
				
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
    
    var myDropzone = new Dropzone("#myDropzone",{
        addRemoveLinks : true,
        renameFile :  function(file){
           var date = new Date();
           var time =  date.getTime();
           var ext = file.name.lastIndexOf(".")+1;
           return time+date+"."+ext;
        }
     });
	</script>
	
</body>
</html>