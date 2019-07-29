<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : 메일함</title>
<c:import url="../common/header.jsp" />
</head>

<style>
   .m-center{
      margin: 0 auto;
   }
   .notRead{ 
   	  color : red;
   }
</style>
<body class="fix-header fix-sidebar card-no-border">
	<div id="main-wrapper">
		<c:import url="../common/topbar.jsp" />
		<c:import url="../common/sidebar.jsp" />
		<div class="page-wrapper">   
		<div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <c:import url ="mail-location.jsp"/>
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                             <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">이메일 인증</h4>
                                <h6 class="card-subtitle">사내 메일을 이용하기 위해선 사용 중인 이메일을 입력해야 합니다. </h6>
                                <form class="mt-4" id="saveEmail" action="${pageContext.request.contextPath}/mail/saveEmail.do ">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">이메일</label>
                                        <input type="email" name="emp_email" class="form-control" id="emp_email" aria-describedby="emailHelp" placeholder="이메일">
                                        <small id="emailHelp" class="form-text text-muted">헤당 메일 주소는 절대 다른 용도로 사용하지 않습니다.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">비밀번호</label>
                                        <input type="password"name= "emp_emailpassword"  class="form-control" id="emp_emailpassword" placeholder="비밀번호">
                                    </div>
                                 <!--    <div class="custom-control custom-checkbox mr-sm-2 mb-3">
                                        <input type="checkbox" class="custom-control-input" id="checkbox0" value="check">
                                        <label class="custom-control-label" for="checkbox0">Check Me Out !</label>
                                    </div> -->
                                    <button type="button" onclick="authCheckEnd();" class="btn btn-primary">전송</button>
                                    <div class="form-group">
                                    </div>
                                    <hr>
                                    <h4 class="card-title">인증 번호 입력</h4>
                                     <div class="form-group">
                                        <label for="exampleInputPassword1">인증 번호</label>
                                        <input type="password"	name="key"  class="form-control" id="key" placeholder="인증 번호">
                                    </div>
                                     <button type="button" onclick="auth();" class="btn btn-primary">제출</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <div class="right-sidebar">
                    <div class="slimscrollright">
                        <div class="rpanel-title"> Service Panel <span><i class="ti-close right-side-toggle"></i></span> </div>
                        <div class="r-panel-body">
                            <ul id="themecolors" class="mt-3">
                                <li><b>With Light sidebar</b></li>
                            </ul>
                            <ul class="mt-3 chatonline">
                                <li><b>Chat option</b></li>
                           
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
			<c:import url="../common/footer.jsp" />
		</div>
	</div>
	<c:import url="../common/bottomJquery.jsp" />
	<script>
	
		var key ;
	    function authCheckEnd(){
		    $.ajax({
		        url:"${pageContext.request.contextPath}/mail/authCheckEnd.do",
		        data : {
		        	emp_email : $("#emp_email").val(),
		        	emp_emailpassword : $("#emp_emailpassword").val()
		        },type:'POST'
		        ,dataType: 'text'
		        ,success:function(data){
		        	key = data;
		            alert("메일이 발송되었습니다.");
		            console.log(key);	
		        },
		        error:function(){
		            alert("인증 메일 전송에 실패하였습니다.");
		        }
		    });
		}
	    function auth(){
	    	if($("#key").val() == key){
	    		alert("인증 완료 되었습니다.");
	    		document.getElementById("saveEmail").submit();
	    	}else{
	    		alert("인증에 실패하였습니다.");
	    	}
	    }
	
	</script>
	<!-- <script>
		$(".mailRow").on("click",function(){
			var m = $(this).val();
			var mail_no = $("#mailRow").eq(0);
			console.log(m);/* 
			console.log(mail_no); */
			/* location.href="/mail/selectOneMail.do/${m.getMail_no()}"; */
		});
		
	</script> -->
</body>
</html>