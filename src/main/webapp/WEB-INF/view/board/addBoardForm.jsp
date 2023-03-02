<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				
				// 3) 등록 폼 제출
				$('#addBoardBtn').click(function(){
					$('#addBoardForm').submit();
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
			<div class="bs-component">
				<form action="${pageContext.request.contextPath}/AddBoard" method="post" id="addBoardForm">
				    <div class="form-group" style="padding-bottom: 20px;">
		  				<fieldset>
	    					<label class="col-form-label mt-4" for="inputDefault">TITLE</label>
	 							<input type="text" class="form-control" id="title" placeholder="TITLE" name="title" >
	 							<div class="invalid-feedback" id="titleMsg"></div>
						    <label for="exampleTextarea" class="form-label mt-4">CONTENT</label>
						    <textarea class="form-control" rows="10" id="content" name="content" placeholder="CONTENT"></textarea>
					    	<div class="invalid-feedback" id="contentMsg"></div>
		  				</fieldset>
			    	</div>
   					<button type="button" class="btn btn-dark" id="addBoardBtn">Submit</button>
				</form>
			</div>
		</div>
	</body>
</html>