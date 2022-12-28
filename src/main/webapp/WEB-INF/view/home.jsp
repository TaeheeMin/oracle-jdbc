<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>홈</title>
		<link href="${pageContext.request.contextPath}/resources/_bootswatch.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/_variables.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
			});
		</script>
	</head>
	
	<body>
		 <div class="head">
			<div class="logo">BOARD LIST</div>
		</div>
		<div>
			<c:if test="${loginMember != null}">
				${loginMember.memberName}님
				<a href="${pageContext.request.contextPath}/ModifyMember">MYPAGE</a>
				<a href="${pageContext.request.contextPath}/Logout">LOGOUT</a>
			</c:if>
			
			<c:if test="${loginMember == null}">
				<a href="${pageContext.request.contextPath}/LoginController">LOGIN</a>
				<a href="${pageContext.request.contextPath}/AddMember">SIGNIN</a>
			</c:if>
		</div>
	</body>
</html>