<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BOARD LIST</title>
		<script>
			$(document).ready(function() {
				$('#rowPerPage').change(finction() {
					$('#pageForm').submit();
				})
			})
		</script>
	</head>
	
	<body>
		<h1>BOARD LIST</h1>
		
		<form id="pageForm" method="get" action="${pageContext.request.contextPath}/BoardListConteroller">
			<select name="rowPerPage" id="rowPerPage">
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
		</form>
		
		<table border="1">
			<thead>
				<tr>
					<th>board No</th>
					<th>board Title</th>
					<th>create Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${boardList}">
					<tr>
						<td>${b.boardNo}</td>
						<td>
							<a href="${pageContext.request.contextPath}">
								${b.boardTitle}
							</a>
						</td>
						<td>${b.createdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<a href="${pageContext.request.contextPath}/BoardListConteroller?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}">이전</a>
			<a href="${pageContext.request.contextPath}/BoardListConteroller?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}">다음</a>
		</div>
	</body>
</html>