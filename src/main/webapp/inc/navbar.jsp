<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="${pageContext.request.contextPath}/resources/_bootswatch.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/_variables.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet">
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
				          	<a class="nav-link" href="#">About</a>
				        </li>
				        <li class="nav-item">
				          	<a class="nav-link" href="${pageContext.request.contextPath}/BoardList">Community</a>
				        </li>
				        <li class="nav-item dropdown">
				          	<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Account</a>
			          		<div class="dropdown-menu">
			            		<a class="dropdown-item" href="${pageContext.request.contextPath}/ModifyMember">Mypage</a>
					            <a class="dropdown-item" href="#">게시글 관리?</a>
					            <a class="dropdown-item" href="${pageContext.request.contextPath}/RemoveMember">회원탈퇴</a>
			          		</div>
				        </li>
      				</ul>
			      	<div class="d-flex">
						<div style="padding-right: 1rem">${loginMember.memberName}님</div>
						<a style="padding-right: 1rem" href="${pageContext.request.contextPath}/Logout">LOGOUT</a>
					</div>
				</div>
			</div>
		</nav>
	</body>
</html>