<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="form-group">
			  	<fieldset>
			    	<label class="form-label mt-4" for="readOnlyInput">TITLE</label>
			    	<input class="form-control" id="readOnlyInput" type="text" readonly="readonly" value="${board.boardTitle}">
			  	</fieldset>
			</div>
			 <div class="form-group" style="padding-bottom: 20px;">
			      <label for="exampleTextarea" class="form-label mt-4">CONTENT</label>
			      <textarea class="form-control" id="exampleTextarea" rows="10" name="content" readonly="readonly">${board.boardContent}</textarea>
		    </div>
			
			<!-- #### 수정 삭제 #### -->
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="button" class="btn btn-dark">
					목록
				</button>
				<button type="button" class="btn btn-dark">
					수정
				</button>
				<button type="button" class="btn btn-dark">
					삭제
				</button>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/BoardList">목록</a>
				<a href='${pageContext.request.contextPath}/ModifyBoard?boardNo=${board.boardNo}'>수정</a>
				<a href='${pageContext.request.contextPath}/RemoveBoard?boardNo=${board.boardNo}'>삭제</a>
			</div>
		</div>
	</body>
</html>