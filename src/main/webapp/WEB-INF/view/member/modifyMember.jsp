<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Mypage</title>
	</head>
	
	<body>
		<!-- #### navbar #### -->
		<jsp:include page="/inc/navbar.jsp"></jsp:include>
		
		<!-- #### content #### -->
		<div class="container">
			<div class="head">
				<h1>Mypage</h1>
				<h3><small class="text-muted">정보수정</small></h3>
			</div>
			
			<!-- #### 수정폼 #### -->
			<form action="${pageContext.request.contextPath}/ModifyMember" method="post">
				<div class="form-group"  style="padding-bottom: 20px;">
					<fieldset>
						<fieldset disabled="disabled">
							<label class="form-label" for="disabledInput">ID</label>
							<input class="form-control" id="disabledInput" type="text" value="${member.memberId}" disabled="disabled">
						</fieldset>
					  	<label class="col-form-label mt-4" for="inputDefault">USER NAME</label>
					  	<input type="text" class="form-control" placeholder="${member.memberName}" id="inputDefault" name="memberName">
					  	<label for="exampleInputPassword1" class="form-label mt-4">Password</label>
		    			<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="memberPw">
					</fieldset>
				</div>
				<button type="submit" class="btn btn-dark">submit</button>
			</form>
		</div>
	</body>
</html>