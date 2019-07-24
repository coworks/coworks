<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 메일쓰기</title>
<style>
.dropzone .dz-preview .dz-error-message {
    top: 150px!important;
}
</style>
<!-- wysihtml5 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/templates/assets/plugins/html5-editor/bootstrap-wysihtml5.css" />
<!-- Dropzone css -->
<link href="${pageContext.request.contextPath}/resources/templates/assets/plugins/dropzone-master/dist/dropzone.css" rel="stylesheet" type="text/css" />
    
<c:import url="../common/header.jsp" />
</head>
<body class="fix-header fix-sidebar card-no-border">
   <div id="main-wrapper">
      <c:import url="../common/topbar.jsp" />
      <c:import url="../common/sidebar.jsp" />
      <div class="page-wrapper">
       <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <c:import url ="mail-location.jsp"/>
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
                                <c:import url="mail-common.jsp"/>
                                <div class="col-xlg-10 col-lg-8 col-md-7">    
                                <form action="${pageContext.request.contextPath}/mail/mailFormEnd.do"" method="POST" enctype="multipart/form-data">
                                    
                                    <div class="card-body">
                                        <h3 class="card-title">메일 작성하기</h3>
                                        <div class="form-group">
                                            <input class="form-control" name="mail_to_email" placeholder="받는 사람 :">
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control" name="mail_subject" placeholder="제목 : ">
                                        </div>
                                        <div class="form-group">
                                            <textarea class="textarea_editor form-control" name="mail_content" rows="15" placeholder=""></textarea>
                                        </div>
                                        <h4><i class="ti-link"></i>첨부파일</h4>
                                        <div class="dropzone" id="myDropzone" name="dropzone">
                                           <!--  <div class="fallback">
                                                <input name="upFile" type="file" multiple />
                                            </div> -->
                                       	</div>
                                        
                                        <button type="submit" class="btn btn-success mt-3"><i class="fa fa-envelope-o"></i> 전송 </button>
                                        <button class="btn btn-inverse mt-3"><i class="fa fa-times"></i> 취소 </button>
                                    </div>
                                   </form>
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
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
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
    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone("#myDropzone",{
   		url :"#",
       addRemoveLinks : true,
       success : function(response){
    	   console.log(response);
       },
       init : function(){
    	   this.on("success",function(file){   
    		   if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
    	        	console.log("com");
    	        	console.log(file);
    	        	/* doSomething(); */
    	      }
    		   // 호출하면 file list 삭제하고 재생성해서 데이터 담기
    	   });
    	   this.on("removeFile",function(file){   
    		   if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
    	        	console.log("com");
    	        	console.log(file);
    	        	/* doSomething(); */
    	      }
    		   // 호출하면 file list 삭제하고 재생성해서 데이터 담기
    	   });
       }/* ,removedfile: function(file) {
    	    var name = file.name;        
    	    $.ajax({
    	        type: 'POST',
    	        url: 'delete.php',
    	        data: "id="+name,
    	        dataType: 'html'
    	    });
       } */
       
    });
    
    
    
    
    </script>
   
</body>
</html>