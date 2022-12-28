<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 수정</title>
	</head>
	
	<body>
		<h1>게시글 수정</h1>
		<%
			
		%>
		<div>
			<a href="${pageContext.request.contextPath}/BoardListController">홈으로</a>
		</div>
		
		<form action="${pageContext.request.contextPath}/ModifyBoardActionController?boardNo=${board.boardNo}" method="post">
			<table border="1">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" style="width:90%;" value="${board.boardTitle}">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="100" name="content" >${board.boardContent}</textarea>
					</td>
				</tr>
			</table>
			<button type="submit">수정</button>
		</form>
	</body>
</html>