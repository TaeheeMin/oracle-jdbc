<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>개인정보 수정</title>
	</head>
	
	<body>
		<h1>개인정보 수정</h1>
		<div>
			<a href="${pageContext.request.contextPath}/BoardList">홈으로</a>
			<a href="${pageContext.request.contextPath}/RemoveMember">회원탈퇴</a>
		</div>
		
		<form action="${pageContext.request.contextPath}/ModifyMember" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>
						${member.memberId}
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="memberName" placeholder="${member.memberName}">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="memberPw">
					</td>
				</tr>
			</table>
			<button type="submit">수정</button>
		</form>
	</body>
</html>