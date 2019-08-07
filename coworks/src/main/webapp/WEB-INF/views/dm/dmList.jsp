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
  #page{
     	padding-left:36%;
     	margin-top:0;
     	
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
                <c:import url ="dmLocation.jsp"/>
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="row">
                                <c:import url="dmCommon.jsp"/>
                                <!-- lg-8 md-8 -->
                                <div class="col-xlg-10 col-lg-9 col-md-9">
                                   <c:import url="dmTopbar.jsp"/>
                                    <!-- 
                                    <td class="max-texts"><a href="app-edm-detail.html"><span class="label label-info mr-2">Work</span> Lorem ipsum perspiciatis unde omnis iste natus error sit voluptatem</a></td>
                                    <span class="label label-info mr-2">내용 jstl 로 추가</span> 
                                    <span class="label label-warning">내용 jstl 로 추가</span>
                                    <span class="label label-purple">내용 jstl 로 추가</span>
                                    <span class="label label-danger">내용 jstl 로 추가</span>
                                    <span class="label label-success">내용 jstl 로 추가</span>  얘가 라벨 
                                    
                                     <td style="width:40px" class="hidden-xs-down"><i class="fa fa-star-o"></i></td>
                                    <i class="fa fa-star text-warning"></i> 얘가 별
                                    -->
                                    <div class="card-body pt-0">
                                        <div class="card b-all shadow-none">
                                            <div class="inbox-center b-all table-responsive">
                                                <table class="table table-hover no-wrap">
                                                    <tbody>
                                                    <c:forEach items="${list}" var="dm"> 
                                                   
                                                        <%-- <a href="/dm/selectOnedm.do/${m.getDm_no()}">  --%>
                                                    	<input type="text" name="dm_no" value="${dm.dm_no}" id="dm_no" hidden/>
                                                    	
                                                        <tr class="unread dmRow" >
                                                            <td style="width:40px">
                                                            
                                                                <div class="checkbox">
                                                                    <input type="checkbox" id="${dm.dm_no }" name="chkdm" value="${dm.dm_no}">
                                                                    <label for="${dm.dm_no }"></label>
                                                                </div>
                                                            </td>
                                                            <td style="width:20px" class="hidden-xs-down ">
                                                            	<c:if test="${dm.dm_to_read eq 'N' }" >
                                                    			<i class="mdi mdi-checkbox-blank-circle-outline"></i>
                                                    			</c:if>
                                                    			<c:if test="${dm.dm_to_read eq 'Y' }" >
                                                    			 <i class="mdi mdi-check-circle-outline"></i>
                                                    			</c:if> 
                                                    		</td><%-- 
                                                    		<td style="width:20px" class="hidden-xs-down ">
                                                            	<c:if test="${m.getDm_star() eq 'Y' }" >
                                                    			<i class="mdi  mdi-star"></i>
                                                    			</c:if>
                                                    			<c:if test="${m.getDm_star() eq 'N' }" >
                                                    			<i class="mdi mdi-star-outline"></i>
                                                    			</c:if>
                                                    		</td>
                                                             --%>
                                                            <!-- <td style="width:40px" class="hidden-xs-down notRead"><i class="fa fa-star-o"></i></td> -->
                                                           	
                                                            <td class="hidden-xs-down " > 
                                                          		${dm.dm_from_name}
                                                          	</td><!-- <a href="app-edm-detail.do"/> -->
                                                            <td class="max-texts"  onclick="location.href='${pageContext.request.contextPath}/dm/selectOneDm.do/${dm.dm_no}'"> 
                                                          	
                                                          		${dm.dm_subject }
                                                            </td>
                                                           
                                                            <td class="hidden-xs-down">
                                                            	<fmt:formatDate value="${dm.dm_date}" pattern="yyyy-MM-dd : HH시" />
                                                            </td>
                                                            <!-- <i class="fa fa-paperclip"></i> -->
                                                           <%--  <fmt:parseDate value='${m.getDm_sendDate()}' var='sendDate' pattern='yyyymmdd'/> --%>
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
	
	 var chkdms = [];
	 function chk(){
	    $("input[name='chkdm']:checked").each(function(i) {
	    	console.log("!23");
	        chkdms.push($(this).attr('id'));
	    });
	 }
	    /* var allData = { "dm_no": dm_no, "chkdms": chkdm }; */
	     /*  onclick="location.href='${pageContext.request.contextPath}/dm/selectOnedm.do/${m.getDm_no}/${type}' */
	    
	    function storeDm(){
	    	chkdms=[];
	    	chk();
	    	console.log(chkdms);	
	    	if(chkdms.length < 1){
	    		alert("저장할 메일을 선택해주세요");
	    		return false;
	    	}
		    $.ajax({
		        url:"${pageContext.request.contextPath}/dm/storeDm.do",
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkdms) ,
		        success:function(data){
		            alert("쪽지 저장!");
		            location.href="${pageContext.request.contextPath}/dm/dmList.do"; 
		        },
		        error:function(){
		            alert("쪽지 저장 실패!!");
		        }
		    });
		}
	    function deleteDm(){
	    	chkdms=[];
	    	chk();
	    	console.log(chkdms);
	    	if(chkdms.length < 1){
	    		alert("삭제할 메일을 선택해주세요");
	    		return false;
	    	}
		    $.ajax({
		        url:"${pageContext.request.contextPath}/dm/deleteDm.do/${type}",
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkdms),
		        success:function(data){
		            alert("쪽지 삭제!");
		            location.href="${pageContext.request.contextPath}/dm/dmList.do"; 
		            /* location.href="${pageContext.request.contextPath}/dm/innerdm.do"; */
		        },
		        error:function(){
		            alert("쪽지 삭제 실패");
		        }
		    });
		}/* 
	    function readdm(){
	    	chkdms=[];
	    	chk();
	    	console.log(chkdms);
		    $.ajax({
		        url:"${pageContext.request.contextPath}/dm/readdm.do",
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkdms),
		        success:function(data){
		            alert("완료!");
		        },
		        error:function(){
		            alert();
		        }
		    });
		}
	    function updateStar(value){
	    	chkdms=[];
	    	chk();
	    	console.log(chkdms);
		    $.ajax({
		        url:"${pageContext.request.contextPath}/dm/updateStar.do/"+value,
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkdms),
		        success:function(data){
		            alert("완료!");
		        },
		        error:function(){
		            alert();
		        }
		    });
		}
	    function updateMark(num){
	    	chkdms=[];
	    	chk();
	    	console.log(chkdms);
	    	console.log(num);
		    $.ajax({
		        url:"${pageContext.request.contextPath}/dm/updateMark.do/"+num,
		        type:'POST',
	    		contentType : 'application/json; charset=UTF-8',
		        data: JSON.stringify(chkdms),
		        success:function(data){
		            alert("완료!");
		        },
		        error:function(){
		            alert();
		        }
		    });
		} */
	
	</script>
	<!-- <script>
		$(".dmRow").on("click",function(){
			var m = $(this).val();
			var dm_no = $("#dmRow").eq(0);
			console.log(m);/* 
			console.log(dm_no); */
			/* location.href="/dm/selectOnedm.do/${m.getDm_no()}"; */
		});
		
	</script> -->
</body>
</html>