<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>홈</title>
	</head>
	
	<body>
		<!-- 
			1) 회원가입
			2) 로그인
			=> 로그인 유무에 따라 메뉴구성 분기
			
			1) 로그인 전
			회원가입, 로그인
			
			2) 로그인 후
			로그아웃, 회원정보, 게시판
		
		 -->
		 <div class="head">
			<div class="logo">BOARD LIST</div>
			<div class="right_f">
				<div class="in">
					<div>
						<a href="${pageContext.request.contextPath}/LoginFormController">LOGIN</a>
						<a href="${pageContext.request.contextPath}/SigninController">SIGNIN</a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>