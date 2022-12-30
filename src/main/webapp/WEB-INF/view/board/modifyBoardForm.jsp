<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Community</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				// 1) 시작 title에 포커스
    			$('#title').focus();
			
				// 2) 유효성 체크
				// 2-1) title 유효성 체크
				$('#title').blur(function(){
					if($('#title').val() == '') {
						$('#title').attr('class','form-control is-invalid');
						$('#titleMsg').text('제목을 입력해주세요');
						$('#title').focus();
					} else {
						$('#title').attr('class','form-control is-valid');
						$('#titleMsg').attr('class','valid-feedback');
						$('#titleMsg').text('');
						$('#content').focus();
					};
				});
				
				 // 2-2) content 유효성 체크
				$('#content').blur(function(){
					if($('#content').val() == '') {
						$('#content').attr('class','form-control is-invalid');
						$('#contentMsg').text('내용을 입력해주세요');
						$('#content').focus();
					} else {
						$('#content').attr('class','form-control is-valid');
						$('#contentMsg').text('');
					};
				});
				
				// 3) 수정 폼 제출
				$('#modifyBoardBtn').click(function(){
					$('#modifyBoardForm').submit();
				});
			});
		</script>
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
			<form action="${pageContext.request.contextPath}/ModifyBoard?boardNo=${board.boardNo}" method="post" id="modifyBoardForm">
				<div class="form-group" style="padding-bottom: 20px;">
					<fieldset>
					 	<label class="form-label mt-4" for="inputDefault">TITLE</label>
					 	<input class="form-control" type="text" name="title" id="title" value="${board.boardTitle}">
					 	<div class="invalid-feedback" id="titleMsg"></div>
					 	
						<label for="exampleTextarea" class="form-label mt-4">CONTENT</label>
						<textarea class="form-control" id="content" rows="10" name="content">${board.boardContent}</textarea>
						<div class="invalid-feedback" id="contentMsg"></div>
					</fieldset>
				</div>
				<button type="button" class="btn btn-dark" id="modifyBoardBtn">submit</button>
			</form>
		</div>
	</body>
</html>