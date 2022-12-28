<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
	</head>
	
	<body>
		<h1>회원탈퇴</h1>
		<div>
			<a href="${pageContext.request.contextPath}/BoardList">홈으로</a>
		</div>
		
		<form action="${pageContext.request.contextPath}/RemoveMember" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>
						${loginMember.memberId}
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="memberPw">
					</td>
				</tr>
			</table>
			<button type="submit">탈퇴</button>
		</form>
	</body>
</html>