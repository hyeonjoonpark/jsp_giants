<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>롯데자이언츠 선수목록</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>롯데자이언츠 선수목록</h1>
	<form>
		<table border="1">
			<tr>
				<td>선수번호</td>
				<td>선수이름</td>
				<td>선수포지션</td>
				<td>선수등록일</td>
				<td>선수등급</td>
				<td>삭제</td>
			</tr>
			<%
			request.setCharacterEncoding("UTF-8");
				try {
					Class.forName("oracle.jdbc.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					String sql = "select * from giants_player";
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()){
				%>
				<tr>
				<td><a href="modify.jsp?pid=<%=rs.getInt("pid") %>"><%=rs.getInt("pid") %></a></td>
				<td><%=rs.getString("pname") %></td>
				<td><%=rs.getString("pposition") %></td>
				<td><%=rs.getString("pdate") %></td>
				<td><%=rs.getString("pgrade") %></td>
				<td><a href="delete.jsp?pid=<%=rs.getString(1) %>">[삭제]</a></td>
				</tr>
				<% 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>