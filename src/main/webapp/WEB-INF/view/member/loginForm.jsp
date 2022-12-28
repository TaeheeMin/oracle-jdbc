<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login From</title>
	</head>
	<body>
		<h1>로그인</h1>
		<div>
			<a href="${pageContext.request.contextPath}/BoardListController">홈으로</a>
		</div>
		<form action="${pageContext.request.contextPath}/LoginActionController" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="memberId">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="memberPw">
					</td>
				</tr>
			</table>
			<button type="submit">로그인</button>
		</form>
	</body>
</html>