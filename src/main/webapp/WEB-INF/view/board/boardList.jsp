<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Community</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#rowPerPage').change(function() {
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
				<h1>Community</h1>
				<h3><small class="text-muted">BOARD LIST</small></h3>
			</div>
			
			<!-- #### 글쓰기 #### -->
			<a href="${pageContext.request.contextPath}/AddBoard">글쓰기</a>
			
			<!-- #### 검색 #### -->
			<div style="float: right;">
				<form id="listForm" method="get" action="${pageContext.request.contextPath}/BoardList">
       				<select name="rowPerPage" id="rowPerPage" class="">
						<c:if test="${rowPerPage == 10}">
							<option value="10" selected="selected">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
						</c:if>
						<c:if test="${rowPerPage == 20}">
							<option value="10">10</option>
							<option value="20" selected="selected">20</option>
							<option value="30">30</option>
						</c:if>
						<c:if test="${rowPerPage == 30}">
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30" selected="selected">30</option>
						</c:if>
					</select>
					
					<select name="category" id="category">
						<option value="board_title">제목</option>
						<option value="board_content">내용</option>
						<option value="member_id">작성자</option>
					</select>
					
					<input type="search" placeholder="Search" name="word" id="search" value="${word}">
					
       				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
			
			<!-- #### list #### -->
			<table class="table">
				<thead>
				  	<tr class="table-active">
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
			
			<!-- #### 페이징 #### -->
			<div class="pagination-center" style="height: 50px;width: 250px;">
		  		<ul class="pagination" >
			    	<li class="page-item disabled">
			      		<a class="page-link" href="#">&laquo;</a>
			    	</li>
			    	<li class="page-item active">
			      		<a class="page-link" href="#">1</a>
			    	</li>
		    		<li class="page-item">
			      		<a class="page-link" href="#">2</a>
				    </li>
				    <li class="page-item">
				      	<a class="page-link" href="#">3</a>
				    </li>
				    <li class="page-item">
				      	<a class="page-link" href="#">4</a>
				    </li>
				    <li class="page-item">
				      	<a class="page-link" href="#">5</a>
				    </li>
				    <li class="page-item">
				      	<a class="page-link" href="#">&raquo;</a>
				    </li>
			  	</ul>
			</div>
			<a href="${pageContext.request.contextPath}/BoardList?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
			<a href="${pageContext.request.contextPath}/BoardList?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
		</div>
		
	<!--  #### TOP 스크롤 버튼 #### -->
	<button type="button" class="top moveTopBtn">^</button>
	</body>
</html>