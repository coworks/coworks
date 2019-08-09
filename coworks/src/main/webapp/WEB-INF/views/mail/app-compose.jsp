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
                                <!-- lg-8 md-7 -->
                                <div class="col-xlg-10 col-lg-9 col-md-9">    
                                <form action="${pageContext.request.contextPath}/mail/mailFormEnd.do" method="POST" enctype="multipart/form-data">
                                    
                                    <div class="card-body">
                                        <h3 class="card-title">메일 작성하기</h3>
                                        <div class="form-group">
                                          <c:if test="${type eq 'reply'}">
                                          	<input class="form-control" name="mail_to_email" value="${mail.mail_from_email }">
                                          </c:if>
                                          <c:if test="${type ne 'reply' }">
                                            <input class="form-control" name="mail_to_email" placeholder="받는 사람 :">
                                           </c:if>
                                        </div>
                                        <div class="form-group">
                                        <c:if test="${type eq 'forward'}">
                                        	<input class="form-control" name="mail_subject" value="${mail.mail_subject }">
                                         </c:if>
                                          <c:if test="${type ne 'forward'}">
                                            <input class="form-control" name="mail_subject" placeholder="제목 : ">
                                           </c:if>
                                        </div>
                                        <div class="form-group">
                                            <textarea class="textarea_editor form-control" name="mail_content" rows="15" placeholder="">
                                            
                                            <c:if test="${mail !=null }">
                                            <br/><br/><br/><br/><br/>
-----Original Message-----<br/>
From: ${mail.mail_from_email }<br/>
To: ${mail.mail_to_email } <br/>

Sent: ${mail.mail_sendDate}<br/>
Subject: ${mail.mail_subject }<br/>
content :${mail.mail_content }<br/>
                                            </c:if>
                                            </textarea>
                                        </div>
                                        <h4><i class="ti-link"></i>첨부파일</h4>
                                       <!--  <div id="myDropzone" name="dropzone">
                                         <input name="upFile" type="file"class="dropzone"  multiple />
                                            <div class="fallback">
                                                <input name="upFile" type="file" multiple />
                                            </div>
                                       	</div> -->
                                        <div id='file-list'>
                                  		  <input type="button" id='button-add-file' value='파일 추가' class="btn  btn-outline-secondary" />
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
    

    function mailsubmit(){
    	
    	console.log("submit 실행");
    	if($("#mail_to_email").val() == ""){
    		alert("이메일을 입력해주세요");
    		$("#mail_to_email").focus();
   		}else if($("#mail_subject").val()==""){
    		alert("메일 제목을 입력해주세요");
    		$("#mail_subject").focus();
    	}else if($("#mail_content").val()==""){
    		alert("메일 내용을 입력해주세요");
    		$("#mail_content").focus();
    	}else{
    		alert("전송 완료되었습니다.");
    		 $("#mailform").submit();
    	}
    }
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
  /*   Dropzone.autoDiscover = false;
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
    	        	/* doSomething(); 
    	      }
    		   // 호출하면 file list 삭제하고 재생성해서 데이터 담기
    	   });
    	   this.on("removeFile",function(file){   
    		   if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
    	        	console.log("com");
    	        	console.log(file);
    	        	/* doSomething(); 
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
       } 
       
    });
     */
        
    </script>
   
</body>
</html>