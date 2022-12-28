<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BOARD LIST</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<link href="${pageContext.request.contextPath}/style.css" rel="stylesheet">
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
			<div>
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
			
			<div class="board-list">
				<table class="board-list table">
					<thead class="board-listheader">
						<tr>
							<th>게시글 번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
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
				<div class="center">
					<a href="${pageContext.request.contextPath}/AddBoard">글등록</a> 
				</div>
			</div>
			
			<form id="searchForm" method="get" action="${pageContext.request.contextPath}/BoardList">
				<input id="search" name="word" type="text" placeholder="검색">
			</form>
			<div>
				<a href="${pageContext.request.contextPath}/BoardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
				<a href="${pageContext.request.contextPath}/BoardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
			</div>
		</div>
		
	</body>
</html>