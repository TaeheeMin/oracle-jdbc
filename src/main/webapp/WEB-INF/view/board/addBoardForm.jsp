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
			<div class="bs-component">
				<form action="${pageContext.request.contextPath}/AddBoard" method="post">
	  				<fieldset>
	    				<div class="form-group row">
	    					<label class="col-form-label mt-4" for="inputDefault">TITLE</label>
	      					<div class="col-sm-10">
	  							<input type="text" class="form-control" id="inputDefault" placeholder="제목을 입력해 주세요" name="title" >
						    </div>
					    </div>
					    <div class="form-group" style="padding-bottom: 20px;">
						      <label for="exampleTextarea" class="form-label mt-4">CONTENT</label>
						      <textarea class="form-control" id="exampleTextarea" rows="10" name="content" placeholder="내용을 입력해 주세요"></textarea>
					    </div>
	    				<button type="submit" class="btn btn-dark">Submit</button>
	  				</fieldset>
				</form>
			</div>
		</div>
	</body>
</html>