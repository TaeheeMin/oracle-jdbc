<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Mypage</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#rowPerPage').change(function() {
					$('#listForm').submit();
				});
				
				$('#search').change(function() {
					$('#listForm').submit();
				});
				
				$(window).scroll( function() {
					if ( $( this ).scrollTop() > 200 ) {
						$('.top').fadeIn();
					} else {
						$('.top').fadeOut();
					}
				});
				
				$('.top').click( function() {
					$('html, body').animate( { scrollTop : 0 }, 400 );
					return false;
				} );
			});
		</script>
	</head>
	
	<body>
		<!-- #### navbar #### -->
		<jsp:include page="/inc/navbar.jsp"></jsp:include>
		
		<!-- #### content #### -->
		<div class="container">
			<div class="head">
				<h1>Mypage</h1>
				<h3><small class="text-muted">BOARD LIST</small></h3>
			</div>
			
			<!-- #### list #### -->
			<table class="table">
				<thead>
				  	<tr class="table-active">
				  		<th><input class="form-check-input" type="checkbox" checked="checked" disabled="disabled"></th>
				    	<th>No</th>
				      	<th>TITLE</th>
				      	<th>USER</th>
				      	<th>DATE</th>
				      	<th>VIEW</th>
				    </tr>
			  	</thead>
			  	<tbody>
			  		<c:forEach var="b" items="${boardList}">
			     		<tr class="table-light">
			     			<th>
						        <input class="form-check-input" type="checkbox" value="" id="check">
			     			</th>
			      			<th>${b.boardNo}</th>
			      			<td>
						      	<a href="${pageContext.request.contextPath}/BoardOne?boardNo=${b.boardNo}">
									${b.boardTitle}
								</a>
							</td>
					      	<td>${b.memberId}</td>
					      	<td>${b.createdate.substring(0,10)}</td>
					      	<td>${b.count}</td>
		    			</tr>
					</c:forEach>
			  	</tbody>
			</table>
			<a href="${pageContext.request.contextPath}/BoardListMember?currentPage=${currentPage-1}">이전</a>
			<a href="${pageContext.request.contextPath}/BoardListMember?currentPage=${currentPage+1}">다음</a>
		</div>
		
	<!--  #### TOP 스크롤 버튼 #### -->
	<button type="button" class="top moveTopBtn">^</button>
	</body>
</html>