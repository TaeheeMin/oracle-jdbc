<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SIGNIN</title>
		<link href="${pageContext.request.contextPath}/resources/_bootswatch.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/_variables.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet">
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				// 1) 시작 id에 포커스
    			$('#id').focus();
			
				// 2) 유효성 체크
				// 2-1) id 유효성 체크
				$('#id').blur(function(){
					if($('#id').val() == '') {
						$('#id').focus();
					} else {
						$('#pw').focus();
					};
				});
				 // 2-2) pw 유효성 체크
				$('#pw').blur(function(){
					if($('#pw').val() == '') {
						$('#pw').focus();
					};
				});
				
				// 3) 로그인 폼 제출
				$('#loginBtn').click(function(){
					$('#loginForm').submit();
				});
			});
		</script>
	</head>
	<body>
		<h1>회원가입</h1>
		<div>
			<a href="${pageContext.request.contextPath}/BoardList">홈으로</a>
		</div>
		<form action="${pageContext.request.contextPath}/AddMember" method="post">
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