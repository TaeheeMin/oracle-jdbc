<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Mypage</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				// 1) 시작 password에 포커스
    			$('#password').focus();
			
				// 2) 유효성 체크
				$('#password').blur(function(){
					if($('#password').val() == '') {
						$('#password').attr('class','form-control is-invalid');
						$('#passwordMsg').text('비밀번호을 입력해주세요');
						$('#password').focus();
					} else {
						$('#password').attr('class','form-control is-valid');
						$('#passwordMsg').text('');
					};
				});
				
				// 3) 수정 폼 제출
				$('#removeMemberBtn').click(function(){
					$('#removeMemberForm').submit();
				});
			});
		</script>
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
			<form action="${pageContext.request.contextPath}/RemoveMember" method="post" id="removeMemberForm">
				<div class="form-group" style="padding-bottom: 20px;">
					<fieldset>
						<fieldset disabled="disabled">
							<label class="form-label" for="disabledInput">ID</label>
							<input class="form-control" type="text" placeholder="${loginMember.memberId}" disabled="disabled">
						</fieldset>
					  		<label for="exampleInputPassword1" class="form-label mt-4">Password</label>
		    				<input type="password" class="form-control" id="password" placeholder="Password" name="memberPw">
							<div class="invalid-feedback" id="passwordMsg"></div>		    				
					</fieldset>
				</div>
				<button type="button" class="btn btn-dark" id="removeMemberBtn">submit</button>
			</form>
		</div>
	</body>
</html>