<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<link href="${pageContext.request.contextPath}/resources/_bootswatch.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/_variables.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$(window).scroll( function() {
					if ( $( this ).scrollTop() > 200 ) {
						$('#navbar').fadeIn();
					} else {
						$('#navbar').fadeOut();
					}
				});
				
				$(window).scroll( function() {
					if ( $( this ).scrollTop() > 200 ) {
						$('.top').fadeIn();
					} else {
						$('.top').fadeOut();
					}
				});
				$('.top').click( function() {
					$('html, body').animate( { scrollTop : 0 }, 400 );
					return false;
				} );
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
				          	<a class="nav-link" href="#">About</a>
				        </li>
				        <li class="nav-item">
				          	<a class="nav-link" href="${pageContext.request.contextPath}/BoardList">Community</a>
				        </li>
      				</ul>
				</div>
			</div>
		</nav>
		
		<!-- #### 상단 #### -->
		<div class="container">
			<div class="head">
				<h1>Home</h1>
				<h3><small class="text-muted">회원가입, 로그인 넣기</small></h3>
				<a href="${pageContext.request.contextPath}/LoginController">LOGIN</a>
				<a href="${pageContext.request.contextPath}/AddMember">SIGNIN</a>
			</div>
		</div>
		
		<!-- #### about #### -->
		<div class="container">
			<div class="head">
				<h1>About</h1>
				<h3><small class="text-muted">게시판 설명 넣기 이 프로젝트 설명 넣어주기, 어떤 기술 썼는지 어떤 기능이 있는지 추가하면 좋을거같음</small></h3>
			</div>
		</div>
	</body>
</html>