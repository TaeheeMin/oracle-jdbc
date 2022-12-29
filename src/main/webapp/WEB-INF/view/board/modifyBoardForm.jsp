<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Community</title>
	</head>
	
	<body>
		<!-- #### navbar #### -->
		<jsp:include page="/inc/navbar.jsp"></jsp:include>
		
		<!-- #### content #### -->
		<div class="container">
			<div class="head">
				<h1>Community</h1>
				<h3><small class="text-muted">BOARD LIST</small></h3>
			</div>
			
			<!-- #### 게시글 #### -->
			<form action="${pageContext.request.contextPath}/ModifyBoard?boardNo=${board.boardNo}" method="post">
				<div class="form-group" style="padding-bottom: 20px;">
					<fieldset>
					 	<label class="form-label mt-4" for="readOnlyInput">TITLE</label>
					 	<input class="form-control" id="readOnlyInput" type="text" name="title" placeholder="${board.boardTitle}">
					</fieldset>
					<label for="exampleTextarea" class="form-label mt-4">CONTENT</label>
					<textarea class="form-control" id="exampleTextarea" rows="10" name="content">${board.boardContent}</textarea>
				</div>
				<button type="submit" class="btn btn-dark">submit</button>
			</form>
		</div>
	</body>
</html>