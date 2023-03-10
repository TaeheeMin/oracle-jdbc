<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>LOGIN</title>
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
				$('#title').blur(function(){
					if($('#id').val() == '') {
						$('#id').attr('class','form-control is-invalid');
						$('#idMsg').text('아이디를 입력해주세요');
						$('#id').focus();
					} else {
						$('#id').attr('class','form-control is-valid');
						$('#idMsg').attr('class','valid-feedback');
						$('#idMsg').text('');
						$('#pw').focus();
					};
				});
				 // 2-2) pw 유효성 체크
				$('#pw').blur(function(){
					if($('#pw').val() == '') {
						$('#pw').attr('class','form-control is-invalid');
						$('#pwMsg').text('비밀번호를 입력해주세요');
						$('#pw').focus();
					} else {
						$('#pw').attr('class','form-control is-valid');
						$('#pwMsg').attr('class','valid-feedback');
						$('#pwMsg').text('');
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
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
			<div class="container-fluid">
		    	<a class="navbar-brand" href="${pageContext.request.contextPath}/Home">GOODEE</a>
		    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      		<span class="navbar-toggler-icon"></span>
		    	</button>
    			<div class="collapse navbar-collapse" id="navbarColor03">
      				<ul class="navbar-nav me-auto">
				        <li class="nav-item">
				          	<a class="nav-link active" href="${pageContext.request.contextPath}/Home">Home
				            	<span class="visually-hidden">(current)</span>
				          	</a>
				        </li>
				        <li class="nav-item">
				          	<a class="nav-link" href="${pageContext.request.contextPath}/Home" id="about">About</a>
				        </li>
				        <li class="nav-item">
				          	<a class="nav-link" href="${pageContext.request.contextPath}/BoardList">Community</a>
				        </li>
				        <c:if test="${loginMember.memberId != null}">
				        	<li class="nav-item dropdown">
					          	<a class="nav-link dropdown-toggle show" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Account</a>
				          		<div class="dropdown-menu" data-bs-popper="static">
				            		<a class="dropdown-item" href="${pageContext.request.contextPath}/ModifyMember">Mypage</a>
						            <a class="dropdown-item" href="${pageContext.request.contextPath}/BoardListMember">게시글 관리</a>
						            <a class="dropdown-item" href="${pageContext.request.contextPath}/RemoveMember">회원탈퇴</a>
				          		</div>
					        </li>
						</c:if>
      				</ul>
      				<c:if test="${loginMember.memberId != null}">
				      	<div class="d-flex">
							<div style="padding-right: 1rem">${loginMember.memberName}님</div>
							<a style="padding-right: 1rem" href="${pageContext.request.contextPath}/Logout">LOGOUT</a>
						</div>
					</c:if>
				</div>
			</div>
		</nav>
		
		<!-- #### 상단 #### -->
		<div class="container">
			<div class="head">
				<h1>Login</h1>
				<h3><small class="text-muted">GOODEE board</small></h3>
			</div>
		</div>
		<div style="width: 0px; margin:auto; line-height:0px" >
		<div class="card" style="float: center; width: 500px;">
		  	<div class="card-body">
			  	<h4 class="card-title">LOGIN</h4>
			    <form action="${pageContext.request.contextPath}/LoginController" method="post" id="loginForm">
					<div class="form-group" style="padding-bottom: 20px;">
						<fieldset>
							<label class="col-form-label">ID</label>
							<input type="text" class="form-control" name="memberId" id="id">
					  		<div class="invalid-feedback" id="idMsg"></div>
					  		<label class="form-label mt-4">Password</label>
		    				<input type="password" class="form-control" id="pw" placeholder="Password" name="memberPw">
							<div class="invalid-feedback" id="pwMsg"></div>		    				
						</fieldset>
					</div>
					<button class="btn btn-secondary my-2 my-sm-0" type="button" id="loginBtn">login</button>
				</form>
		 	 </div>
		  </div>
	  </div>
	</body>
</html>