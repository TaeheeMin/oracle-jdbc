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
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// 1) 스크롤 top
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
				});
				
				// 2) about 이동
				$('#about').click( function() {
					$('html, body').animate( { scrollTop : 1500 }, 200 );
					return false;
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
				<h1>GOODEE</h1>
				<h3><small class="text-muted">GOODEE board</small></h3>
				<c:if test="${loginMember.memberId == null}">
					<a href="${pageContext.request.contextPath}/LoginController">LOGIN &nbsp;</a>
					<a href="${pageContext.request.contextPath}/AddMember">SIGNIN</a>
				</c:if>
				<img src="${pageContext.request.contextPath}/img/home4.PNG" style="height:1200px; width: 400px">
			</div>
		</div>
		
		<!-- #### about #### -->
		<div class="container">
			<div class="head">
				<h1>About</h1>
				<h3><small class="text-muted">게시판 설명 넣기 이 프로젝트 설명 넣어주기 오라클이용한 게시판 구현</small></h3>
				<img src="${pageContext.request.contextPath}/img/home4.PNG" style="height:1200px; width: 400px">
			</div>
			
			<ul class="nav nav-tabs" role="tablist">
			  <li class="nav-item" role="presentation">
			    <a class="nav-link active" data-bs-toggle="tab" href="#home" aria-selected="true" role="tab">기능</a>
			  </li>
			  <li class="nav-item" role="presentation">
			    <a class="nav-link" data-bs-toggle="tab" href="#profile" aria-selected="false" tabindex="-1" role="tab">Profile</a>
			  </li>
			  <li class="nav-item" role="presentation">
			    <a class="nav-link disabled" href="#" aria-selected="false" tabindex="-1" role="tab">Disabled</a>
			  </li>
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">About</a>
			      <a class="dropdown-item" href="#">Another action</a>
			      <a class="dropdown-item" href="#">Something else here</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">Separated link</a>
			    </div>
			  </li>
			</ul>
			<div id="myTabContent" class="tab-content">
			  <div class="tab-pane fade show active" id="home" role="tabpanel">
			  	<p>
			  		오라클 DB를 이용해서 게시판 구현
			  		#MVC #ORACLE #MODEL2 #CURD #JQUERY #CSS
			  	</p>
			  </div>
			  <div class="tab-pane fade" id="profile" role="tabpanel">
			    <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
			  </div>
			  <div class="tab-pane fade" id="dropdown1">
			    <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>
			  </div>
			  <div class="tab-pane fade" id="dropdown2">
			    <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.</p>
			  </div>
			</div>
		</div>
		<!--  #### TOP 스크롤 버튼 #### -->
		<button type="button" class="top moveTopBtn">^</button>
	</body>
</html>