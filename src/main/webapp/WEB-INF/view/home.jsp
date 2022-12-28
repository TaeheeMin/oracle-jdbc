<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath}/style.css" rel="stylesheet">
		<title>홈</title>
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