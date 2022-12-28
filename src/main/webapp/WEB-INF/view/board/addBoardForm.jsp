<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 등록</title>
	</head>
	
	<body>
		<h1>게시글 등록</h1>
		
		<div>
			<a href="${pageContext.request.contextPath}/BoardList">홈으로</a>
		</div>
		
		<form action="${pageContext.request.contextPath}/AddBoard" method="post">
			<table border="1">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" style="width:90%;">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="100" name="content"></textarea>
					</td>
				</tr>
			</table>
			<button type="submit">등록</button>
		</form>
	</body>
</html>