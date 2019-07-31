<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CO-WORKS : ERROR</title>
<c:import url="./header.jsp" />
</head>
<body class="fix-header fix-sidebar card-no-border">
	<section id="wrapper" class="error-page">
		<div class="error-box">
			<div class="error-body text-center">
				<h1 class="text-info">ERROR</h1>
				<h3 class="text-uppercase">페이지에 오류가 발생했습니다!</h3>
				<p class="text-muted mt-4 mb-4"><%= exception.getMessage() %></p>
				<a href="javascript:history.back();" class="btn btn-info btn-rounded waves-effect waves-light mb-5">Back</a>
			</div>
			<c:import url="./footer.jsp" />
		</div>
	</section>
	<c:import url="./bottomJquery.jsp" />
</body>
</html>