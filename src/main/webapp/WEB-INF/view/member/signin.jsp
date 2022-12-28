<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
	</head>
	<body>
		<h1>회원가입</h1>
		<div>
			<a href="${pageContext.request.contextPath}/BoardListController">홈으로</a>
		</div>
		<form action="${pageContext.request.contextPath}/SigninActionController" method="post">
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
						<input type="password" name="memberPw1">
						<input type="password" name="memberPw2">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="memberName">
					</td>
				</tr>
			</table>
			<button type="submit">회원가입</button>
		</form>
	</body>
</html>