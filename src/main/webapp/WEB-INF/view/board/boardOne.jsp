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
			
	  		<span class="badge bg-info" style="float: right">Hit ${boardOne.count}</span>
			<!-- #### 게시글 #### -->
			<div class="form-group" style="padding-bottom: 20px;">
			  	<fieldset>
			    	<label class="form-label mt-4" for="readOnlyInput">TITLE</label>
			    	<input class="form-control" id="readOnlyInput" type="text" readonly="readonly" value="${boardOne.boardTitle}">
			      	<label for="exampleTextarea" class="form-label mt-4">CONTENT</label>
			      	<textarea class="form-control" id="exampleTextarea" rows="10" name="content" readonly="readonly">${boardOne.boardContent}</textarea>
			  	</fieldset>
		    </div>
			
			<!-- #### 수정 삭제 #### -->
			
			<div class="btn-group" role="group" aria-label="Basic example">
				<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/BoardList'">LIST</button>
				<c:if test="${boardOne.memberId.equals(loginMember.memberId)}">
					<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/ModifyBoard?boardNo=${boardOne.boardNo}'">UPDATE</button>
					<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/RemoveBoard?boardNo=${boardOne.boardNo}'">DELETE</button>
				</c:if>
			</div>
		</div>
	</body>
</html>