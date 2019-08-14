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
	.pagination{
		margin-left:350%;
	}
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
               <%--  <c:import url ="mail-location.jsp"/> --%>
                <div class="row page-titles">
	<div class="col-md-6 col-8 align-self-center">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><span>메인페이지</span> <i
				class="fas fa-chevron-right"></i>
				<c:if test="${type eq 'send' }">
				<span class="text-info"> 보낸 메일함</span>
				</c:if>
				<c:if test="${type eq 'mail' }">
				<span class="text-info"> 내부 메일함</span>
				</c:if>
				<c:if test="${type eq 'email' }">
				<span class="text-info"> 외부 메일함</span>
				</c:if>
				</li>
		</ol>
	</div>
</div> 
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
                                <!-- lg-8 md-8 -->
                                <div class="col-xlg-10 col-lg-9 col-md-9">
                                   <c:import url="mail-topbar.jsp"/>
                                 
                                    <!-- 
                                    <td class="max-texts"><a href="app-email-detail.html"><span class="label label-info mr-2">Work</span> Lorem ipsum perspiciatis unde omnis iste natus error sit voluptatem</a></td>
                                    <span class="label label-info mr-2">내용 jstl 로 추가</span> 
                                    <span class="label label-warning">내용 jstl 로 추가</span>
                                    <span class="label label-purple">내용 jstl 로 추가</span>
                                    <span class="label label-danger">내용 jstl 로 추가</span>
                                    <span class="label label-success">내용 jstl 로 추가</span>  얘가 라벨 
                                    
                                     <td style="width:40px" class="hidden-xs-down"><i class="fa fa-star-o"></i></td>
                                    <i class="fa fa-star text-warning"></i> 얘가 별
                                    -->
                                   
                                        <div class="card b-all shadow-none">
                                            <div class="inbox-center b-all table-responsive">
                                                <table class="table table-hover no-wrap">
                                                    <tbody>
                                                    <c:forEach items="${mails}" var="m"> 
                                                   
                                                        <%-- <a href="/mail/selectOneMail.do/${m.getMail_no()}">  --%>
                                                    	<input type="text" name="mail_no" value="${m.getMail_no()}" id="mail_no" hidden/>
                                                    	<input type="text" name="type" value="${type}" id="type" hidden/>
                                                    	
                                                        <tr class="unread mailRow" >
                                                            <td style="width:40px">
                                                            
                                                                <div class="checkbox">
                                                                    <input type="checkbox" id="checkbox${m.getMail_no() }" name="chkMail" value="${m.getMail_no() }">
                                                                    <label for="checkbox${m.getMail_no() }"></label>
                                                                </div>
                                                            </td>
                                                            <td style="width:20px" class="hidden-xs-down ">
                                                            	<c:if test="${m.getMail_isRead() eq 'N' }" >
                                                    			<i class="mdi mdi-checkbox-blank-circle-outline"></i>
                                                    			</c:if>
                                                    			<c:if test="${m.getMail_isRead() eq 'Y' }" >
                                                    			<i class="mdi mdi-check-circle-outline"></i>
                                                    			</c:if>
                                                    		</td>
                                                    		<td style="width:20px" class="hidden-xs-down ">
                                                            	<c:if test="${m.getMail_star() eq 'Y' }" >
                                                    			<i class="mdi  mdi-star"></i>
                                                    			</c:if>
                                                    			<c:if test="${m.getMail_star() eq 'N' }" >
                                                    			<i class="mdi mdi-star-outline"></i>
                                                    			</c:if>
                                                    		</td>
                                                            
                                                            <!-- <td style="width:40px" class="hidden-xs-down notRead"><i class="fa fa-star-o"></i></td> -->
                                                           	
                                                            <td class="hidden-xs-down " > 
                                                            <c:if test="${m.getMail_name() eq null }">
															<c:if test="${m.getMail_from_email().length() gt 25}">
                                                            	${m.getMail_from_email().substring(0,25) } ...
                                                            </c:if>
                                                          	<c:if test="${m.getMail_from_email().length() le 25}">
                                                          		${m.getMail_from_email() }
                                                          	</c:if>
                                                          	</c:if>
                                                          	
                                                          	<c:if test="${m.getMail_name() ne null }">
                                                          		${m.getMail_name() }
                                                          	</c:if>
                                                          	</td><!-- <a href="app-email-detail.do"/> -->
                                                            <td class="max-texts"  onclick="location.href='${pageContext.request.contextPath}/mail/selectOneMail.do/${m.getMail_no()}/${type}'"  style="cursor: pointer;"> 
                                                          	<c:if test="${m.getMail_mark() != null }">
                                                            <c:choose>
                                                            	<c:when test="${m.getMail_mark()==1}">
                                                            	<span class="label label-info mr-2">COMP</span> 
                                                            	</c:when>
                                                            	<c:when test="${m.getMail_mark()==2}">
                                                            	<span class="label label-warning mr-2">DEPT</span> 
                                                            	</c:when>
                                                            	<c:when test="${m.getMail_mark()==3}">
                                                            	<span class="label label-purple mr-2">INDI</span> 
                                                            	</c:when>
                                                            	<c:when test="${m.getMail_mark()==4}">
                                                            	<span class="label label-danger mr-2">WORK</span> 
                                                            	</c:when>
                                                            	<c:when test="${m.getMail_mark()==5}">
                                                            	<span class="label label-success mr-2">SOCI</span> 
                                                            	</c:when>
                                                            	<c:when test="${m.getMail_mark()==6}">
                                                            	<span class=""></span> 
                                                            	</c:when>
                                                            </c:choose>
                                                            </c:if>
                                                          	<c:if test="${m.getMail_subject().length() gt 20}">
                                                            	${m.getMail_subject().substring(0,20) } ...
                                                            </c:if>
                                                          	<c:if test="${m.getMail_subject().length()le 20}">
                                                          		${m.getMail_subject() }
                                                          	</c:if> 
                                                            </td>
                                                           
                                                            <td class="hidden-xs-down">
                                                            	<fmt:formatDate value="${m.getMail_sendDate()}" pattern="yy-MM-dd HH:mm" />
                                                            </td>
                                                            <!-- <i class="fa fa-paperclip"></i> -->
                                                           <%--  <fmt:parseDate value='${m.getMail_sendDate()}' var='sendDate' pattern='yyyymmdd'/> --%>
                                                            <td class="text-right"><%-- <fmt:formatDate value=" ${sendDate}" pattern="MM-dd-yyyy" /> --%></td>
                                                        </tr>  
                                                      <!--   </a>  -->
                                                     
                                                      </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 페이지네이션 -->
                                    <c:out value="${pageBar}" escapeXml="false"/>
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
	
	 var chkMails = [];
	 function chk(){
	    $("input[name='chkMail']:checked").each(function(i) {
	        chkMails.push($(this).val());
	    });
	 }
	    /* var allData = { "mail_no": mail_no, "chkMails": chkMail }; */
	     /*  onclick="location.href='${pageContext.request.contextPath}/mail/selectOneMail.do/${m.getMail_no()}/${type}' */
	    
	    function storeMail(){
	    	chkMails=[];
	    	chk();
	    	console.log(chkMails);
	    	if($("#type").val() != "email"){
	    		alert("외부 메일에서만 사용 가능한 기능입니다.");
	    		return false;
	    	}
	    		
	    	if(chkMails.length < 1){
	    		alert("저장할 메일을 선택해주세요");
	    		return false;
	    	
	    	}
	    	
		    $.ajax({
		        url:"${pageContext.request.contextPath}/mail/storeMail.do",
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkMails),
		        success:function(data){
		            alert("내부 메일로 저장이 완료 되었습니다.!");
		            location.href="${pageContext.request.contextPath}/mail/innerMail.do"; 
		        },
		        error:function(){
		            alert("내부 메일로 저장하는데 문제가 발생하였습니다! ㅜㅜ");
		        }
		    });
		}
	    function deleteMail(){
	    	chkMails=[];
	    	chk();
	    	console.log(chkMails);
	     	if($("#type").val() == "email"){
	    		alert("외부 메일에서는 사용이 불가능한 기능입니다.");
	    		return false;
	    	}
	    		
	    	if(chkMails.length < 1){
	    		alert("삭제할 메일을 선택해주세요");
	    		return false;
	    		
	   
	    	}
		    $.ajax({
		        url:"${pageContext.request.contextPath}/mail/deleteMail.do/${type}",
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkMails),
		        success:function(data){
		            alert("완료!");	
		            /* location.href="${pageContext.request.contextPath}/mail/innerMail.do"; */
		        },
		        error:function(){
		            alert("메일 삭제 실패");
		        }
		    });
		}
	    function readMail(){
	    	chkMails=[];
	    	chk();
	    	console.log(chkMails);
	     	if($("#type").val() == "email"){
	    		alert("외부 메일에서는 사용이 불가능한 기능입니다.");
	    		return false;
	    	}
	    	if(chkMails.length < 1){
	    		alert("표시할 메일을 선택해주세요");
	    		return false;
	    	}
	    	
		    $.ajax({
		        url:"${pageContext.request.contextPath}/mail/readMail.do",
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkMails),
		        success:function(data){
		            alert("완료!");
		        },
		        error:function(){
		            alert();
		        }
		    });
		}
	    function updateStar(value){
	    	chkMails=[];
	    	chk();
	    	console.log(chkMails);
	     	if($("#type").val() == "email"){
	    		alert("외부 메일에서는 사용이 불가능한 기능입니다.");
	    		return false;
	    	}
	    	if(chkMails.length < 1){
	    		alert("표시할 메일을 선택해주세요");
	    		return false;
	    	}
		    $.ajax({
		        url:"${pageContext.request.contextPath}/mail/updateStar.do/"+value,
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkMails),
		        success:function(data){
		            alert("완료!");
		        },
		        error:function(){
		            alert();
		        }
		    });
		}
	    function updateMark(num){
	    	chkMails=[];
	    	chk();
	    	console.log(chkMails);
	    	console.log(num);
	     	if($("#type").val() == "email"){
	    		alert("외부 메일에서는 사용이 불가능한 기능입니다.");
	    		return false;
	    	}
	    	if(chkMails.length < 1){
	    		alert("표시할 메일을 선택해주세요");
	    		return false;
	    	}
		    $.ajax({
		        url:"${pageContext.request.contextPath}/mail/updateMark.do/"+num,
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkMails),
		        success:function(data){
		            alert("완료!");
		        },
		        error:function(){
		            alert();
		        }
		    });
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