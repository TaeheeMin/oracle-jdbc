<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Mypage</title>
	</head>
	
	<body>
		<!-- #### navbar #### -->
		<jsp:include page="/inc/navbar.jsp"></jsp:include>
		
		<!-- #### content #### -->
		<div class="container">
			<div class="head">
				<h1>Mypage</h1>
				<h3><small class="text-muted">회원탈퇴</small></h3>
			</div>
			<!-- #### 수정폼 #### -->
			<form action="${pageContext.request.contextPath}/RemoveMember" method="post">
				<div class="form-group"  style="padding-bottom: 20px;">
					<fieldset disabled="">
						<label class="form-label" for="disabledInput">ID</label>
						<input class="form-control" id="disabledInput" type="text" placeholder="${loginMember.memberId}" disabled="">
					</fieldset>
				  	<label for="exampleInputPassword1" class="form-label mt-4">Password</label>
	    			<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="memberPw">
				</div>
				<button type="submit" class="btn btn-dark">submit</button>
			</form>
		</div>
	</body>
</html>