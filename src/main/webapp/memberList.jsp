<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	// 1) controller
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println("currentPage  : " + currentPage);
	};
	
	// 1-1) 페이징 처리
	int rowPerPage = 10;
	int beginRow = (rowPerPage * (currentPage - 1)) + 1;
	int endRow = beginRow + rowPerPage - 1;
	
	// 2) model
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","gdj58","java1234");
	System.out.println("연결 성공");

	String sql = "SELECT t2.rnum, t2.name"
			+ " FROM (SELECT rownum rnum, t.member_name name"
			+ "			 FROM (select member_name"
			+ "					 from member ORDER BY member_name ASC) t) t2"
			+ " WHERE t2.rnum BETWEEN ? AND ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, beginRow);
	stmt.setInt(2, endRow);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>memberList</title>
	</head>
	
	<body>
		<!-- 3) view -->
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()){
						
				%>
						<tr>
							<td><%=rs.getInt("rnum")%></td>
							<td><%=rs.getString("name")%></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			if(currentPage <= 1){
		%>
				<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage+1%>">다음</a>
		<%
			} else {
		%>
				<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage-1%>">이전</a>
				<a href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage+1%>">다음</a>
		<%
			}
		%>
	</body>
</html>