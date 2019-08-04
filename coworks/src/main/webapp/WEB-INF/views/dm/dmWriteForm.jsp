<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 쪽지쓰기</title>
<style>
.dropzone .dz-preview .dz-error-message {
    top: 150px!important;
}
ul{
   list-style:none;
   }	
[name = to_do_emp]{
list-style-type: none;float: left;
}
.to_do_emp{
	border: 1px solid black;
	/* background:red; */
	font-size:11pt;
	paddinng :1px;
}
/* 
#dm_to_list{

	border: 1px solid gray;
	padding :1%;
} */
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
                <c:import url ="dmLocation.jsp"/>
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
<!--  -->

<div class="col-xlg-2 col-lg-3 col-md-3">
	<div class="card-body inbox-panel">
		<a href="#"
			class="btn btn-primary mb-3 p-2 btn-block waves-effect waves-light">쪽지 보내기</a>
		<ul class="list-group list-group-full">
		<!-- active -->
		<c:forEach items="${dept}" var="d">
			<li class="list-group-item has-arrow depts" aria-expanded="true" id="${d.dept_code }" name="${d.dept_name }" >	
				<span class="#" id="append">${d.dept_name } / ${d.dept_code }</span>
				<!-- <ul aria-expanded="true" class="collapse">  </ul> -->
				<div>
					
				</div>
			</li>
			<div></div>
		</c:forEach>
		</ul>
	</div>
</div>

<!--  -->
                                <!-- lg-8 md-7 -->
                                <div class="col-xlg-10 col-lg-9 col-md-9">    
                                <form action="${pageContext.request.contextPath}/dm/dmWriteFormEnd.do" method="POST" enctype="multipart/form-data">
                                    <div class="card-body">
                                        <h3 class="card-title">쪽지 작성하기</h3>
                                        <div class="form-group">
                                        <%--   <c:if test="${type eq 'reply'}">
                                          	<!-- <div class="form-control col-12" name="dm_to_list" id="dm_to_list" value="">a</div> -->
                                          </c:if> --%>
                                          <c:if test="${type ne 'reply' }">
                                            <div class="form-group dm_to_list" name="dm_to_list" id="dm_to_list" >
											</div>
                                           </c:if>
                                        </div>
                                        <div class="form-group" style='margin-top:4px;'>
                                        <c:if test="${type eq 'forward'}">
                                        	<input class="form-control" name="dm_subject" style='margin-top:2%;'  value="">
                                         </c:if>
                                          <c:if test="${type ne 'forward'}">
                                            <input class="form-control" name="dm_subject"  style='margin-top:2%;' placeholder="제목 : ">
                                           </c:if>
                                        </div>
                                        <div class="form-group">
                                            <textarea class="textarea_editor form-control col-12" name="dm_content" rows="15" placeholder="">
 	                                            </textarea>
                                        </div>
                                       <!--  <div id="myDropzone" name="dropzone">
                                         <input name="upFile" type="file"class="dropzone"  multiple />
                                            <div class="fallback">
                                                <input name="upFile" type="file" multiple />
                                            </div>
                                       	</div> -->
                                     
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
   
<!-- =======================MODAL=======================L -->
   <script>
    $(document).ready(function() {
        $('.textarea_editor').wysihtml5();
    });
    
    function deleteBtn(obj) {
       $(obj).parent().remove();
    }
 
    $(".depts").on("click",function(){
    	console.log($(this).attr('id'));
    	var dept_code = $(this).attr('id');
    	var dept_name = $(this).attr('name');
    	console.log(dept_name);
    	$.ajax({
			url:"${pageContext.request.contextPath}/dm/ajxDept.do",
			data:{dept_code:dept_code},
			success:function(data){
				if($("#"+dept_code).next().children().length>0){
					$("#"+dept_code).next().empty();
				}else{
					$("#"+dept_code).next().empty();
					console.log("1");
					for(var i = 0 ; i < data.length; i++){
						var tbody = $("#"+dept_code).next();/* $("#append"); */
						var content = $("<ul>");
						if(i==0)
							content.append("<li class='insertTo' name='insertTo' id='"+dept_code+"' value="+dept_name+">"+dept_name+"부 </li>");
						else{
					/* content.append("<li>"+data[i].emp_no+"</li>"); */
						var emp_name = data[i].emp_name;
						var emp_no = data[i].emp_no;
						var emp = data[i];
						content.append("<li class='insertTo' name='insertTo' id='"+data[i].emp_no+"' value="+data[i].emp_name+">"+data[i].emp_name +" : "+ data[i].job_title+"</li>");
						}
						tbody.append(content);
					}
					console.log(" 완료");
				}
			}
    	});
    });
    
    
/* 
    $("li[name='emp_no']").on("click",function(){
    	console.log("name=emp_no");
    	console.log(this.attr('id'));
    });
    
    $("[name=dm_to]").on("change",function(){
    	console.log("123");
        if($("#dm_to").is(":checked")==true){
        	console.log(this.val());
        	$("#dm_to_list").val("!");
        }else{
        	console.log("123");
        }
    }); */
    
    var empList= new Array();
    var count = 0;
	$(document).on("click",".insertTo",function(){
		 console.log("insertTo why not click");
		var to_no= $(this).attr('id');
		var to_name = $(this).attr('value');
		empList[count++] = {to_no:to_no , to_name :to_name};
		console.log(to_no);
		console.log(to_name);
		console.log(empList);
		$("#dm_to_list").children().remove();
		for(var i = 0 ; i < count ; i++){
			$("#dm_to_list").append("<input type='text' id='"+empList[i].to_no+"'value='"+empList[i].to_name
					+"'class='btn btn-outline-secondary col-2 to_do_emp form-control' onclick='deleteTo("+empList[i].to_no+");' name='to_do_emp'>");//+empList[i].to_name+
			$("#dm_to_list").append("<input type='text' id='"+empList[i].to_no+"'value='"+empList[i].to_no
					+"' name='to_no_emp' hidden>");
			}
	});

	function deleteTo(to_no){
		console.log(to_no);
		console.log(empList);
		for(var i = 0 ; i < empList.length;i++){
			if(empList[i].to_no == to_no){
				console.log(empList[i].to_no);
				console.log(to_no);
				empList.splice(i,1);
				console.log("왜 안지워져 시발~")
				console.log(empList);
				break;
			}
		}count--;
		$("#dm_to_list").children().remove();
		for(var i = 0 ; i < count ; i++){
			$("#dm_to_list").append("<input type='text' id='"+empList[i].to_no+"'value='"+empList[i].to_name
					+"'class='btn btn-outline-secondary col-2 to_do_emp form-control' onclick='deleteTo("+empList[i].to_no+");' name='to_do_emp'>");//+empList[i].to_name+
			$("#dm_to_list").append("<input type='text' id='"+empList[i].to_no+"'value='"+empList[i].to_no
					+"' name='to_no_emp' hidden>");
		//	"</li>"); 
			$(this).eq(1).remove();
			$(this).remove();
		}
	}
    </script>
   
</body>
</html>