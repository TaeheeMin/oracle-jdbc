<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BOARD LIST</title>
		<link href="${pageContext.request.contextPath}/resources/_bootswatch.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/_variables.scss" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/bootstrap.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#rowPerPage').change(function() {
					$('#pageForm').submit();
				});
				$('#search').blur(function() {
					$('#searchForm').submit();
				}); 
			});
		</script>
	</head>
	
	<body>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-sm-2" type="search" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
	
		<div class="head">
			<div class="logo">BOARD LIST</div>
			<div class="right">
				<div class="in">
					<c:if test="${loginMember != null}">
						${loginMember.memberName}님
						<a href="${pageContext.request.contextPath}/ModifyMember">MYPAGE</a>
						<a href="${pageContext.request.contextPath}/Logout">LOGOUT</a>
					</c:if>
					<c:if test="${loginMember == null}">
						<a href="${pageContext.request.contextPath}/LoginController">LOGIN</a>
						<a href="${pageContext.request.contextPath}/AddMember">SIGNIN</a>
					</c:if>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="board_nav">
			<span>Community</span>
			<form id="pageForm" method="get" action="${pageContext.request.contextPath}/BoardList">
				<select name="rowPerPage" id="rowPerPage">
					<c:if test="${rowPerPage == 10}">
						<option value="10" selected="selected">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
					</c:if>
					<c:if test="${rowPerPage == 20}">
						<option value="10">10</option>
						<option value="20" selected="selected">20</option>
						<option value="30">30</option>
					</c:if>
					<c:if test="${rowPerPage == 30}">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30" selected="selected">30</option>
					</c:if>
				</select>
			</form>
			</div>
			
			<div class="container">
				<div class="board-list">
					<table class="board-list table">
						<thead class="board-listheader">
							<tr>
								<th>No</th>
								<th>TITLE</th>
								<th>USER</th>
								<th>DATE</th>
							</tr>
						</thead>
						<tbody class="board-list teble ">
							<c:forEach var="b" items="${boardList}">
								<tr>
									<td>${b.boardNo}</td>
									<td>
										<a href="${pageContext.request.contextPath}/BoardOne?boardNo=${b.boardNo}">
											${b.boardTitle}
										</a>
									</td>
									<td>${b.memberId}</td>
									<td>${b.createdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">Type</th>
				      <th scope="col">Column heading</th>
				      <th scope="col">Column heading</th>
				      <th scope="col">Column heading</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr class="table-active">
				      <th scope="row">Active</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr>
				      <th scope="row">Default</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="table-primary">
				      <th scope="row">Primary</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="table-secondary">
				      <th scope="row">Secondary</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="table-success">
				      <th scope="row">Success</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="table-danger">
				      <th scope="row">Danger</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="table-warning">
				      <th scope="row">Warning</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="table-info">
				      <th scope="row">Info</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="table-light">
				      <th scope="row">Light</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="table-dark">
				      <th scope="row">Dark</th>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				  </tbody>
				</table>
				
			</div>
			
			<a href="${pageContext.request.contextPath}/AddBoard">글등록</a> 
			<form id="searchForm" method="get" action="${pageContext.request.contextPath}/BoardList">
				<input id="search" name="word" type="text" placeholder="검색">
			</form>
			<div class="paginate">
				<a href="${pageContext.request.contextPath}/BoardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
				<a href="${pageContext.request.contextPath}/BoardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
			</div>
		</div>
	</body>
</html>